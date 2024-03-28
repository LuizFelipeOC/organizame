import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app_colors.dart';
import '../../../app_widget.dart';
import '../../../get_it/get_it.dart';
import '../../../validators/email_validator.dart';
import '../../controller/forgot_password/forgot_password.dart';
import '../../controller/forgot_password/forgot_password_state.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_snack_bar.dart';
import '../../widgets/elevated_button_widget.dart';
import '../../widgets/label_text_form_field.dart';
import '../../widgets/loading_effect_widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _controller = getIt.get<ForgotPasswordController>();

  @override
  void initState() {
    _controller.addListener(() {
      if (mounted) {
        if (_controller.value is LoadingSendMailer) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) => const LoadingEffectWidget(message: ''),
          );
        }

        if (_controller.value is SuccessSendMailer) {
          context.pop();

          scaffoldMessenger.currentState!.showSnackBar(
            const CustomSnackBar(
              content: Text('Email sent successfully! Check your email or spam folder.'),
              color: AppColors.green,
            ),
          );

          context.pop();
        }

        if (_controller.value is FailureSendMailer) {
          context.pop();

          scaffoldMessenger.currentState!.showSnackBar(
            const CustomSnackBar(
              content: Text('Occur an error in send mail, please try again later.'),
              color: AppColors.red,
            ),
          );
        }
      }
    });
    super.initState();
  }

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
              key: _controller.formKey,
              child: Column(
                children: [
                  LabelTextFormField(
                      controller: _controller.emailController,
                      label: 'E-mail',
                      textHint: 'Input here your e-mail to recovery password',
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
                  ElevatedButtonWidget(
                    width: MediaQuery.of(context).size.width,
                    callback: () async => {
                      FocusScope.of(context).unfocus(),
                      await _controller.send(),
                    },
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
