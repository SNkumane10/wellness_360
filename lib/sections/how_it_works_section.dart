import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      color: Colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Section label
              Text(
                'HOW IT WORKS',
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
                'How the Wellness360 Program Works',
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 36,
                  height: 1.3,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1F2933),
                ),
              ),
              const SizedBox(height: 56),
              
              // Steps
              const Column(
                children: [
                  StepItem(
                    step: '1',
                    title: 'Create Your Account',
                    description:
                        'Sign up online and begin your Wellness360 journey with a secure personal profile.',
                    icon: Icons.person_add,
                  ),
                  StepItem(
                    step: '2',
                    title: 'Welcome & Consultation',
                    description:
                        'Receive a welcome message and guidance on next steps, including an optional initiation consultation.',
                    icon: Icons.handshake,
                  ),
                  StepItem(
                    step: '3',
                    title: 'Complete Your Health Assessment',
                    description:
                        'Fill out an online health questionnaire and submit relevant lab or body composition results.',
                    icon: Icons.assignment,
                  ),
                  StepItem(
                    step: '4',
                    title: 'Personalized Program Recommendation',
                    description:
                        'Receive a diagnostic summary, readiness insights, and a recommended Wellness360 program tailored to your needs.',
                    icon: Icons.psychology,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StepItem extends StatelessWidget {
  final String step;
  final String title;
  final String description;
  final IconData icon;

  const StepItem({
    super.key,
    required this.step,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step number circle
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF2E7D6F),
                  Color(0xFF3D9B8A),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF2E7D6F).withOpacity(0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 26,
                ),
                const SizedBox(height: 2),
                Text(
                  step,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1F2933),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 17,
                    height: 1.6,
                    color: const Color(0xFF4B5563),
                    fontWeight: FontWeight.w400,
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