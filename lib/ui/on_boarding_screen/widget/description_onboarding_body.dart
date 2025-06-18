import 'package:auvnet_task/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class DescriptionOnboardingBody extends StatelessWidget {
  final String title;
  final String description;
  const DescriptionOnboardingBody(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 5,
      children: [
        FittedBox(
          child: Text(
            title,
            style: AppTextStyle.medium28
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          description,
          style: AppTextStyle.regular14
              .copyWith(color: Theme.of(context).colorScheme.onSecondary),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
