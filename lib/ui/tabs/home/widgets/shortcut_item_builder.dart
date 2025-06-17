import 'package:auvnet_task/core/utils/config.dart';
import 'package:auvnet_task/ui/tabs/home/widgets/shortcut_widget.dart';
import 'package:flutter/material.dart';

class ShortcutItemBuilder extends StatelessWidget {
  const ShortcutItemBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return SliverToBoxAdapter(
      child: SizedBox(
        height: Config.screenHight! * 0.2,
        child: ListView.separated(
          itemCount: 10,
          shrinkWrap: true,
          primary: false,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const ShortcutWidget(
            imageUrl:
                "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
            shortcutName: "Title",
          ),
          separatorBuilder: (context, index) => const SizedBox(width: 8),
        ),
      ),
    );
  }
}
