// lib/seo/seo_renderer.dart

import 'package:flutter/material.dart';

class SeoRender extends StatelessWidget {
  final Widget child;

  /// 🌐 SEO Renderer Wrapper
  ///
  /// This widget ensures that important, user-visible content
  /// is also visible to search engine crawlers when running
  /// on Flutter Web.
  ///
  /// On non-web platforms, this behaves exactly like a normal widget.
  ///
  /// Why this exists:
  /// - Prevents direct dependency on `seo_renderer` in pages
  /// - Allows future replacement or extension without refactors
  /// - Makes SEO intent explicit in the codebase
  const SeoRender({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SeoRender(
      child: child,
    );
  }
}
