// lib/main.dart

import "package:flutter/material.dart";
import "package:flutter_web_plugins/flutter_web_plugins.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:wellness_360/controllers/app_ui_controller.dart";
import "package:wellness_360/utils/colors.dart";
import "router/app_router.dart";




/// 🌐 Global App UI Controller
///
/// This controller is intentionally:
/// - Initialised in `main.dart`
/// - Stored as a global singleton
/// - Imported directly by feature widgets
///
/// ❗ Architectural decision:
/// - Widgets may import `main.dart` to access UI state
/// - This app is not designed for package extraction,
///   widget reuse, or isolated widget testing
late final AppUIController appUIController;




/// 🚀 Application entry point
///
/// Bootstraps the Wellness360 client application.
///
/// Responsibilities:
/// - Ensure Flutter bindings are initialised
/// - Enable SEO bot detection (web-only)
/// - Mount the root application widget
///
/// ❗ Design notes:
/// - All routing is URL-driven via `go_router`
/// - SEO rendering is handled via `seo_renderer`
/// - No backend or auth initialisation happens here (by design)
void main() async {
  // 🔒 Ensure Flutter engine and bindings are ready
  WidgetsFlutterBinding.ensureInitialized();

  // 🌐 REQUIRED for seo_renderer on modern Flutter Web
  setUrlStrategy(PathUrlStrategy());

  Get.put(AppUIController(), permanent: true);
  appUIController = AppUIController.instance;

  // 🌐 Wrap app with RobotDetector
  //
  // This enables crawler detection and allows `seo_renderer`
  // to inject semantic HTML elements into the DOM when
  // search engine bots visit the site.
  runApp(
    const Wellness360App(),
  );
}

class Wellness360App extends StatelessWidget {
  
  /// 🧭 Root application widget
  ///
  /// Defines:
  /// - Global routing configuration
  /// - Application theme
  /// - Top-level app metadata
  ///
  /// This widget must remain:
  /// - Stateless
  /// - Side-effect free
  /// - Stable across environments
  const Wellness360App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // 🏷 Application title (fallback only; SEO titles are dynamic)
      title: "Wellness360",

      // 🚫 Disable debug banner in all environments
      debugShowCheckedModeBanner: false,

      // 🗺 URL-first routing configuration
      routerConfig: appRouter,

      // 🎨 Global theme (lightweight, brand-seeded)
      //
      // Detailed typography and spacing are handled
      // via shared utilities, not ThemeData overrides.
      theme: _themeData()
    );
  }

  ThemeData _themeData() {
    final baseTheme = ThemeData(
      useMaterial3: true,

      // 🎨 Brand-seeded colour system
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryGreen,
        brightness: Brightness.light,
      ).copyWith(
        surface: AppColors.background,
        outline: AppColors.divider,
        primary: AppColors.primaryGreen,
        secondary: AppColors.accentGold,
      ),

      // 🧱 Page + surface backgrounds
      scaffoldBackgroundColor: AppColors.background,
      canvasColor: AppColors.backgroundSoft,

      // ➖ Dividers
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
      ),
    );

    // ✍🏽 Typography
    return baseTheme.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
    );
  }
}
