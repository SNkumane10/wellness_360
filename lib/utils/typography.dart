// lib/utils/typography.dart

import 'package:flutter/material.dart';

/// 🅰️ Typography scale
///
/// Centralised font sizes and weights used across the app.
/// Keeps visual hierarchy consistent and easy to change later.
///
/// This is intentionally simple (no theme overrides yet).
class AppTextStyles {
  // ─────────────────────────────────────────────
  // Headings
  // ─────────────────────────────────────────────

  static const TextStyle h1 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  // ─────────────────────────────────────────────
  // Body text
  // ─────────────────────────────────────────────

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
  );

  // ─────────────────────────────────────────────
  // UI / labels
  // ─────────────────────────────────────────────

  static const TextStyle label = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}
