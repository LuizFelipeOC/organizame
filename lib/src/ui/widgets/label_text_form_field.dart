import 'package:flutter/material.dart';

import '../../app_colors.dart';

class LabelTextFormField extends StatelessWidget {
  final String label;
  final String textHint;
  final String? Function(String? value)? callBackValidator;
  final bool isObscureText;
  final BuildContext buildContext;
  final TextEditingController? controller;

  const LabelTextFormField({
    super.key,
    required this.label,
    required this.textHint,
    this.callBackValidator,
    this.isObscureText = false,
    required this.buildContext,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(buildContext).viewInsets.bottom),
          obscureText: isObscureText,
          style: Theme.of(context).textTheme.labelMedium,
          cursorColor: AppColors.purpleSecondary,
          decoration: InputDecoration(
            hintText: textHint,
          ),
          validator: callBackValidator,
          onTapOutside: (e) => FocusScope.of(context).unfocus(),
        ),
      ],
    );
  }
}
