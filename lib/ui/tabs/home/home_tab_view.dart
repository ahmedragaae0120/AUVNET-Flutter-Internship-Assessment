import 'package:auvnet_task/core/Di/di.dart';
import 'package:auvnet_task/core/utils/config.dart';
import 'package:auvnet_task/core/utils/text_style_manager.dart';
import 'package:auvnet_task/ui/tabs/home/view_model/bloc/home_bloc.dart';
import 'package:auvnet_task/ui/tabs/home/widgets/carousel_slider_widget.dart';
import 'package:auvnet_task/ui/tabs/home/widgets/popular_restaurant_builder.dart';
import 'package:auvnet_task/ui/tabs/home/widgets/security_widget.dart';
import 'package:auvnet_task/ui/tabs/home/widgets/services_item_builder.dart';
import 'package:auvnet_task/ui/tabs/home/widgets/shortcut_item_builder.dart';
import 'package:auvnet_task/ui/tabs/home/widgets/welcome_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child: CustomScrollView(slivers: [
        const WelcomeContainer(),
        const SliverToBoxAdapter(child: Config.spaceSmall),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
              delegate: SliverChildListDelegate([
            Text("Services:", style: AppTextStyle.bold20),
            Config.spaceSmall,
            const ServicesItemBuilder(),
            const SecurityWidget(),
            Config.spaceSmall,
            Text("Shortcuts:", style: AppTextStyle.bold20),
            const ShortcutItemBuilder(),
            Config.spaceSmall,
            const CarouselSliderWidget(),
            Config.spaceSmall,
            Text("Popular restaurants nearby:", style: AppTextStyle.bold20),
            Config.spaceSmall,
            const PopularRestaurantBuilder(),
          ])),
        ),

        // const SliverToBoxAdapter(child: Config.spaceSmall),
        // const SliverToBoxAdapter(child: Config.spaceSmall),
        // const SliverToBoxAdapter(child: Config.spaceSmall),

        // const SliverToBoxAdapter(child: Config.spaceSmall),
      ]),
    );
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
