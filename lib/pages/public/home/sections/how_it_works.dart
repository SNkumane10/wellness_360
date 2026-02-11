// lib/pages/public/home/sections/how_it_works.dart

import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "package:wellness_360/seo/seo_text.dart";
import "package:wellness_360/utils/colors.dart";
import "package:wellness_360/router/route_names.dart";
import "package:wellness_360/pages/public/widgets/full_viewport_section.dart";

/// 🔄 How It Works Section
///
/// Full-viewport explanation of the Wellness360 patient journey,
/// mapped directly to real application routes.
///
/// Purpose:
/// - Set clear expectations before sign-up
/// - Reduce uncertainty and friction
/// - Reinforce that care follows a structured process
///
/// SEO:
/// - Public
/// - Indexed
/// - Uses step-based, crawlable language
///
/// Design principles:
/// - Sequential and honest
/// - Calm, clinical tone
/// - No guarantees or pricing
class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FullViewportSection(
      backgroundColor: AppColors.backgroundSoft,

      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            // ─────────────────────────────────────────────
            // 🏷 Section heading
            // ─────────────────────────────────────────────
            SeoText(
              text: "How It Works",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),

            SizedBox(height: 24),

            // ─────────────────────────────────────────────
            // 🧭 Step-by-step journey (route-aligned)
            // ─────────────────────────────────────────────
            _StepRow(
              step: "1",
              text: "Complete your online health assessment.",
              route: Routes.assessment,
            ),

            _StepRow(
              step: "2",
              text: "Upload relevant labs, measurements, and medical history.",
              route: Routes.assessment,
            ),

            _StepRow(
              step: "3",
              text:
                  "Receive a personalised programme recommendation reviewed by a doctor.",
              route: null, // recommendation screen follows assessment
            ),

            _StepRow(
              step: "4",
              text:
                  "Begin your structured care journey with ongoing support and monitoring.",
              route: Routes.dashboard,
            ),
          ],
        ),
      ),
    );
  }
}

/// 🧱 Step Row
///
/// Represents a single step in the Wellness360 journey.
///
/// Behaviour:
/// - Clickable only when a real route exists
/// - Non-interactive when the step is informational
///
/// Design note:
/// - Visual language stays consistent even as routing evolves
class _StepRow extends StatelessWidget {
  final String step;
  final String text;
  final String? route;

  const _StepRow({
    required this.step,
    required this.text,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    final isClickable = route != null;

    return InkWell(
      onTap: isClickable ? () => context.go(route!) : null,
      borderRadius: BorderRadius.circular(12),

      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─────────────────────────────────────────────
            // 🔢 Step indicator
            // ─────────────────────────────────────────────
            Container(
              width: 32,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                shape: BoxShape.circle,
              ),
              child: Text(
                step,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(width: 16),

            // ─────────────────────────────────────────────
            // 📝 Step description
            // ─────────────────────────────────────────────
            Expanded(
              child: SeoText(
                text: text,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.textPrimary,
                  height: 1.5,
                ),
              ),
            ),

            // ─────────────────────────────────────────────
            // ➡️ Optional affordance (future)
            // ─────────────────────────────────────────────
            //
            // You may later add:
            // - Chevron icon for clickable steps
            // - Tooltip for gated steps
          ],
        ),
      ),
    );
  }
}
