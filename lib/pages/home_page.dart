import 'package:flutter/material.dart';
import 'package:wellness_360/sections/cta_section.dart';
import 'package:wellness_360/sections/hero_section.dart';
import 'package:wellness_360/sections/how_it_works_section.dart';
import 'package:wellness_360/sections/programs_section.dart';
import 'package:wellness_360/sections/trust_section.dart';
import 'package:wellness_360/sections/what_is_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            HeroSection(),
            WhatIsSection(),
            ProgramsSection(),
            HowItWorksSection(),
            TrustSection(),
            CallToActionSection(),
          ],
        ),
      ),
    );
  }
}
