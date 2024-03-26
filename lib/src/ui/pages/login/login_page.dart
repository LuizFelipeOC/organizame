import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/elevated_button_widget.dart';
import '../../widgets/icon_elevated_button_widget.dart';
import '../../widgets/label_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 15, right: 15, bottom: 10),
            child: Text(
              'Log In',
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                top: 30,
                left: 15,
                right: 15,
                bottom: 10,
              ),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Log in with one of the following options',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      IconElevatedButon(
                        icon: FontAwesomeIcons.google,
                        text: 'Google',
                        callback: () {},
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 5, right: 5),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          LabelTextFormField(
                            buildContext: context,
                            label: 'E-mail',
                            textHint: 'Input your email',
                            callBackValidator: (String? value) => null,
                          ),
                          const SizedBox(height: 20),
                          LabelTextFormField(
                            buildContext: context,
                            label: 'Password',
                            textHint: 'Input your password',
                            callBackValidator: (String? value) => null,
                            isObscureText: true,
                          ),
                          const SizedBox(height: 10),
                          ElevatedButtonWidget(
                            width: MediaQuery.of(context).size.width,
                            height: 52,
                            title: 'Log in',
                            callback: () {},
                          ),
                          const SizedBox(height: 20),
                          Text.rich(
                            TextSpan(
                              text: "Don't have an account ?  ",
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()..onTap = () => {},
                                  text: 'Sign up',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
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
