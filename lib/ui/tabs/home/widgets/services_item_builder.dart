import 'package:auvnet_task/core/utils/config.dart';
import 'package:auvnet_task/data/model/service_model.dart';
import 'package:auvnet_task/ui/Auth/view_model/bloc/auth_bloc.dart';
import 'package:auvnet_task/ui/tabs/home/view_model/bloc/home_bloc.dart';
import 'package:auvnet_task/ui/tabs/home/view_model/bloc/home_state.dart';
import 'package:auvnet_task/ui/tabs/home/widgets/services_Item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesItemBuilder extends StatefulWidget {
  const ServicesItemBuilder({
    super.key,
  });

  @override
  State<ServicesItemBuilder> createState() => _ServicesItemBuilderState();
}

class _ServicesItemBuilderState extends State<ServicesItemBuilder> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      HomeBloc.get(context).getServices();
    });
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        if (current.status == Status.loading ||
            current.status == Status.error ||
            current.status == Status.services) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        switch (state.status) {
          case Status.services:
            return SizedBox(
              height: Config.screenHight! * 0.2,
              child: ListView.separated(
                itemCount: state.services?.length ?? 0,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ServicesItemWidget(
                  serviceModel: state.services?[index] ?? ServiceModel(),
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
