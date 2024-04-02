import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../app_colors.dart';
import '../../../get_it/get_it.dart';
import '../../controller/home/home_controller.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/project_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = getIt.get<HomeController>();

  @override
  void initState() {
    _controller.fetch();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: _controller.projects,
            builder: (_, value, __) {
              return CustomAppBar(
                  title: 'Welcome',
                  leading: true,
                  icon: FontAwesomeIcons.userAstronaut,
                  callback: () => {},
                  suffix: value.isNotEmpty,
                  suffixIcon: FontAwesomeIcons.plus,
                  suffixCallback: () async {
                    final result = await context.push<bool?>('/create-project');

                    if (result == null) return;

                    await _controller.fetch();
                  });
            },
          ),
          ValueListenableBuilder(
            valueListenable: _controller.isLoading,
            builder: (_, value, __) {
              if (value) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                    ),
                  ),
                );
              }

              return ValueListenableBuilder(
                valueListenable: _controller.projects,
                builder: (_, projects, __) {
                  if (projects.isEmpty) {
                    return Expanded(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              FontAwesomeIcons.faceSadCry,
                              size: 80,
                            ),
                            const SizedBox(height: 20),
                            Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                text: "Do you don't have projects created ? \n\n",
                                children: [
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        final result = await context.push<bool?>('/create-project');

                                        if (result == null) return;

                                        await _controller.fetch();
                                      },
                                    text: 'Create now',
                                    style: Theme.of(context).textTheme.labelLarge,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.topCenter,
                      child: RefreshIndicator(
                        backgroundColor: AppColors.blackColor,
                        color: AppColors.white,
                        onRefresh: () async => await _controller.fetch(),
                        child: GridView.builder(
                          itemCount: projects.length,
                          physics: const AlwaysScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (_, int index) {
                            final item = projects[index];

                            return ProjectCard(item: item);
                          },
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
