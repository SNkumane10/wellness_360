// lib/pages/public/widgets/public_app_bar.dart

import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "../../../router/route_names.dart";
import "../../../utils/colors.dart";

class PublicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PublicAppBar({super.key});

  static const double _height = 72;

  @override
  Size get preferredSize => const Size.fromHeight(_height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: _height,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.background,
      surfaceTintColor: AppColors.background,

      // Subtle divider like Roczen
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: AppColors.divider,
        ),
      ),

      titleSpacing: 20,
      title: Row(
        children: [
          // ─────────────────────────────
          // LEFT — Brand
          // ─────────────────────────────
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => context.go(Routes.home),
            child: Row(
              children: const [
                _BrandMark(),
                SizedBox(width: 10),
                Text(
                  "Wellness360",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    letterSpacing: -0.2,
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // ─────────────────────────────
          // CENTER — Nav (desktop only)
          // ─────────────────────────────
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 900) {
                return const SizedBox.shrink();
              }

              return Row(
                children: const [
                  _NavLink(label: "About", route: Routes.about),
                  SizedBox(width: 6),
                  _NavLink(label: "Programmes", route: Routes.programmes),
                  SizedBox(width: 6),
                  _NavLink(label: "Safety", route: Routes.safety),
                ],
              );
            },
          ),

          const Spacer(),

          // ─────────────────────────────
          // RIGHT — Login + Primary CTA
          // ─────────────────────────────
          LayoutBuilder(
            builder: (context, constraints) {
              final bool tight = constraints.maxWidth < 420;

              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!tight)
                    TextButton(
                      onPressed: () => context.go(Routes.login),
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    // onPressed: () => context.go(Routes.assessment),
                    onPressed: () => context.go(Routes.signup),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      tight ? "Start" : "Start health assessment",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.1,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final String route;

  const _NavLink({
    required this.label,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.go(route),
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondary,
          fontSize: 14,
        ),
      ),
    );
  }
}

class _BrandMark extends StatelessWidget {
  const _BrandMark();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        color: AppColors.primaryGreen.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.primaryGreen.withValues(alpha: 0.25),
        ),
      ),
      child: Center(
        child: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: AppColors.primaryGreen,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}
