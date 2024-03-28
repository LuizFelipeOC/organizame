import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../app_colors.dart';
import '../../../app_widget.dart';
import '../../../get_it/get_it.dart';
import '../../../validators/email_validator.dart';
import '../../controller/login/login_controller.dart';
import '../../controller/login/login_result.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_snack_bar.dart';
import '../../widgets/elevated_button_widget.dart';
import '../../widgets/icon_elevated_button_widget.dart';
import '../../widgets/label_text_form_field.dart';
import '../../widgets/loading_effect_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = getIt.get<LoginController>();

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.value is LoadingLoginState) {
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (_) => const LoadingEffectWidget(message: ''),
        );
      }

      if (_controller.value is InvalidCredentials) {
        context.pop();

        scaffoldMessenger.currentState!.showSnackBar(
          const CustomSnackBar(
            color: AppColors.red,
            content: Text('Email or Password is invalid.'),
          ),
        );
      }

      if (_controller.value is ErrorLoginCredentials) {
        context.pop();

        scaffoldMessenger.currentState!.showSnackBar(
          const CustomSnackBar(
            color: AppColors.red,
            content: Text('Occur an internal error, try again later.'),
          ),
        );
      }

      if (_controller.value is SuccessLoginState) {
        context.push('/home');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(title: 'Log in'),
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
                      key: _controller.formController,
                      child: Column(
                        children: [
                          LabelTextFormField(
                              controller: _controller.emailController,
                              buildContext: context,
                              label: 'E-mail',
                              textHint: 'Input your email',
                              callBackValidator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'The email field is required';
                                }

                                if (!EmailValidator.emailValidator(value)) {
                                  return 'The format of email is invalid';
                                }

                                return null;
                              }),
                          const SizedBox(height: 20),
                          LabelTextFormField(
                              controller: _controller.passwordController,
                              buildContext: context,
                              label: 'Password',
                              textHint: 'Input your password',
                              isObscureText: true,
                              callBackValidator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'The password field is required';
                                }

                                return null;
                              }),
                          const SizedBox(height: 10),
                          ElevatedButtonWidget(
                            width: MediaQuery.of(context).size.width,
                            height: 52,
                            title: 'Log in',
                            callback: () async {
                              FocusScope.of(context).unfocus();

                              await _controller.login();
                            },
                          ),
                          const SizedBox(height: 20),
                          Text.rich(
                            TextSpan(
                              text: "Don't have an account ?  ",
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.push('/register');
                                    },
                                  text: 'Sign up',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              context.push('/forgot-password');
                            },
                            child: Text(
                              'Forgot password',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          )
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
