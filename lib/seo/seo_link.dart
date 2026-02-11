// lib/seo/seo_link.dart

import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

/// 🔗 SEO-Aware Link Abstraction
///
/// A lightweight wrapper around Flutter navigation that preserves
/// *semantic intent* for future SEO strategies (SSR, prerendering).
///
/// Today:
/// - Renders as a normal Flutter widget
/// - Uses `go_router` for navigation
///
/// Future:
/// - Can be swapped to emit real `<a href>` elements during
///   server-side rendering or static prerendering
///
/// ❗ This widget does NOT attempt to hack HTML rendering.
/// That approach is deprecated and unsafe in modern Flutter Web.
class SeoLink extends StatelessWidget {
  /// 🏷 Anchor text
  ///
  /// Descriptive, human-readable text associated with the link.
  /// This remains valuable for:
  /// - Accessibility
  /// - Future SSR
  /// - Content clarity
  final String text;

  /// 🌐 Destination path
  ///
  /// Must resolve to a valid `go_router` route.
  ///
  /// Examples:
  /// - `/about`
  /// - `/programmes/h1-lifestyle`
  final String href;

  /// 🎨 Visual child
  ///
  /// Controls how the link appears to users.
  /// Typically a `Text`, but can be any widget.
  final Widget child;

  /// 🔗 Semantic navigation widget
  ///
  /// Use this for:
  /// - Public navigation links
  /// - SEO-relevant internal links
  /// - Content references users can click intentionally
  ///
  /// ❗ Do NOT use for:
  /// - Buttons that perform actions
  /// - Implicit navigation
  /// - Auth-only or hidden routes
  const SeoLink({
    super.key,
    required this.text,
    required this.href,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 🧭 Declarative navigation
        //
        // This preserves clean routing semantics and history.
        context.go(href);
      },

      // 🖌 User-facing UI
      child: child,
    );
  }
}
