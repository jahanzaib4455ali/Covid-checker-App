import 'package:flutter/material.dart';

class BottomNavItem {
  final dynamic icon; // Can be IconData or String for SVG
  final String label;
  final Widget screen;

  BottomNavItem({required this.icon, required this.label, required this.screen});
}