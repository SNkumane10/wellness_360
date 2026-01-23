import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgramsSection extends StatelessWidget {
  const ProgramsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFAFDFC),
            Color(0xFFE8F5F2),
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Section label
              Text(
                'OUR PROGRAMS',
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
                'Wellness360 Programs',
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 36,
                  height: 1.3,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1F2933),
                ),
              ),
              const SizedBox(height: 48),
              
              // Programs grid
              Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: const [
                  ProgramCard(
                    title: 'Optimize Weight & Health',
                    icon: Icons.track_changes,
                  ),
                  ProgramCard(
                    title: 'Health Enhanced (WeighWell)',
                    icon: Icons.favorite,
                  ),
                  ProgramCard(
                    title: 'Health Revision',
                    icon: Icons.refresh,
                  ),
                  ProgramCard(
                    title: 'Age Reversed',
                    icon: Icons.restore,
                  ),
                  ProgramCard(
                    title: 'Weight Matters',
                    icon: Icons.monitor_weight,
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

class ProgramCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const ProgramCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2E7D6F).withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5F2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF2E7D6F),
              size: 28,
            ),
          ),
          const SizedBox(height: 20),
          
          // Title
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 20,
              height: 1.4,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1F2933),
            ),
          ),
        ],
      ),
    );
  }
}