// lib/pages/auth/signup/signup_page.dart

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:wellness_360/main.dart";
import "../../../utils/colors.dart";
import "package:wellness_360/pages/auth/widgets/password_rules.dart";

/// 📝 SignupPage
///
/// Account creation entry point for Wellness360.
///
/// Purpose:
/// - Capture basic identity information
/// - Establish password credentials
/// - Capture legal consent
///
/// ❗ Important:
/// - This page does **NOT** complete onboarding
/// - It only prepares the user for OTP verification
///
/// Architectural rules:
/// - UI state is owned by `AppUIController`
/// - No backend calls
/// - No auth logic
/// - No clinical logic
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  /// 🧾 Form key
  ///
  /// Reserved for future validation expansion
  /// (email format, required fields, etc.)
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ─────────────────────────────────────────────
  // 🎨 Input decoration helper
  // ─────────────────────────────────────────────

  /// 🖊 Standardised input styling
  ///
  /// Keeps all form fields visually consistent
  /// across the signup surface.
  InputDecoration _input(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: AppColors.backgroundSoft,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.divider),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.divider),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // 🧠 Left-side contextual copy (desktop only)
  // ─────────────────────────────────────────────

  /// 📖 Contextual explanation for desktop layouts
  ///
  /// Establishes:
  /// - Purpose
  /// - Trust
  /// - What happens next
  Widget _leftContext() {
    return Padding(
      padding: const EdgeInsets.only(right: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Create your Wellness360 account",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.4,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "You’ll use this account to complete your health assessment, "
            "receive a personalised programme, and communicate with your care team.",
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // 📜 Consent checkbox (reactive)
  // ─────────────────────────────────────────────

  /// ✅ Legal consent acknowledgement
  ///
  /// Driven directly by `AppUIController`.
  Widget _consentCheckbox() {
    return Obx(
      () => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: appUIController.consentGiven,
            activeColor: AppColors.primaryGreen,
            onChanged: (v) =>
                appUIController.setConsent(v ?? false),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 6),
              child: Text(
                "I agree to the Wellness360 Consent to Care and Privacy Policy.",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  height: 1.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // 🧱 Main signup form card
  // ─────────────────────────────────────────────

  /// 🧩 Signup form container
  ///
  /// Contains:
  /// - Identity fields
  /// - Password creation
  /// - Password rules feedback
  /// - Consent acknowledgement
  /// - Continue CTA
  Widget _formCard() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.divider),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Create your account",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 24),

            // ── Name fields
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: _input("First name"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    decoration: _input("Last name"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ── Email
            TextFormField(
              decoration: _input("Email address"),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            // ── Mobile
            TextFormField(
              decoration: _input("Mobile number"),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),

            // ── Date of birth
            TextFormField(
              decoration: _input("Date of birth"),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 16),

            // ── Password field (reactive)
            Obx(
              () => TextFormField(
                obscureText: appUIController.passwordObscured,
                onChanged: appUIController.evaluatePassword,
                decoration: _input("Password").copyWith(
                  suffixIcon: IconButton(
                    icon: Icon(
                      appUIController.passwordObscured
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.textSecondary,
                    ),
                    onPressed:
                        appUIController.togglePasswordVisibility,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // ── Password rules feedback (reactive boundary lives here)
            const PasswordRules(),
            const SizedBox(height: 20),

            // ── Consent
            _consentCheckbox(),
            const SizedBox(height: 28),

            // ── Continue CTA
            Obx(
              () => ElevatedButton(
                onPressed: appUIController.consentGiven &&
                        appUIController.isPasswordValid
                    ? () {
                        // 👉 Next step: OTP verification
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      AppColors.primaryGreen,
                  disabledBackgroundColor:
                      AppColors.primaryGreen
                          .withValues(alpha: 0.4),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // 🏗 Build
  // ─────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool wide =
            constraints.maxWidth >= 1000;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 48,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints:
                    const BoxConstraints(maxWidth: 1100),
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    if (wide)
                      Expanded(child: _leftContext()),
                    Expanded(child: _formCard()),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
