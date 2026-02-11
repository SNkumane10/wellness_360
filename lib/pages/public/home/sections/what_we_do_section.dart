// lib/pages/public/home/sections/what_we_do_section.dart

import "package:flutter/material.dart";
import "package:wellness_360/seo/seo_text.dart";
import "package:wellness_360/utils/colors.dart";
import "package:wellness_360/pages/public/widgets/full_viewport_section.dart";

class WhatWeDoSection extends StatelessWidget {
  
  /// 🧠 What We Do Section
  ///
  /// Full-viewport narrative section that explains:
  /// - What Wellness360 is
  /// - How it differs from generic wellness apps
  /// - Why it is clinically credible
  ///
  /// Purpose:
  /// - Establish trust early
  /// - Set correct expectations (doctor-led, metabolic focus)
  /// - Anchor the brand story before programmes are introduced
  ///
  /// SEO:
  /// - Public
  /// - Indexed
  /// - Uses SEO-aware text (`SeoText`)
  ///
  /// Design principles:
  /// - Calm, clinical, reassuring
  /// - No urgency, no CTA
  /// - Visually distinct from hero
  const WhatWeDoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FullViewportSection(
      // 🎨 Soft background to create visual rhythm after the hero
      backgroundColor: AppColors.backgroundSoft,

      child: ConstrainedBox(
        // Prevents overly wide text on large screens
        constraints: const BoxConstraints(maxWidth: 900),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ─────────────────────────────────────────────
            // 🧠 Textual content
            // ─────────────────────────────────────────────
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // 🏷 Section heading (H2-equivalent)
                  SeoText(
                    text: "What is Wellness360?",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  SizedBox(height: 16),

                  // 🧬 Primary value proposition
                  SeoText(
                    text:
                        "Wellness360 is an online, doctor-led metabolic health platform focused on sustainable weight loss, disease prevention, and long-term lifestyle change.",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textPrimary,
                      height: 1.5,
                    ),
                  ),

                  SizedBox(height: 12),

                  // 🧩 Programme philosophy
                  SeoText(
                    text:
                        "Our programmes combine nutrition frameworks, behavioural coaching, and medical oversight where appropriate — all delivered digitally.",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            // ─────────────────────────────────────────────
            // 🌿 Visual / illustrative column (future)
            // ─────────────────────────────────────────────
            //
            // Reserved for:
            // - Subtle medical / lifestyle illustration
            // - Iconography reinforcing “holistic care”
            // - Short credibility callouts
            //
            // This column should remain optional and
            // be hidden on smaller screens.
            const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }
}
