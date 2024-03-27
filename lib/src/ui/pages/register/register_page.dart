import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app_colors.dart';
import '../../../app_widget.dart';
import '../../../get_it/get_it.dart';
import '../../../validators/email_validator.dart';
import '../../controller/register/register_controller.dart';
import '../../controller/register/register_state.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/elevated_button_widget.dart';
import '../../widgets/label_text_form_field.dart';
import '../../widgets/loading_effect_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final registerController = getIt.get<RegisterController>();

  @override
  void initState() {
    registerController.addListener(
      () {
        if (mounted) {
          if (registerController.value is LoadingRegisterState) {
            showDialog(
              barrierDismissible: true,
              context: context,
              builder: (_) => const LoadingEffectWidget(message: ''),
            );
          }

          if (registerController.value is SuccessRegisterState) {
            context.pop();

            scaffoldMessenger.currentState!.showSnackBar(
              const CustomSnackBar(
                color: AppColors.green,
                content: Text('Your account is been registered!'),
              ),
            );
          }

          if (registerController.value is EmailAlreadyExistRegisterState) {
            context.pop();

            scaffoldMessenger.currentState!.showSnackBar(
              const CustomSnackBar(
                color: AppColors.red,
                content: Text('Already exist account with e-mail, try recovery password or create new.'),
              ),
            );
          }

          if (registerController.value is ErrorRegisterState) {
            context.pop();

            scaffoldMessenger.currentState!.showSnackBar(
              const CustomSnackBar(
                color: AppColors.red,
                content: Text('Occur a error when go create your account  '),
              ),
            );
          }
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'Sign Up', leading: true, callback: context.pop),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 10),
              child: Form(
                key: registerController.formKey,
                child: Column(
                  children: [
                    LabelTextFormField(
                        controller: registerController.emailController,
                        label: 'Email',
                        textHint: 'Input your e-mail here',
                        buildContext: context,
                        callBackValidator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'The email field is required';
                          }

                          if (!EmailValidator.emailValidator(value)) {
                            return 'The format of email is invalid';
                          }

                          return null;
                        }),
                    const SizedBox(height: 10),
                    LabelTextFormField(
                        controller: registerController.passwordController,
                        label: 'Password',
                        textHint: 'Input your password here',
                        isObscureText: true,
                        buildContext: context,
                        callBackValidator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'The password field is required';
                          }

                          if (value.length < 6) {
                            return 'The password need min 6 characters';
                          }

                          return null;
                        }),
                    const SizedBox(height: 10),
                    LabelTextFormField(
                        controller: registerController.passwordConfirmationController,
                        label: 'Confirm Password',
                        textHint: 'Input your confirmation password here',
                        isObscureText: true,
                        buildContext: context,
                        callBackValidator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'The confirm password field is required';
                          }

                          if (value != registerController.passwordController.text.trim()) {
                            return 'The passwords not equals';
                          }

                          return null;
                        }),
                    const SizedBox(height: 10),
                    ElevatedButtonWidget(
                      callback: () async {
                        if (!registerController.formKey.currentState!.validate()) {
                          return;
                        }

                        await registerController.createAccount();
                      },
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
