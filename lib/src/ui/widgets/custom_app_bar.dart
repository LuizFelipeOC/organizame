import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final bool leading;
  final String title;
  final IconData? icon;
  final VoidCallback? callback;
  final EdgeInsetsGeometry? padding;

  const CustomAppBar({
    super.key,
    this.leading = false,
    required this.title,
    this.icon,
    this.callback,
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
        ],
      ),
    );
  }
}
