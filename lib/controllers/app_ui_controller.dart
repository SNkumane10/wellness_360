// lib/controllers/ui/app_ui_controller.dart

import "package:get/get.dart";

/// 🧠 AppUIController
///
/// Global **UI-state controller** for the Wellness360 app.
///
/// Scope:
/// - Visual state
/// - Interaction state
/// - Form/UI feedback
///
/// ❌ Explicitly excludes:
/// - API calls
/// - Authentication logic
/// - Business rules
/// - Clinical decisions
///
/// Think of this as the **UI nervous system**:
/// it senses, reacts, and signals — but never decides.
class AppUIController extends GetxController {
  /// 🔌 Global accessor (service-locator style)
  ///
  /// Requires registration via:
  /// `Get.put(AppUIController(), permanent: true)`
  static AppUIController get instance => Get.find<AppUIController>();

  // ─────────────────────────────────────────────
  // 🌐 GLOBAL UI STATE
  // ─────────────────────────────────────────────

  /// ⏳ Screen-level loading indicator
  final RxBool _isLoading = false.obs;

  /// ⏳ Whether the current screen is loading
  bool get isLoading => _isLoading.value;

  /// ⏳ Update loading state
  void setLoading(bool value) => _isLoading.value = value;

  // ─────────────────────────────────────────────
  // 🔐 SIGNUP / AUTH UI STATE
  // ─────────────────────────────────────────────

  /// 👁 Password visibility flag
  final RxBool _passwordObscured = true.obs;

  /// 👁 Whether password text is currently obscured
  bool get passwordObscured => _passwordObscured.value;

  /// 👁 Toggle password visibility
  void togglePasswordVisibility() =>
      _passwordObscured.value = !_passwordObscured.value;

  /// ✅ Consent flag
  final RxBool _consentGiven = false.obs;

  /// ✅ Whether legal consent has been given
  bool get consentGiven => _consentGiven.value;

  /// 📜 Update consent state
  void setConsent(bool value) => _consentGiven.value = value;

  // ─────────────────────────────────────────────
  // 🔑 PASSWORD STRENGTH STATE
  // ─────────────────────────────────────────────

  /// 📏 At least 8 characters
  final RxBool _hasMinLength = false.obs;

  bool get hasMinLength => _hasMinLength.value;

  /// 🔡 At least one lowercase letter
  final RxBool _hasLowercase = false.obs;

  bool get hasLowercase => _hasLowercase.value;

  /// 🔠 At least one uppercase letter
  final RxBool _hasUppercase = false.obs;

  bool get hasUppercase => _hasUppercase.value;

  /// 🔢 At least one number
  final RxBool _hasNumber = false.obs;

  bool get hasNumber => _hasNumber.value;

  /// ❗ At least one special character
  final RxBool _hasSpecialCharacter = false.obs;

  bool get hasSpecialCharacter => _hasSpecialCharacter.value;

  /// ✅ Aggregate password validity
  ///
  /// True only when **all** password rules are satisfied.
  bool get isPasswordValid =>
      hasMinLength &&
      hasLowercase &&
      hasUppercase &&
      hasNumber &&
      hasSpecialCharacter;

  // ─────────────────────────────────────────────
  // 🔍 PASSWORD EVALUATION
  // ─────────────────────────────────────────────

  /// 🔑 Evaluate password strength
  ///
  /// Updates internal password flags used by:
  /// - Password rules UI
  /// - CTA enablement
  /// - Inline feedback
  ///
  /// ❗ UI-only evaluation.
  /// ❌ No backend or cryptographic guarantees implied.
  void evaluatePassword(String password) {
    _hasMinLength.value = password.length >= 8;
    _hasLowercase.value = password.contains(RegExp(r"[a-z]"));
    _hasUppercase.value = password.contains(RegExp(r"[A-Z]"));
    _hasNumber.value = password.contains(RegExp(r"[0-9]"));
    _hasSpecialCharacter.value = password.contains(
      RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
    );
  }

  // ─────────────────────────────────────────────
  // ♻️ RESET HELPERS
  // ─────────────────────────────────────────────

  /// ♻️ Reset signup-related UI state
  void resetSignupState() {
    _passwordObscured.value = true;
    _consentGiven.value = false;
    _isLoading.value = false;
    _hasMinLength.value = false;
    _hasLowercase.value = false;
    _hasUppercase.value = false;
    _hasNumber.value = false;
    _hasSpecialCharacter.value = false;
  }
}
