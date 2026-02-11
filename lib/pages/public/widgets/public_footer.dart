import "package:flutter/material.dart";
import "package:wellness_360/seo/seo_text.dart";
import "package:wellness_360/utils/colors.dart";

class PublicFooter extends StatelessWidget {
  /// 🧱 PublicFooter
  ///
  /// Global footer for all public-facing pages.
  ///
  /// Purpose:
  /// - Provide legal, compliance, and trust information
  /// - Offer secondary navigation (non-conversion)
  /// - Reinforce legitimacy and transparency
  ///
  /// Characteristics:
  /// - Calm, neutral, non-promotional
  /// - Always visible at the end of public pages
  /// - SEO-safe and crawlable
  ///
  /// ❗ Important:
  /// This footer must NEVER contain primary CTAs.
  const PublicFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkMuted,
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 48,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ─────────────────────────────────────────
              // 🧭 Footer content grid
              // ─────────────────────────────────────────
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ────────────────
                  // 🏥 Brand / mission
                  // ────────────────
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SeoText(
                          text: "Wellness360",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 12),
                        SeoText(
                          text:
                              "A doctor-led digital health platform focused on metabolic health, sustainable weight loss, and long-term lifestyle change.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFCCD5D2),
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 48),

                  // ────────────────
                  // 🔗 Quick links
                  // ────────────────
                  Expanded(
                    child: _FooterColumn(
                      title: "Quick links",
                      items: const [
                        "About",
                        "Programmes",
                        "Pricing",
                        "FAQs",
                        "Safety",
                      ],
                    ),
                  ),

                  // ────────────────
                  // ⚖️ Legal
                  // ────────────────
                  Expanded(
                    child: _FooterColumn(
                      title: "Legal",
                      items: const [
                        "Privacy policy",
                        "Terms of service",
                        "Medical disclaimer",
                        "Data protection",
                      ],
                    ),
                  ),

                  // ────────────────
                  // 📍 Contact
                  // ────────────────
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        _FooterTitle("Get in touch"),
                        SizedBox(height: 12),
                        SeoText(
                          text: "+27 11 326 6811",
                          style: _contactStyle,
                        ),
                        SeoText(
                          text: "info@wellness360.co.za",
                          style: _contactStyle,
                        ),
                        SizedBox(height: 8),
                        SeoText(
                          text:
                              "Wellness360\nSummit Square\n15 School Road\nMorningside, Sandton\nJohannesburg, South Africa",
                          style: _contactStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 48),

              // ─────────────────────────────────────────
              // 🪪 Divider
              // ─────────────────────────────────────────
              Divider(
                color: Colors.white.withValues(alpha: 0.15),
                thickness: 1,
              ),

              const SizedBox(height: 24),

              // ─────────────────────────────────────────
              // © Copyright
              // ─────────────────────────────────────────
              const SeoText(
                text:
                    "© 2026 Wellness360. All rights reserved. Designed for clinical transparency and patient safety.",
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF9FB2AD),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 🧩 Footer column helper
class _FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  const _FooterColumn({
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FooterTitle(title),
        const SizedBox(height: 12),
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SeoText(
              text: item,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFFCCD5D2),
              ),
            ),
          ),
      ],
    );
  }
}

/// 🏷 Footer title
class _FooterTitle extends StatelessWidget {
  final String text;

  const _FooterTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return SeoText(
      text: text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}

/// 📞 Contact text style
const _contactStyle = TextStyle(
  fontSize: 14,
  color: Color(0xFFCCD5D2),
  height: 1.5,
);
