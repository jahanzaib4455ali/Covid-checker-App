import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonBlurModal extends StatelessWidget {
  final Widget child;
  final VoidCallback? onClose;
  final double topOffset;

  const CommonBlurModal({
    Key? key,
    required this.child,
    this.onClose,
    this.topOffset = -60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Keyboard ke mutabiq padding manage karne ke liye
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Stack(
        clipBehavior: Clip.none, // Boundary se bahar button dikhane ke liye
        children: [
          // White popup content container
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: child,
          ),

          // Floating Glassmorphism Close Button
          Positioned(
            top: topOffset,
            left: 0,
            right: 0,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: 50.w,
                    height: 70.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Colors.white.withOpacity(0.5), width: 1.5),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white, size: 28),
                      onPressed: onClose ?? () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}