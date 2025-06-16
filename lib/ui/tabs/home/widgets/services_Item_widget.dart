import 'package:auvnet_task/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class ServicesItemWidget extends StatelessWidget {
  final String imageUrl;
  final String label;
  final String title;

  const ServicesItemWidget({
    super.key,
    required this.imageUrl,
    required this.label,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.network(imageUrl, fit: BoxFit.contain),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(label,
              style: AppTextStyle.medium12
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary)),
        ),
        const SizedBox(height: 4),
        Text(title, style: AppTextStyle.medium14),
      ],
    );
  }
}
