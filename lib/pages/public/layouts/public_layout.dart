// lib/pages/public/layouts/public_layout.dart

import "package:flutter/material.dart";
import "../widgets/public_app_bar.dart";

class PublicLayout extends StatelessWidget {
  final Widget child;

  /// 🌍 PublicLayout
  ///
  /// Shared chrome for all public-facing pages:
  /// - Persistent PublicAppBar
  /// - Consistent background
  /// - Safe area handling
  ///
  /// This layout must remain:
  /// - Stateless
  /// - SEO-safe
  /// - Free of auth / routing logic
  const PublicLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PublicAppBar(),
      body: child,
    );
  }
}
