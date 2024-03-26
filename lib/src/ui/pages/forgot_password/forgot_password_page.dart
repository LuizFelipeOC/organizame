import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/elevated_button_widget.dart';
import '../../widgets/label_text_form_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Forgot Password',
            leading: true,
            callback: context.pop,
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(
              top: 30,
              left: 15,
              right: 15,
              bottom: 10,
            ),
            child: Form(
              child: Column(
                children: [
                  LabelTextFormField(
                    label: 'E-mail',
                    textHint: 'Input here your e-mail to recovery password',
                    buildContext: context,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButtonWidget(
                    width: MediaQuery.of(context).size.width,
                    callback: () {},
                    title: 'Recovery password',
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
