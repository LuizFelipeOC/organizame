import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../app_colors.dart';
import '../../widgets/custom_app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Profile',
            leading: true,
            callback: () => context.pop(),
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(90),
                        ),
                        child: const Center(
                          child: Icon(
                            size: 38,
                            FontAwesomeIcons.userAstronaut,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 100,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(90),
                        ),
                        child: const Icon(
                          size: 18,
                          FontAwesomeIcons.pen,
                          color: AppColors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text('Username', style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 5),
              Text('example@example.com.br', style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
          Expanded(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
              children: [
                CustomListTile(
                  callback: () {},
                  iconLeading: FontAwesomeIcons.pencil,
                  title: 'Edit profile',
                  subTitle: 'Change your basic informations',
                ),
                CustomListTile(
                  callback: () {},
                  iconLeading: FontAwesomeIcons.lock,
                  title: 'Security',
                  subTitle: 'Change your password, active biometric unlock and others',
                ),
                CustomListTile(
                  callback: () {},
                  iconLeading: FontAwesomeIcons.solidFolder,
                  title: 'Terms and Policies',
                  subTitle: 'View the terms and policies of application',
                ),
              ],
            ),
          ),
          TextButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.grey,
            ),
            onPressed: () {},
            child: Text(
              'LOGOUT ACCOUNT',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColors.red,
                  ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final String? subTitle;
  final IconData? iconLeading;
  final bool isActive;
  final VoidCallback? callback;

  const CustomListTile({
    super.key,
    this.isActive = false,
    required this.title,
    this.subTitle,
    this.iconLeading,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: isActive,
      onTap: callback,
      leading: iconLeading == null ? const Icon(FontAwesomeIcons.confluence) : Icon(iconLeading),
      title: Text(title),
      subtitle: subTitle == null
          ? const SizedBox()
          : Text(
              subTitle!,
              overflow: TextOverflow.ellipsis,
            ),
    );
  }
}
