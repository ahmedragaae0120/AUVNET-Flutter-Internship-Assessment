import 'package:auvnet_task/core/utils/config.dart';
import 'package:auvnet_task/core/utils/text_style_manager.dart';
import 'package:auvnet_task/ui/tabs/home/widgets/security_widget.dart';
import 'package:auvnet_task/ui/tabs/home/widgets/services_item_builder.dart';
import 'package:auvnet_task/ui/tabs/home/widgets/shortcut_item_builder.dart';
import 'package:auvnet_task/ui/tabs/home/widgets/shortcut_widget.dart';
import 'package:auvnet_task/ui/tabs/home/widgets/welcome_container.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return CustomScrollView(slivers: [
      WelcomeContainer(),
      ServicesItemBuilder(),
      SecurityWidget(),
      ShortcutItemBuilder(),
    ]);
  }
}

// padding(
//       padding: const EdgeInsets.symmetric(horizontal: 0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // الهيدر الملون

//           Config.spaceSmall,
//           Text("Services:", style: AppTextStyle.bold20),
//           Expanded(
//             child: ServicesItemBuilder(),
//           ),
//           Expanded(child: const SecurityWidget()),
//           Text("Shortcuts:", style: AppTextStyle.bold20),

//           Expanded(
//             child: const ShortcutItemBuilder(),
//           ),
//         ],
//       ),
//     );
