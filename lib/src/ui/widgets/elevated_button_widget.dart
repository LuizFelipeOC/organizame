import 'package:flutter/material.dart';

import '../../app_colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final VoidCallback callback;
  final String title;
  final double? width;
  final double? height;

  const ElevatedButtonWidget({
    super.key,
    required this.callback,
    required this.title,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: callback,
      child: Container(
        height: height,
        padding: const EdgeInsets.all(15),
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              AppColors.purplePrimary,
              AppColors.pinkPrimary,
            ],
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
