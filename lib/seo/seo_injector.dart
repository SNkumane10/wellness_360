// lib/seo/seo_injector.dart

import 'package:web/web.dart' as web;
import 'seo_metadata.dart';

/// 🧩 SEO Injector (Web-only)
///
/// Applies SEO and canonical metadata to the document `<head>` at runtime.
///
/// Designed to be:
/// - Called on **route resolution** (via `go_router`)
/// - Safe to call repeatedly (idempotent)
/// - Forward-compatible with prerendering, sitemaps, and static snapshots
///
/// ⚠️ IMPORTANT:
/// This logic is intentionally **web-only** and must not be used
/// on mobile or desktop targets.
void applySeo(SeoMetadata meta) {
  final document = web.window.document;

  // ─────────────────────────────────────────────
  // 🏷 Page title
  // <title>...</title>
  // ─────────────────────────────────────────────
  document.title = meta.title;

  // ─────────────────────────────────────────────
  // 🔁 Create or update a <meta> tag
  // ─────────────────────────────────────────────
  void upsertMeta(String name, String content) {
    final head = document.head;
    if (head == null) return;

    final existing = head.querySelector(
      'meta[name="$name"]',
    ) as web.HTMLMetaElement?;

    if (existing != null) {
      // ♻️ Update existing meta tag
      existing.content = content;
    } else {
      // ➕ Insert new meta tag
      final element = document.createElement("meta") as web.HTMLMetaElement
        ..name = name
        ..content = content;

      head.append(element);
    }
  }

  // ─────────────────────────────────────────────
  // 🔗 Create or update a <link> tag
  // ─────────────────────────────────────────────
  void upsertLink(String rel, String href) {
    final head = document.head;
    if (head == null) return;

    final existing = head.querySelector(
      'link[rel="$rel"]',
    ) as web.HTMLLinkElement?;

    if (existing != null) {
      // ♻️ Update existing link tag
      existing.href = href;
    } else {
      // ➕ Insert new link tag
      final element = document.createElement("link") as web.HTMLLinkElement
        ..rel = rel
        ..href = href;

      head.append(element);
    }
  }

  // ─────────────────────────────────────────────
  // 📝 Meta description
  // <meta name="description" ... />
  // ─────────────────────────────────────────────
  upsertMeta("description", meta.description);

  // ─────────────────────────────────────────────
  // 🤖 Robots directive
  // <meta name="robots" ... />
  // ─────────────────────────────────────────────
  upsertMeta(
    "robots",
    meta.index ? "index, follow" : "noindex",
  );

  // ─────────────────────────────────────────────
  // 🔗 Canonical URL
  // <link rel="canonical" ... />
  // ─────────────────────────────────────────────
  final canonicalUrl = meta.canonical ?? meta.path;
  upsertLink("canonical", canonicalUrl);
}
