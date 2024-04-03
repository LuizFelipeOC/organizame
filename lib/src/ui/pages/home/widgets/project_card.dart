import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../app_colors.dart';
import '../../../../data/model/projects.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel item;

  const ProjectCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border(
            bottom: BorderSide(
              width: 0.3,
              color: AppColors.pinkPrimary,
            ),
            right: BorderSide(
              width: 0.4,
              color: AppColors.pinkPrimary,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.alias,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item.description,
                    style: Theme.of(context).textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => {},
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: const Icon(FontAwesomeIcons.arrowRight),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
