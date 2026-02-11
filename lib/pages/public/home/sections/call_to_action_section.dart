// lib/pages/public/home/sections/call_to_action_section.dart

import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "package:wellness_360/utils/colors.dart";
import "package:wellness_360/router/route_names.dart";
import "package:wellness_360/pages/public/widgets/full_viewport_section.dart";

/// 🚀 Call-to-Action Section
///
/// Full-viewport conversion block at the end of the public home page.
///
/// Purpose:
/// - Move users from understanding → action
/// - Provide a confident, low-pressure entry point
/// - Reinforce that care begins with a process, not a promise
///
/// Behaviour:
/// - Stateless
/// - One clear action
/// - Navigation handled via router
///
/// Design principles:
/// - Calm confidence
/// - Strong visual focus
/// - No urgency or hype
class CallToActionSection extends StatelessWidget {
  const CallToActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FullViewportSection(
      backgroundColor: AppColors.primaryDark,

      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ─────────────────────────────────────────────
            // 🧠 Confidence message (Roczen-style)
            // ─────────────────────────────────────────────
            const Text(
              "Ready to take the first step?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                height: 1.2,
              ),
            ),

            const SizedBox(height: 16),

            // ─────────────────────────────────────────────
            // 🧬 Reassurance / framing
            // ─────────────────────────────────────────────
            const Text(
              "Begin with a clinically guided health assessment reviewed by a medical professional.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFD6DEDB),
                height: 1.6,
              ),
            ),

            const SizedBox(height: 36),

            // ─────────────────────────────────────────────
            // 🟢 Primary action (single, unambiguous)
            // ─────────────────────────────────────────────
            ElevatedButton(
              onPressed: () => context.go(Routes.assessment),

              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 36,
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

            const SizedBox(height: 20),

            // ─────────────────────────────────────────────
            // 🟨 Subtle reassurance (trust signal)
            // ─────────────────────────────────────────────
            const Text(
              "No obligation · Doctor-led from the start",
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
