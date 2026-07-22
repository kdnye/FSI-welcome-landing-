# FSI Welcome Page (`home.freightservices.net`)

Static landing page for the Freight Services app suite. No database, no auth,
no Python — a single `index.html` styled with the Fleet UI Kit (`fsi.css`,
verbatim copy of the canonical kit) served by nginx on Cloud Run.

## Quick Start

```bash
git clone https://github.com/kdnye/FSI-welcome-landing-.git
cd FSI-welcome-landing-
docker build -t fsi-home .
docker run --rm -p 8080:8080 fsi-home
# open http://localhost:8080  — and check http://localhost:8080/healthz
```

No env vars, no secrets, no Cloud SQL. Without Docker, any static server
works for previewing: `cd public && python3 -m http.server 8080`.

## What's here

- `public/index.html` — the welcome page. Links to every mapped service
  (Quotes, POD, Asset Tracking, Expenses, Lifecycle, Internal Comms).
- `public/css/fsi.css` — **verbatim** Fleet UI Kit (canonical copy from the
  FSI INBOX repo). Do not edit it here; if the kit changes, re-copy it from
  the canonical source.
- `public/css/home.css` — page-specific styles layered on the kit tokens
  (hero, card grid, footer).
- `public/404.html` — kit-styled not-found page.
- `nginx.conf` — serves the static files, exposes `GET /healthz` returning
  `{"status": "ok"}` (FSI standard).
- `Dockerfile` — `nginx-unprivileged` (non-root, listens on 8080).

## Architecture

```
browser ──HTTPS──► Cloud Run domain mapping (home.freightservices.net)
                        │
                        ▼
                  fsi-home service (nginx, scale-to-zero)
                        │
                        ▼
                  static files baked into the image (public/)
```

There is no backend: every deploy bakes the current `public/` directory into
the container image. Dark mode follows the FSI standard — an inline script
sets `data-theme` and `data-bs-theme` before first paint from
`localStorage['fsiTheme']`, falling back to `prefers-color-scheme`; a navbar
button toggles it. All routes are public; there is nothing to authenticate.

## Editing the service list

Each service is one `<a class="fleet-card home-card">` block in
`public/index.html`. Copy a block, change the href, title, domain, and
description. No build step.

Apps on FSI Internal Suite SSO (expenses, lifecycle, comms, pod) link
directly to their Microsoft sign-in route (`/login/oidc` on expenses,
`/auth/login/oidc` on the rest) so one click from home lands on SSO.
Quotes (separate app registration) and assets (Streamlit shows its own
sign-in page at the root) keep plain root links.

## Deployment

```bash
gcloud run deploy fsi-home \
  --source . \
  --project quote-tool-483716 \
  --region us-central1 \
  --allow-unauthenticated
```

The service scales to zero; at internal traffic levels the cost is
effectively $0.

### Map the domain (one-time, after the first deploy)

Same pattern as the other FSI services:

1. Cloud Run → **Domain mappings** → **Add mapping**.
2. Service: `fsi-home`, region `us-central1`, domain
   `home.freightservices.net`.
3. Add the DNS record the mapping wizard shows (CNAME
   `home` → `ghs.googlehosted.com`, same as the existing subdomains).
4. Wait for the certificate to provision, then visit
   https://home.freightservices.net.

### Health check

`GET /healthz` → `{"status": "ok"}`.
