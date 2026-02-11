import "package:flutter/material.dart";

class ScrollReveal extends StatefulWidget {
  /// The widget to animate into view
  final Widget child;

  /// Duration of the reveal animation
  final Duration duration;

  /// Easing curve for the animation
  final Curve curve;

  /// Initial vertical offset (as a fraction of height)
  /// before sliding into place
  final double offsetY;

  /// 🎬 ScrollReveal
  ///
  /// Lightweight animation wrapper used on public pages
  /// to introduce sections with calm motion.
  ///
  /// What it does:
  /// - Fades in its child
  /// - Slides it upward slightly
  /// - Runs **once** on first layout
  ///
  /// What it does NOT do:
  /// - It does not track real scroll position
  /// - It does not re-run on scroll back
  /// - It does not affect SEO or layout flow
  ///
  /// Use cases:
  /// - Landing pages
  /// - Marketing-style narratives
  /// - Section-based public content
  ///
  /// Avoid using:
  /// - Inside lists
  /// - Inside frequently rebuilding widgets
  const ScrollReveal({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.curve = Curves.easeOutCubic,
    this.offsetY = 0.08,
  });

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

/// Internal state for [ScrollReveal].
///
/// Manages:
/// - One-time reveal flag
/// - Trigger timing after first layout pass
class _ScrollRevealState extends State<ScrollReveal> {
  /// Whether the reveal animation has already run
  bool _revealed = false;

  /// Determines when to trigger the reveal.
  ///
  /// Current behaviour:
  /// - Runs after the first layout pass
  /// - Marks the widget as revealed
  ///
  /// This is intentionally simple and SEO-safe.
  /// If true viewport detection is ever required,
  /// this method is the correct extension point.
  void _checkVisibility(BoxConstraints constraints) {
    if (_revealed) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      setState(() {
        _revealed = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    /// LayoutBuilder is used purely to hook into
    /// the first layout phase of this widget.
    return LayoutBuilder(
      builder: (context, constraints) {
        _checkVisibility(constraints);

        return AnimatedOpacity(
          opacity: _revealed ? 1 : 0,
          duration: widget.duration,
          curve: widget.curve,
          child: AnimatedSlide(
            offset: _revealed
                ? Offset.zero
                : Offset(0, widget.offsetY),
            duration: widget.duration,
            curve: widget.curve,
            child: widget.child,
          ),
        );
      },
    );
  }
}
