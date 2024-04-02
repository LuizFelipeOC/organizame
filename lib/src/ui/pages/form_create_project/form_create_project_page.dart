import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/elevated_button_widget.dart';
import '../../widgets/label_text_form_field.dart';

class FormCreateProjectPage extends StatefulWidget {
  const FormCreateProjectPage({super.key});

  @override
  State<FormCreateProjectPage> createState() => _FormCreateProjectPageState();
}

class _FormCreateProjectPageState extends State<FormCreateProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Create project',
            leading: true,
            callback: () => context.pop(),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const BouncingScrollPhysics(),
              child: Form(
                child: Column(
                  children: [
                    LabelTextFormField(
                      label: 'Name project',
                      textHint: 'Input the name project here',
                      buildContext: context,
                      callBackValidator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    LabelTextFormField(
                      label: 'Short Description',
                      textHint: 'Input the short description here',
                      buildContext: context,
                      callBackValidator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return null;
                        }

                        if (value.trim().length >= 50) {
                          return 'Your description is very longer';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    ElevatedButtonWidget(
                      height: 52,
                      width: MediaQuery.of(context).size.width,
                      callback: () {},
                      title: 'Create new project',
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
