import "package:flutter/material.dart";

class FullViewportSection extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsets padding;
  final bool centerVertically;

  /// 🧱 FullViewportSection
  ///
  /// Layout primitive that ensures a section occupies at least
  /// one visible viewport height (minus the public app bar).
  ///
  /// Purpose:
  /// - Enable Roczen-style full-screen narrative sections
  /// - Preserve natural content growth beyond the viewport
  ///
  /// Notes:
  /// - Height is calculated dynamically from `MediaQuery`
  /// - App bar height must stay in sync with `PublicAppBar`
  /// - Safe for SEO and scroll-based layouts
  const FullViewportSection({
    super.key,
    required this.child,
    this.backgroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
    this.centerVertically = true,
  });

  /// Must match `PublicAppBar` height
  static const double _appBarHeight = 72;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    final minHeight =
        media.size.height - media.padding.top - _appBarHeight;

    final content = centerVertically
        ? Center(child: child)
        : child;

    return Container(
      constraints: BoxConstraints(minHeight: minHeight),
      color: backgroundColor,
      padding: padding,
      child: content,
    );
  }
}
