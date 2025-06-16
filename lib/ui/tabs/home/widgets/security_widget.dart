import 'package:auvnet_task/core/utils/assets_manager.dart';
import 'package:auvnet_task/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class SecurityWidget extends StatelessWidget {
  const SecurityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            AssetsManager.iconsSecurityIcon,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  "Got a code !",
                  style: AppTextStyle.bold18,
                ),
                Text(
                  "Add your code and save on your order",
                  style: AppTextStyle.medium14.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
