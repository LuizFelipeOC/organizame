import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app_colors.dart';
import '../../../app_widget.dart';
import '../../../get_it/get_it.dart';
import '../../controller/projects/projects_controller.dart';
import '../../controller/projects/projects_results.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_snack_bar.dart';
import '../../widgets/elevated_button_widget.dart';
import '../../widgets/label_text_form_field.dart';
import '../../widgets/loading_effect_widget.dart';

class FormCreateProjectPage extends StatefulWidget {
  const FormCreateProjectPage({super.key});

  @override
  State<FormCreateProjectPage> createState() => _FormCreateProjectPageState();
}

class _FormCreateProjectPageState extends State<FormCreateProjectPage> {
  final controller = getIt.get<ProjectController>();

  @override
  void initState() {
    controller.addListener(() {
      if (mounted) {
        if (controller.value is LoadingProjectState) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) {
              return const LoadingEffectWidget(message: '');
            },
          );
        }

        if (controller.value is ErrorProjectState) {
          context.pop();

          scaffoldMessenger.currentState!.showSnackBar(
            const CustomSnackBar(
              color: AppColors.red,
              content: Text('Occur an error in project creation, try later!'),
            ),
          );
        }

        if (controller.value is SuccessProjectState) {
          context.pop();

          scaffoldMessenger.currentState!.showSnackBar(
            const CustomSnackBar(
              color: AppColors.green,
              content: Text('Project created with success! Updated your home page.'),
            ),
          );

          context.pop();
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
                key: controller.formKey,
                child: Column(
                  children: [
                    LabelTextFormField(
                      controller: controller.aliasController,
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
                      controller: controller.descriptionController,
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
                      callback: () async => await controller.create(),
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
