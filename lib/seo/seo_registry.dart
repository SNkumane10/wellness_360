// lib/seo/seo_registry.dart

import 'seo_metadata.dart';

/// 📚 SEO Registry
///
/// Centralised registry of SEO metadata for **public-facing routes**.
///
/// This registry serves as:
/// - A single source of truth for search metadata
/// - Living documentation for marketing and compliance
/// - Input for future sitemap, OpenGraph, and prerender pipelines
///
/// ❗ Rules:
/// - Every public route must have exactly one entry here
/// - Authenticated or clinical routes must NOT be listed
/// - Paths must match `go_router` paths exactly
class SeoRegistry {
  /// 🏠 Home page
  static const home = SeoMetadata(
    path: "/",
    title: "Wellness360 | Doctor-Led Metabolic Health",
    description:
        "A clinician-led metabolic health and lifestyle medicine platform, led by Dr Bongiwe Vilakazi.",
  );

  /// 🩺 About / Clinical leadership
  static const about = SeoMetadata(
    path: "/about",
    title: "About Wellness360 | Clinical Leadership",
    description:
        "Learn about Wellness360’s clinical philosophy and the medical leadership behind our programmes.",
  );

  /// 💳 Pricing
  static const pricing = SeoMetadata(
    path: "/pricing",
    title: "Wellness360 Pricing | Transparent Monthly Care",
    description:
        "Clear, clinician-guided programmes with transparent monthly pricing.",
  );

  /// 🛡 Patient safety
  static const safety = SeoMetadata(
    path: "/safety",
    title: "Patient Safety | Wellness360",
    description:
        "How Wellness360 protects patient safety through doctor-led protocols.",
  );
}
