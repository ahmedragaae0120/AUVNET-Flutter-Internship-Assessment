import 'package:auvnet_task/core/utils/assets_manager.dart';
import 'package:auvnet_task/core/utils/config.dart';
import 'package:auvnet_task/core/utils/text_style_manager.dart';
import 'package:auvnet_task/data/model/description_onboarding_model%20.dart';
import 'package:auvnet_task/ui/on_boarding_screen/widget/description_onboarding_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  List<DescriptionOnboardingModel> descriptions = [
    DescriptionOnboardingModel(
        title: "all-in-one delivery",
        description:
            "Order groceries, medicines, and meals delivered straight to your doors"),
    DescriptionOnboardingModel(
        title: "User-to-User Delivery",
        description:
            "Send or receive items from other users quickly and easily"),
    DescriptionOnboardingModel(
        title: "Sales & Discounts",
        description: "Discover exclusive sales and deals every day"),
  ];
  int currentDescriptionBody = 0;
  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                AssetsManager.imagesOnboardingIcon,
                fit: BoxFit.cover,
                height: Config.screenHight! * 0.5,
                width: Config.screenWidth! * 0.9,
              ),
            ),
            Config.spaceSmall,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DescriptionOnboardingBody(
                        title: descriptions[currentDescriptionBody].title,
                        description:
                            descriptions[currentDescriptionBody].description),
                    Config.spaceSmall,
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Get Started"),
                    ),
                    if (descriptions.length - 1 != currentDescriptionBody)
                      TextButton(
                        onPressed: () {
                          if (currentDescriptionBody <
                              descriptions.length - 1) {
                            setState(() {
                              currentDescriptionBody++;
                            });
                          }
                        },
                        child: Text(
                          "Next",
                          style: AppTextStyle.regular14.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary),
                        ),
                      ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
