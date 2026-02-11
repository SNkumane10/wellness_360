// lib/seo/seo_text.dart

import "package:flutter/material.dart";

/// 📝 SEO-Intent Text Abstraction
///
/// A lightweight wrapper around Flutter's `Text` widget that preserves
/// semantic intent for future SEO strategies (SSR, prerendering).
///
/// Today:
/// - Renders as a standard Flutter `Text` widget
/// - Fully compatible with web, mobile, and desktop
///
/// Future:
/// - Can be swapped to emit semantic HTML (`<h1>`, `<p>`, etc.)
///   during server-side rendering or static prerendering
/// - Allows SEO upgrades without refactoring page content
///
/// ❗ This widget does NOT attempt DOM manipulation or HTML overlays.
/// Those approaches are deprecated in modern Flutter Web.
class SeoText extends StatelessWidget {
  /// 🏷 Text content
  ///
  /// Human-readable, descriptive content.
  /// Should remain stable and meaningful for both users and crawlers.
  final String text;

  /// 🎨 Text style
  ///
  /// Controls typography (size, weight, colour).
  final TextStyle? style;

  /// 📐 Text alignment
  final TextAlign? textAlign;

  /// 📝 SEO-intent text widget
  ///
  /// Use this for:
  /// - Public-facing copy
  /// - Headings and section titles
  /// - Crawlable informational content
  ///
  /// ❗ Do NOT use for:
  /// - User input fields
  /// - Dynamic system messages
  /// - Ephemeral UI-only labels
  const SeoText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}
