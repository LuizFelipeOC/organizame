import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'custom_app_bar.dart';

class ModalPrivacyPolicies extends StatefulWidget {
  const ModalPrivacyPolicies({super.key});

  @override
  State<ModalPrivacyPolicies> createState() => _ModalPrivacyPoliciesState();
}

class _ModalPrivacyPoliciesState extends State<ModalPrivacyPolicies> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAppBar(
            leading: true,
            callback: context.pop,
            icon: FontAwesomeIcons.chevronDown,
            padding: const EdgeInsets.only(top: 30),
            title: 'Terms and Policies',
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Polic',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 5),
              Text(
                'We collect info you provide and from your app use to improve it, contact you, and potentially share with service providers. We respect your privacy and offer choices like marketing control and account deletion. Contact us with any questions.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
