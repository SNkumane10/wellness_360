// lib/router/route_guards.dart

/// 🔐 Route access levels
///
/// This enum defines *who* may access a route.
/// It is intentionally simple and explicit.
enum RouteAccess {
  /// 🌍 Publicly accessible
  /// - SEO indexed
  /// - No authentication required
  public,

  /// 🔑 Requires authenticated user
  /// - Patient must be logged in
  /// - Not indexed by search engines
  authenticated,

  /// 🩺 Clinical / sensitive
  /// - Doctor / clinician access only
  /// - Always non-indexed
  clinical,
}

/// 🧭 Route access registry
///
/// Maps route paths to their required access level.
/// This allows:
/// - Central audits
/// - Easy expansion
/// - Consistent enforcement
class RouteGuardRegistry {
  static const Map<String, RouteAccess> accessMap = {
    // 🌍 Public
    "/": RouteAccess.public,
    "/about": RouteAccess.public,
    "/pricing": RouteAccess.public,
    "/safety": RouteAccess.public,

    // 🔑 Auth
    "/login": RouteAccess.public,
    "/signup": RouteAccess.public,

    "/app": RouteAccess.authenticated,
    "/assessment": RouteAccess.authenticated,
    "/onboarding": RouteAccess.authenticated,

    // 🩺 Clinical (future)
    "/clinical": RouteAccess.clinical,
  };
}

/// 🛂 Route guard evaluator
///
/// Determines whether navigation should be allowed
/// based on route access level and user state.
class RouteGuard {
  static bool canAccess({
    required RouteAccess requiredAccess,
    required bool isAuthenticated,
    required bool isClinician,
  }) {
    switch (requiredAccess) {
      case RouteAccess.public:
        return true;

      case RouteAccess.authenticated:
        return isAuthenticated;

      case RouteAccess.clinical:
        return isAuthenticated && isClinician;
    }
  }
}
