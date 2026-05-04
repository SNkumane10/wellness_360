# Wellness360 Client App

Flutter client for the Wellness360 public site, authentication flow, onboarding,
and patient app surfaces.

## Page Creation Recipe

Use this recipe when adding new pages so routing, SEO, public layout, and reveal
behaviour stay consistent.

### 1. Add The Route Name

Add the path in `lib/router/route_names.dart`.

```dart
class Routes {
  static const about = "/about";
}
```

### 2. Register Route Access

Add the route to `RouteGuardRegistry.accessMap` in
`lib/router/route_guards.dart`.

```dart
static const Map<String, RouteAccess> accessMap = {
  "/about": RouteAccess.public,
};
```

Use:

- `RouteAccess.public` for public pages and auth entry pages.
- `RouteAccess.authenticated` for patient app/onboarding pages.
- `RouteAccess.clinical` for clinician-only pages.

### 3. Add SEO Metadata For Indexed Public Pages

For public pages that should be indexed, add one entry in
`lib/seo/seo_registry.dart`.

```dart
static const about = SeoMetadata(
  path: "/about",
  title: "About Wellness360 | Clinical Leadership",
  description:
      "Learn about Wellness360's clinical philosophy and medical leadership.",
);
```

Do not add auth, app, onboarding, or clinical pages to the SEO registry.

### 4. Wire The Route

Add the `GoRoute` in `lib/router/app_router.dart`.

Indexed public page:

```dart
GoRoute(
  path: Routes.about,
  builder: (context, state) {
    applySeo(SeoRegistry.about);
    return const PublicLayout(
      child: AboutPage(),
    );
  },
),
```

Public but not indexed, like signup:

```dart
GoRoute(
  path: Routes.signup,
  builder: (context, state) {
    return const PublicLayout(
      child: SignupPage(),
    );
  },
),
```

### 5. Build Public Content Pages As Sections

Public content pages should be simple orchestration widgets. Keep the page file
focused on page flow and move large content blocks into `sections/*.dart`.

```dart
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          AboutHeroSection(),
          ScrollReveal(
            child: AboutContentSection(),
          ),
          ScrollReveal(
            offsetY: 0.12,
            duration: Duration(milliseconds: 700),
            child: AboutProcessSection(),
          ),
          PublicFooter(),
        ],
      ),
    );
  }
}
```

Use these shared building blocks:

- `PublicLayout` for shared public chrome and app bar.
- `PublicFooter` at the end of public content pages.
- `ScrollReveal` around below-the-fold public sections.
- `FullViewportSection` for full-screen hero sections.
- `SeoText` for stable public headings and content copy.
- `AppColors` for all app colours.

### 6. Build Hero Sections With The Shared Viewport Primitive

Hero sections should usually use `FullViewportSection`, a constrained content
width, and `SeoText` for public-facing copy.

```dart
class AboutHeroSection extends StatelessWidget {
  const AboutHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FullViewportSection(
      backgroundColor: AppColors.primaryDark,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SeoText(
              text: "Page headline",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.15,
              ),
            ),
            SizedBox(height: 20),
            SeoText(
              text: "Supporting clinical, calm, non-promotional page copy.",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFFE6ECEA),
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 7. Auth/Form Page Pattern

Auth pages, like `SignupPage`, still use `PublicLayout`, but they are not
section-led marketing pages.

Use this pattern:

- Use `StatefulWidget` when the page owns form state.
- Keep backend/auth calls out unless the page owns that behaviour.
- Use `AppUIController` and `Obx` for reactive UI state.
- Use a local input decoration helper for consistent fields.
- Use `LayoutBuilder` for wide/narrow layout decisions.
- Use `SingleChildScrollView` and `ConstrainedBox(maxWidth: 1100)`.
- Keep desktop context copy separate from the form card.
- Keep the main form in a contained `_formCard()`.

### Page Rules

- Indexed public page: `Routes` + `RouteGuardRegistry` + `SeoRegistry` +
  `applySeo(...)` + `PublicLayout`.
- Public non-indexed page: `Routes` + `RouteGuardRegistry` + `PublicLayout`.
- Use `SeoText` for meaningful public copy, not input labels or temporary UI.
- Use `ScrollReveal` only for section-based public content.
- Do not use `ScrollReveal` inside lists or frequently rebuilding widgets.
- Keep page files as orchestration surfaces.
- Put large reusable content in section widgets.
- Use `AppColors` instead of hardcoded brand colours.
- Use `context.go(Routes.someRoute)` for route navigation.
