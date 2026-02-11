import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:wellness_360/main.dart";
import "../../../../utils/colors.dart";

/// 🔐 PasswordRules
///
/// Displays live password strength requirements during signup.
///
/// Characteristics:
/// - Purely presentational
/// - Fully reactive via GetX
/// - Driven entirely by `AppUIController`
///
/// ❗ Responsibilities:
/// - Reflect password rule satisfaction in real time
/// - Provide calm, explicit visual feedback
///
/// ❌ Non-responsibilities:
/// - No validation logic
/// - No state mutation
/// - No auth, backend, or security guarantees
class PasswordRules extends StatelessWidget {
  const PasswordRules({super.key});

  @override
  Widget build(BuildContext context) {
    /// 🔁 Reactive rebuild
    ///
    /// Any mutation of password-related UI state
    /// inside `AppUIController` triggers a rebuild.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _PasswordRule(
          text: "At least 8 characters",
          selector: _RuleSelector.minLength,
        ),
        SizedBox(height: 4),
        _PasswordRule(
          text: "One lowercase letter",
          selector: _RuleSelector.lowercase,
        ),
        SizedBox(height: 4),
        _PasswordRule(
          text: "One uppercase letter",
          selector: _RuleSelector.uppercase,
        ),
        SizedBox(height: 4),
        _PasswordRule(
          text: "One number",
          selector: _RuleSelector.number,
        ),
        SizedBox(height: 4),
        _PasswordRule(
          text: "One special character",
          selector: _RuleSelector.special,
        ),
      ],
    );
  }
}

/// 🔎 _RuleSelector
///
/// Enumerates password rule types.
/// Keeps rule wiring explicit and readable.
enum _RuleSelector {
  minLength,
  lowercase,
  uppercase,
  number,
  special,
}

/// ✅ _PasswordRule
///
/// A single password requirement row.
///
/// Visual behaviour:
/// - ✔️ Green filled icon → rule satisfied
/// - ◻️ Muted outline icon → rule unmet
///
/// Design constraints:
/// - Stateless
/// - Deterministic
/// - Side-effect free
class _PasswordRule extends StatelessWidget {
  /// 📝 Human-readable rule description
  final String text;

  /// 🔎 Which password rule this row represents
  final _RuleSelector selector;

  const _PasswordRule({
    required this.text,
    required this.selector,
  });

  /// 🎯 Resolve rule satisfaction from controller
  bool get _isSatisfied {
    switch (selector) {
      case _RuleSelector.minLength:
        return appUIController.hasMinLength;
      case _RuleSelector.lowercase:
        return appUIController.hasLowercase;
      case _RuleSelector.uppercase:
        return appUIController.hasUppercase;
      case _RuleSelector.number:
        return appUIController.hasNumber;
      case _RuleSelector.special:
        return appUIController.hasSpecialCharacter;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool satisfied = _isSatisfied;
      return Row(
        children: [
          /// 🔍 Visual indicator
          Icon(
            satisfied
                ? Icons.check_circle         // ✅ satisfied
                : Icons.check_circle_outline, // ◻️ unmet
            size: 16,
            color: satisfied
                ? AppColors.primaryGreen
                : AppColors.greenMuted,
          ),
          const SizedBox(width: 6),

          /// 🧾 Rule text
          Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      );
    });
  }
}
