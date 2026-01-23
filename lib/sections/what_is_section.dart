import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhatIsSection extends StatelessWidget {
  const WhatIsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      color: Colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Small label
              Text(
                'WHAT IS WELLNESS360?',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  letterSpacing: 2.0,
                  color: const Color(0xFF2E7D6F),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              
              // Main heading
              Text(
                'Online Weight Loss, Disease & Lifestyle Management',
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 36,
                  height: 1.3,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1F2933),
                ),
              ),
              const SizedBox(height: 28),
              
              // Body text
              Text(
                'Wellness360 is an online wellness platform offering structured weight management programs that focus on sustainable health improvement. Our approach integrates lifestyle guidance, health assessments, and personalized program recommendations to support long-term wellbeing.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 19,
                  height: 1.7,
                  color: const Color(0xFF4B5563),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}