// lib/pages/public/home/home_page.dart

import "package:flutter/material.dart";
import "package:wellness_360/pages/public/widgets/public_footer.dart";
import "package:wellness_360/pages/public/widgets/scroll_reveal.dart";
import "sections/call_to_action_section.dart";
import "sections/hero_section.dart";
import "sections/how_it_works.dart";
import "sections/programme_overview_section.dart";
import "sections/what_we_do_section.dart";

class HomePage extends StatelessWidget {
  
  /// 🏠 Home / Landing Page
  ///
  /// Public-facing entry point for the Wellness360 platform.
  ///
  /// Purpose:
  /// - Establish clinical credibility
  /// - Communicate programme structure
  /// - Guide users into the assessment funnel
  ///
  /// SEO:
  /// - Indexed
  /// - Structured with semantic, crawlable content
  /// - All text rendered via SEO-aware utilities in child sections
  ///
  /// ❗ Design principles:
  /// - Content-first (no auth, no state)
  /// - Scroll-based narrative layout
  /// - Section-driven composition for easy iteration
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // 📜 Vertical narrative flow
      //
      // The landing page is intentionally linear:
      // 1. Positioning
      // 2. Credibility
      // 3. Programme overview
      // 4. Process explanation
      // 5. Call to action
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 🌟 Hero / positioning
          HeroSection(),

          // 🧠 What Wellness360 does
          ScrollReveal(
            child: WhatWeDoSection()
          ),

          // 📦 Programme tiers (H1–H4 abstraction)
          ScrollReveal(
            offsetY: 0.12,
            duration: Duration(milliseconds: 700),
            child: ProgrammeOverviewSection(),
          ),

          // 🔄 Step-by-step process
          ScrollReveal(
            offsetY: 0.12,
            duration: Duration(milliseconds: 700),
            child: HowItWorksSection(),
          ),

          // 🚀 Conversion action
          ScrollReveal(
            offsetY: 0.12,
            duration: Duration(milliseconds: 700),
            child: CallToActionSection(),
          ),

          // 🧱 Global public footer
          const PublicFooter(),
        ],
      ),
    );
  }
}
