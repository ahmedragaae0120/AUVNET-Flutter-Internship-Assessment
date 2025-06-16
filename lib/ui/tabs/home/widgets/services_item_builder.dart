import 'package:auvnet_task/ui/tabs/home/widgets/services_Item_widget.dart';
import 'package:flutter/material.dart';

class ServicesItemBuilder extends StatelessWidget {
  const ServicesItemBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => const ServicesItemWidget(
        imageUrl:
            "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
        label: "Label",
        title: "Title",
      ),
      separatorBuilder: (context, index) => const SizedBox(width: 8),
    );
  }
}
