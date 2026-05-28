// WHAT THIS FILE DOES:
// The first screen a user sees. Handles logo animation and initial auth checking.
//
// KEY CONCEPTS IN THIS FILE:
// • flutter_animate: Easy modern animations.
// • ConsumerWidget: Riverpod-enabled widget.
// • TweenAnimationBuilder: Used for real loading animation.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // =========================
            // LOGO
            // =========================
            const Icon(
              Icons.shield_rounded,
              size: 100,
              color: AppColors.gold,
            )
                .animate()
                .fade(duration: 800.ms)
                .scale(
                  delay: 200.ms,
                  curve: Curves.elasticOut,
                ),

            const SizedBox(height: 24),

            // =========================
            // APP TITLE
            // =========================
            Text(
<<<<<<< HEAD
              'QUEST ARENA',
              style: AppTextStyles.display.copyWith(
                letterSpacing: 6,
              ),
=======
              'QUESTARENA',
              style: AppTextStyles.display.copyWith(
                letterSpacing: 2,
                fontSize: 26,
              ),
              textAlign: TextAlign.center,
>>>>>>> upstream/master
            )
                .animate()
                .slideY(
                  begin: 1,
                  end: 0,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                )
                .fadeIn(),

            const SizedBox(height: 8),

            // =========================
            // SUBTITLE
            // =========================
            Text(
              'BATTLE OF WITS',
              style: AppTextStyles.label.copyWith(
                color: AppColors.gold,
                fontSize: 20,
                letterSpacing: 2,
              ),
            ).animate().fadeIn(delay: 800.ms),

            const SizedBox(height: 35),

            // =========================
            // PREMIUM LOADING BAR
            // =========================
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(seconds: 3),

              builder: (context, value, child) {
                return Container(
                  width: 240,
                  height: 10,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white10,

                    // Outer subtle border
                    border: Border.all(
                      color: Colors.white.withOpacity(0.18),
                      width: 1,
                    ),
                  ),

                  child: Align(
                    alignment: Alignment.centerLeft,

                    child: Container(
                      width: 240 * value,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),

                        // Metallic gold gradient
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFFFD700),
                            Color(0xFFFFF4B0),
                            Color(0xFFFFD700),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),

                        // Tiny glossy white edge
                        border: Border.all(
                          color: Colors.white24,
                          width: 0.7,
                        ),

                        // Golden glow
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFFFD700),
                            blurRadius: 12,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
                .animate(
                  onPlay: (controller) => controller.repeat(),
                )
                .shimmer(
                  duration: 1800.ms,
                  color: Colors.white.withOpacity(0.7),
                )
                .fadeIn(delay: 1000.ms),
          ],
        ),
      ),
    );
  }
}