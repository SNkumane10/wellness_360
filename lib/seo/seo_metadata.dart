// lib/seo/seo_metadata.dart

/// 🧠 SEO Metadata Model
///
/// Represents all search-engine–relevant metadata for a single route/page.
///
/// This model is:
/// - URL-first (aligned with `go_router`)
/// - Framework-agnostic (can power prerendering, sitemaps, OG tags later)
/// - Safe for regulatory environments (explicit indexing control)
///
/// Every **public-facing route** must have exactly one `SeoMetadata` entry.
class SeoMetadata {
  /// 🏷 Page title
  ///
  /// Maps to:
  /// ```html
  /// <title>...</title>
  /// ```
  ///
  /// Best practice:
  /// - ≤ 60 characters
  /// - Brand included where appropriate
  final String title;

  /// 📝 Meta description
  ///
  /// Maps to:
  /// ```html
  /// <meta name="description" content="..." />
  /// ```
  ///
  /// Best practice:
  /// - 150–160 characters
  /// - Clear, human-readable, non-promotional
  final String description;

  /// 🔗 Canonical path for this page
  ///
  /// Example:
  /// - `/`
  /// - `/about`
  /// - `/programmes/h1-lifestyle`
  ///
  /// This becomes critical later for:
  /// - Sitemap generation
  /// - Canonical URLs
  /// - Prerender snapshots
  final String path;

  /// 🤖 Search engine indexing flag
  ///
  /// Controls:
  /// ```html
  /// <meta name="robots" content="index, follow" />
  /// ```
  ///
  /// Set to `false` for:
  /// - Authenticated pages
  /// - Clinical dashboards
  /// - Internal tools
  /// - Draft or staging routes
  final bool index;

  /// 🔗 Canonical URL override
  ///
  /// If null, [path] is used as canonical.
  final String? canonical;


  /// Creates an immutable SEO metadata definition for a route.
  ///
  /// All fields except [index] are required to prevent
  /// incomplete or unsafe SEO configuration.
  const SeoMetadata({
    required this.title,
    required this.description,
    required this.path,
    this.index = true,
    this.canonical
  });
}
