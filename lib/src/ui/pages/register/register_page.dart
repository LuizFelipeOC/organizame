import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/elevated_button_widget.dart';
import '../../widgets/label_text_form_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Sign Up',
            leading: true,
            callback: context.pop,
          ),
          Expanded(
            child: SingleChildScrollView(
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
                      label: 'Username',
                      textHint: 'Input your username here',
                      buildContext: context,
                    ),
                    const SizedBox(height: 10),
                    LabelTextFormField(
                      label: 'Email',
                      textHint: 'Input your e-mail here',
                      buildContext: context,
                    ),
                    const SizedBox(height: 10),
                    LabelTextFormField(
                      label: 'Password',
                      textHint: 'Input your password here',
                      isObscureText: true,
                      buildContext: context,
                    ),
                    const SizedBox(height: 10),
                    LabelTextFormField(
                      label: 'Confirm Password',
                      textHint: 'Input your confirmation password here',
                      isObscureText: true,
                      buildContext: context,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButtonWidget(
                      callback: () {},
                      title: 'Sign up',
                      width: MediaQuery.of(context).size.width,
                    ),
                    const SizedBox(height: 40),
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: "By accepting, you accept our\n",
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            text: 'policy and privacy terms',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
