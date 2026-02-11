// lib/pages/public/home/sections/programme_overview_section.dart

import "package:flutter/material.dart";
import "package:wellness_360/seo/seo_text.dart";
import "package:wellness_360/utils/colors.dart";
import "package:wellness_360/pages/public/widgets/full_viewport_section.dart";

class ProgrammeOverviewSection extends StatelessWidget {
  
  /// 📦 Programme Overview Section
  ///
  /// Full-viewport overview of the Wellness360 programme ladder.
  ///
  /// Purpose:
  /// - Communicate the existence of multiple care tiers
  /// - Set expectations without overwhelming detail
  /// - Establish a clear escalation path from lifestyle to clinical care
  ///
  /// SEO:
  /// - Public
  /// - Indexed
  /// - Structured, scannable content
  ///
  /// Design principles:
  /// - Clinical, calm, structured
  /// - Informative, not promotional
  /// - No pricing, guarantees, or eligibility claims
  const ProgrammeOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FullViewportSection(
      backgroundColor: AppColors.background,

      child: ConstrainedBox(
        // Prevents wide card sprawl on large screens
        constraints: const BoxConstraints(maxWidth: 900),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            // ─────────────────────────────────────────────
            // 🏷 Section heading (H2-equivalent)
            // ─────────────────────────────────────────────
            SeoText(
              text: "Our Online Programmes",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),

            SizedBox(height: 24),

            // ─────────────────────────────────────────────
            // 🧩 Programme ladder (descriptive only)
            // ─────────────────────────────────────────────
            _ProgrammeItem(
              title: "Lifestyle-Based Programmes",
              description:
                  "Coaching, counselling, calorie-restricted or intermittent fasting approaches, and ketogenic nutrition where appropriate.",
            ),

            _ProgrammeItem(
              title: "Lifestyle + Products",
              description:
                  "Includes meal replacement shakes and targeted supplementation alongside lifestyle support.",
            ),

            _ProgrammeItem(
              title: "Lifestyle + Medication",
              description:
                  "For eligible patients, medical weight-loss support prescribed and monitored by a doctor.",
            ),

            _ProgrammeItem(
              title: "Clinical Plus",
              description:
                  "Doctor-intensive care for complex metabolic or weight-related conditions.",
            ),
          ],
        ),
      ),
    );
  }
}

/// 🧾 Programme Item Card
///
/// Represents a single programme tier in the overview.
///
/// Purpose:
/// - Provide a concise, readable summary
/// - Visually separate tiers without bias
/// - Prepare for future expansion (icons, links, badges)
///
/// Design note:
/// - Intentionally non-interactive
/// - Selection happens only after assessment
class _ProgrammeItem extends StatelessWidget {
  final String title;
  final String description;

  const _ProgrammeItem({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: AppColors.backgroundSoft,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.divider,
        ),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─────────────────────────────────────────────
          // 🟢 Icon / visual marker (future)
          // ─────────────────────────────────────────────
          //
          // Reserved for:
          // - Simple line icons per tier
          // - Subtle gold or green accent markers
          //
          // Keep disabled until iconography system is finalised.

          // ─────────────────────────────────────────────
          // 📝 Textual content
          // ─────────────────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🏷 Programme name
                SeoText(
                  text: title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 6),

                // 🧬 Programme description
                SeoText(
                  text: description,
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
