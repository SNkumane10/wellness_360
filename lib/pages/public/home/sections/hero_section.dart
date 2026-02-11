import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "package:wellness_360/seo/seo_text.dart";
import "package:wellness_360/utils/colors.dart";
import "package:wellness_360/router/route_names.dart";
import "package:wellness_360/pages/public/widgets/full_viewport_section.dart";

class HeroSection extends StatelessWidget {
  
  /// 🌟 HeroSection
  ///
  /// Primary above-the-fold section for the public home page.
  ///
  /// This is the **first clinical impression** of Wellness360 and
  /// intentionally mirrors a Roczen-style authority screen.
  ///
  /// Responsibilities:
  /// - Occupy (at least) one full viewport height
  /// - Establish doctor-led credibility immediately
  /// - Present the single dominant public CTA
  ///
  /// SEO:
  /// - Public
  /// - Indexed
  /// - Uses `SeoText` for semantic H1-equivalent rendering
  ///
  /// ❗ Design constraints (important):
  /// - No secondary CTAs
  /// - No imagery that implies guaranteed outcomes
  /// - Copy must remain clinical, calm, and non-promotional
  /// - Button action must always align with PublicAppBar CTA
  ///
  /// Future extensions (allowed):
  /// - Subtle background illustrations
  /// - Light gradient overlays
  /// - Trust microcopy (e.g. regulatory or clinician markers)
  ///
  /// Future extensions (not allowed here):
  /// - Pricing
  /// - Testimonials
  /// - Programme detail
  /// - Form fields
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FullViewportSection(
      /// 🎨 Deep clinical background to anchor authority
      backgroundColor: AppColors.primaryDark,

      /// Content width is intentionally constrained for readability
      /// and to preserve hierarchy on large screens.
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─────────────────────────────────────────
            // 🧠 Primary positioning headline (H1)
            // ─────────────────────────────────────────
            const SeoText(
              text: "Doctor-Led Metabolic Health & Weight Management",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.15,
              ),
            ),

            const SizedBox(height: 20),

            // ─────────────────────────────────────────
            // 🧬 Supporting value proposition
            // ─────────────────────────────────────────
            const SeoText(
              text:
                  "Clinically guided, online lifestyle and weight-management programmes led by Dr Bongiwe Vilakazi — personalised through a structured health assessment.",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFFE6ECEA),
                height: 1.6,
              ),
            ),

            const SizedBox(height: 36),

            // ─────────────────────────────────────────
            // 🟢 Primary CTA — entry to assessment funnel
            // ─────────────────────────────────────────
            ElevatedButton(
              onPressed: () => context.go(Routes.assessment),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                "Start health assessment",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.1,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ─────────────────────────────────────────
            // 🛡 Trust & reassurance microcopy
            // ─────────────────────────────────────────
            //
            // This line reduces anxiety and reinforces:
            // - Medical oversight
            // - No obligation
            // - No sales pressure
            const Text(
              "Assessment reviewed by a medical professional · No obligation",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFCCD5D2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
