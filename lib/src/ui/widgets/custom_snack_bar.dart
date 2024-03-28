import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  final Color? color;
  final SnackBarBehavior? type;

  const CustomSnackBar({
    super.key,
    required super.content,
    this.color,
    this.type,
  });

  @override
  Color? get backgroundColor => color;

  @override
  SnackBarBehavior? get behavior => type ?? SnackBarBehavior.floating;

  @override
  ShapeBorder? get shape => RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));

  @override
  EdgeInsetsGeometry? get padding => const EdgeInsets.symmetric(horizontal: 15, vertical: 15);

  @override
  EdgeInsetsGeometry? get margin => const EdgeInsets.symmetric(horizontal: 15, vertical: 15);
}
