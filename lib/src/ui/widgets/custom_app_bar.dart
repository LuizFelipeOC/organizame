import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final bool leading;
  final bool suffix;
  final String title;
  final IconData? icon;
  final IconData? suffixIcon;
  final VoidCallback? callback;
  final VoidCallback? suffixCallback;
  final EdgeInsetsGeometry? padding;

  const CustomAppBar({
    super.key,
    this.leading = false,
    this.suffix = false,
    this.suffixIcon,
    required this.title,
    this.icon,
    this.callback,
    this.suffixCallback,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(top: 80, left: 15, right: 15, bottom: 10),
      child: Row(
        children: [
          leading
              ? GestureDetector(
                  onTap: callback,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.grey),
                    ),
                    child: Icon(icon ?? FontAwesomeIcons.chevronLeft),
                  ),
                )
              : const SizedBox(),
          leading ? const SizedBox(width: 10) : const SizedBox(),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.start,
            ),
          ),
          suffix ? const SizedBox(width: 10) : const SizedBox(),
          suffix
              ? GestureDetector(
                  onTap: suffixCallback,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.grey),
                    ),
                    child: Icon(suffixIcon ?? FontAwesomeIcons.chevronLeft),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
