import 'package:auvnet_task/core/utils/text_style_manager.dart';
import 'package:auvnet_task/data/model/shortcut_model.dart';
import 'package:flutter/material.dart';

class ShortcutWidget extends StatelessWidget {
  final ShortcutModel shortcutModel;
  const ShortcutWidget({
    super.key,
    required this.shortcutModel,
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
            color: const Color(0xffFFEEE6),
            borderRadius: BorderRadius.circular(16),
          ),
          child:
              Image.network(shortcutModel.imageUrl ?? "", fit: BoxFit.contain),
        ),
        Text(shortcutModel.name ?? "", style: AppTextStyle.medium14),
      ],
    );
  }
}
