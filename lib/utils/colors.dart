// lib/utils/colors.dart

import "package:flutter/material.dart";

/// 🎨 Wellness360 Color System
///
/// Semantic, role-based colours.
/// Do NOT hardcode colours elsewhere.
class AppColors {
  // ─────────────────────────────────────────────
  // Brand core
  // ─────────────────────────────────────────────

  static const Color primaryGreen = Color(0xFF7CBF67);
  static const Color primaryDark = Color(0xFF152733);
  static const Color accentGold = Color(0xFFD9A72B);

  // ─────────────────────────────────────────────
  // Green variants
  // ─────────────────────────────────────────────

  static const Color greenSoft = Color(0xFFAAD79D);
  static const Color greenMuted = Color(0xFF5C964E);

  // ─────────────────────────────────────────────
  // Dark variants
  // ─────────────────────────────────────────────

  static const Color darkSoft = Color(0xFF263A47);
  static const Color darkMuted = Color(0xFF405663);

  // ─────────────────────────────────────────────
  // Gold variants
  // ─────────────────────────────────────────────

  static const Color goldSoft = Color(0xFFEBC66E);
  static const Color goldMuted = Color(0xFFB88C24);

  // ─────────────────────────────────────────────
  // Neutrals
  // ─────────────────────────────────────────────

  static const Color background = Color(0xFFFFFFFF);
  static const Color backgroundSoft = Color(0xFFF6F8F7);

  static const Color textPrimary = Color(0xFF1C1C1C);
  static const Color textSecondary = Color(0xFF5F5F5F);
  static const Color divider = Color(0xFFDCE1DF);
}
