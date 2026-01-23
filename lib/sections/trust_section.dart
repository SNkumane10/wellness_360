import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrustSection extends StatelessWidget {
  const TrustSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE8F5F2),
            Color(0xFFF7FBFA),
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Container(
            padding: const EdgeInsets.all(48),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF2E7D6F).withOpacity(0.08),
                  blurRadius: 30,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Icon
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5F2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.verified_user,
                    color: Color(0xFF2E7D6F),
                    size: 40,
                  ),
                ),
                const SizedBox(height: 32),
                
                // Section label
                Text(
                  'OUR COMMITMENT',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    letterSpacing: 2.0,
                    color: const Color(0xFF2E7D6F),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Main heading
                Text(
                  'A Responsible, Guided Approach to Wellness',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 32,
                    height: 1.3,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1F2933),
                  ),
                ),
                const SizedBox(height: 28),
                
                // Body text
                Text(
                  'Wellness360 is designed to support informed, sustainable lifestyle change. Our programs emphasize realistic goal-setting, personal accountability, and long-term wellbeing rather than quick fixes.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    height: 1.7,
                    color: const Color(0xFF4B5563),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'We encourage participants to make health decisions in consultation with qualified healthcare professionals and to approach wellness as an ongoing journey.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    height: 1.7,
                    color: const Color(0xFF4B5563),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                
                const SizedBox(height: 36),
                
                // Trust badges row
                Wrap(
                  spacing: 32,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: [
                    _TrustBadge(
                      icon: Icons.health_and_safety,
                      label: 'Health-Focused',
                    ),
                    _TrustBadge(
                      icon: Icons.schedule,
                      label: 'Long-Term',
                    ),
                    _TrustBadge(
                      icon: Icons.psychology,
                      label: 'Evidence-Based',
                    ),
                    _TrustBadge(
                      icon: Icons.support_agent,
                      label: 'Professional Support',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TrustBadge extends StatelessWidget {
  final IconData icon;
  final String label;

  const _TrustBadge({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: const Color(0xFF2E7D6F),
          size: 28,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF4B5563),
          ),
        ),
      ],
    );
  }
}