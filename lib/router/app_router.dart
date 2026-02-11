// lib/router/app_router.dart

import 'package:go_router/go_router.dart';
import 'package:wellness_360/pages/auth/signup/signup_page.dart';
import 'package:wellness_360/pages/public/home/home_page.dart';
import 'package:wellness_360/pages/public/layouts/public_layout.dart';
import '../seo/seo_injector.dart';
import '../seo/seo_registry.dart';
import 'route_names.dart';
import 'route_guards.dart';

/// 🧭 Application Router
///
/// Central routing configuration for the Wellness360 client app.
///
/// Responsibilities:
/// - URL-first navigation (web + deep links)
/// - Route-level access control (public / authenticated / clinical)
/// - SEO metadata injection for public pages
///
/// ❗ Design principles:
/// - Routes must resolve even when access is denied
/// - Guards decide *where* a user may proceed, not whether a URL exists
/// - No widget-level navigation logic
final GoRouter appRouter = GoRouter(
  /// 🔐 Global redirect guard
  ///
  /// This function runs on every navigation attempt and determines
  /// whether the user may access the requested route.
  ///
  /// IMPORTANT:
  /// - This is policy logic, not UI logic
  /// - Authentication and role state will be injected later
  redirect: (context, state) {
    final path = state.uri.path;

    // 🧾 Determine required access level for this route
    final access =
        RouteGuardRegistry.accessMap[path] ?? RouteAccess.public;

    // 🔜 Temporary placeholders
    //
    // These will later be replaced with:
    // - Firebase auth state
    // - Session / token checks
    // - Clinician role validation
    const isAuthenticated = false;
    const isClinician = false;

    // 🛂 Evaluate access
    final allowed = RouteGuard.canAccess(
      requiredAccess: access,
      isAuthenticated: isAuthenticated,
      isClinician: isClinician,
    );

    if (!allowed) {
      // 🔁 Redirect unauthorised users
      //
      // Auth-required routes → login
      // Everything else → public home
      if (access == RouteAccess.authenticated) {
        return Routes.login;
      }

      return Routes.home;
    }

    // ✅ Access allowed
    return null;
  },

  /// 🗺 Route definitions
  ///
  /// Each route:
  /// - Maps directly to a URL
  /// - Injects SEO metadata (public pages only)
  /// - Returns a single page widget
  routes: [
    /// 🏠 Home (public, indexed)
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        applySeo(SeoRegistry.home);
        return const PublicLayout(
          child: HomePage(),
        );
      },
    ),

    /// 📝 Signup (public, NOT indexed)
    GoRoute(
      path: Routes.signup,
      builder: (context, state) {
        return const PublicLayout(
          child: SignupPage(),
        );
      },
    ),

    // /// 🩺 About / Clinical leadership (public, indexed)
    // GoRoute(
    //   path: Routes.about,
    //   builder: (context, state) {
    //     applySeo(SeoRegistry.about);
    //     return const AboutPage();
    //   },
    // ),

    // /// 💳 Pricing (public, indexed)
    // GoRoute(
    //   path: Routes.pricing,
    //   builder: (context, state) {
    //     applySeo(SeoRegistry.pricing);
    //     return const PricingPage();
    //   },
    // ),
  ],
);
