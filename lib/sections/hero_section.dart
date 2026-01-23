import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 96),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE8F5F2), // soft mint
            Color(0xFFF7FBFA), // near white
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // LEFT: Text
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wellness360',
                      style: GoogleFonts.poppins(
                        fontSize: 35,
                        letterSpacing: 2.0,
                        color: const Color(0xFF2E7D6F),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Online Weight Management\nfor Long-Term Wellbeing',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 44,
                        height: 1.2,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF1F2933),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'A holistic, online weight loss and lifestyle management program designed to support sustainable health, disease management, and lasting change.',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        height: 1.6,
                        color: const Color(0xFF4B5563),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 48),

              // RIGHT: Image placeholder
              Expanded(
                flex: 2,
                child: Container(
                  height: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white,
                    image: const DecorationImage(
                      image: AssetImage('assets/jannis-brandt-mmsQUgMLqUo-unsplash.jpg'),
                      fit: BoxFit.cover,
                      alignment: Alignment(0, 0.8), // Shift down to show more bottom (range: -1 to 1)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}