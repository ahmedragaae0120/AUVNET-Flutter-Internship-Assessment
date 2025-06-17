import 'package:auvnet_task/core/utils/config.dart';
import 'package:auvnet_task/data/model/popular_restaurant_model.dart';
import 'package:auvnet_task/ui/Auth/view_model/bloc/auth_bloc.dart';
import 'package:auvnet_task/ui/tabs/home/view_model/bloc/home_bloc.dart';
import 'package:auvnet_task/ui/tabs/home/view_model/bloc/home_state.dart';
import 'package:auvnet_task/ui/tabs/home/widgets/popular_restaurant_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularRestaurantBuilder extends StatefulWidget {
  const PopularRestaurantBuilder({super.key});

  @override
  State<PopularRestaurantBuilder> createState() =>
      _PopularRestaurantBuilderState();
}

class _PopularRestaurantBuilderState extends State<PopularRestaurantBuilder> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      HomeBloc.get(context).getPopularRestaurants();
    });
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        if (current.status == Status.loading ||
            current.status == Status.error ||
            current.status == Status.popular) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        switch (state.status) {
          case Status.popular:
            return SizedBox(
              height: Config.screenHight! * 0.2,
              child: ListView.separated(
                itemCount: state.popularRestaurants?.length ?? 0,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => PopularRestaurantWidget(
                  restaurants: state.popularRestaurants?[index] ??
                      PopularRestaurantModel(),
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 8),
              ),
            );
          case Status.error:
            return Center(child: Text(state.exception.toString()));
          default:
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            );
        }
      },
    );
  }
}
