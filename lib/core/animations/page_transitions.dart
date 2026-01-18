import 'package:flutter/material.dart';

/// Custom page route with smooth slide and fade animation
class SmoothPageRoute extends PageRouteBuilder {
  final Widget page;
  
  SmoothPageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: const Duration(milliseconds: 400),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Smooth curve
            var curve = CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOutCubic,
              reverseCurve: Curves.easeInOutCubic,
            );

            // Slide from right with fade
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.3, 0),
                end: Offset.zero,
              ).animate(curve),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        );
}

/// Fade transition for dialogs and overlays
class FadePageRoute extends PageRouteBuilder {
  final Widget page;
  
  FadePageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
              child: child,
            );
          },
        );
}

/// Scale transition for bottom sheets
class ScalePageRoute extends PageRouteBuilder {
  final Widget page;
  
  ScalePageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: const Duration(milliseconds: 350),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var curve = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
            );

            return ScaleTransition(
              scale: Tween<double>(
                begin: 0.9,
                end: 1.0,
              ).animate(curve),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        );
}
