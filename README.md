# K S Jewellers & Works – Catalogue & Admin Guide

Catalogue website for **K S Jewellers & Works, Kurnool**.

- **Public Catalogue:** `index.html` (or your live site URL)
- **Family Admin Panel:** `/admin.html`

---

## 👨‍👩‍👧 Family Daily Guide (How to Manage the Shop)

### 1. How to Open & Log In
1. Open your website link and add `/admin.html` at the end (for example: `https://your-site-name.netlify.app/admin.html`).
2. Enter your email and password created in Supabase Auth.
3. Tap **Log in**. Once logged in, the daily control panel will appear.

### 2. Set Today’s Rate (Every Morning)
1. In the **Today’s rate** section:
   - Enter today's **22K gold** rate (₹ per gram).
   - Enter today's **24K gold** rate (₹ per gram).
   - Enter today's **Silver** rate (₹ per gram).
   *(Leave any box empty if you don't want to display it on the site).*
2. Tap **Save rate**. The rates immediately update on the public website.

### 3. Add a New Design
1. In the **Add a design** section:
   - **Photo:** Tap the box to take a picture with your phone camera or choose from your gallery.
   - **Metal:** Tap **Gold** or **Silver**.
   - **Category:** Choose the category (Necklaces, Chains, Earrings, Jhumkas, Rings, Bangles, Bracelets, Pendants, Pooja items, or Others).
   - **Name:** Type a short name (e.g., *Peacock Jhumka*).
   - **Purity:** Automatically set (e.g., 91.6 KDM), but you can adjust it if needed.
   - **Weight / Length / Details:** Optional fields to help customers (e.g., *Approx. 12 g*, *18 inch*).
2. Tap **Publish to website**. The photo uploads directly and appears live in the catalogue instantly.

### 4. Mark an Item as Sold or Hide It
1. Scroll down to **Recent designs**.
2. Find the design:
   - Tap **Sold** to hide it from customers on the public catalogue.
   - If available again, tap **Show** to make it visible again.
   - Tap **Delete** only if you want to permanently delete the design and its photo.

---

## 🚀 How to Deploy (Netlify)

This project has no build step and requires no frameworks.

### Deploying via Netlify:
1. Log in to [Netlify](https://app.netlify.com).
2. Click **Add new site** > **Import an existing project**.
3. Select **GitHub** and authorize if needed.
4. Pick the repository: `nik-nam-is-nani/KS_jewellerys_works`.
5. Configuration settings:
   - **Branch to deploy:** `main`
   - **Build command:** *(leave empty)*
   - **Publish directory:** `.`
6. Click **Deploy**.
7. Netlify will assign a live URL (e.g. `https://ks-jewellers-works.netlify.app`).
