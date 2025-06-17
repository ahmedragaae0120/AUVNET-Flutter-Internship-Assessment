import 'package:auvnet_task/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class ShortcutWidget extends StatelessWidget {
  final String imageUrl;
  final String shortcutName;
  const ShortcutWidget(
      {super.key, required this.imageUrl, required this.shortcutName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xffFFEEE6),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.network(imageUrl, fit: BoxFit.contain),
        ),
        Text(shortcutName, style: AppTextStyle.medium14),
      ],
    );
  }
}
