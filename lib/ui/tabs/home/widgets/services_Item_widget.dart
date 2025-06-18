import 'package:auvnet_task/core/utils/config.dart';
import 'package:auvnet_task/core/utils/text_style_manager.dart';
import 'package:auvnet_task/data/model/service_model.dart';
import 'package:flutter/material.dart';

class ServicesItemWidget extends StatelessWidget {
  final ServiceModel serviceModel;

  const ServicesItemWidget({
    super.key,
    required this.serviceModel,
  });

  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: Config.screenHight! * 0.12,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.network(
              serviceModel.imageUrl ?? "",
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const Icon(Icons.error),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            serviceModel.deliveryTime ?? "",
            style: AppTextStyle.medium12.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Flexible(
          child: Text(
            serviceModel.name ?? "",
            style: AppTextStyle.medium14,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
