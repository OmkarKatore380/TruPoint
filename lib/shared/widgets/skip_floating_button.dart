import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Global reusable "Skip" button for development navigation
/// Red circular floating button at bottom-right
class SkipFloatingButton extends StatelessWidget {
  final String nextRoute;
  
  const SkipFloatingButton({
    super.key,
    required this.nextRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: FloatingActionButton(
        onPressed: () => context.go(nextRoute),
        backgroundColor: Colors.red,
        child: const Text(
          'Skip',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
