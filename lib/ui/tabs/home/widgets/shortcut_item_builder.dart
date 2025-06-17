import 'package:auvnet_task/core/utils/config.dart';
import 'package:auvnet_task/data/model/shortcut_model.dart';
import 'package:auvnet_task/ui/Auth/view_model/bloc/auth_bloc.dart';
import 'package:auvnet_task/ui/tabs/home/view_model/bloc/home_bloc.dart';
import 'package:auvnet_task/ui/tabs/home/view_model/bloc/home_state.dart';
import 'package:auvnet_task/ui/tabs/home/widgets/shortcut_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShortcutItemBuilder extends StatefulWidget {
  const ShortcutItemBuilder({super.key});

  @override
  State<ShortcutItemBuilder> createState() => _ShortcutItemBuilderState();
}

class _ShortcutItemBuilderState extends State<ShortcutItemBuilder> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      HomeBloc.get(context).getShortcuts();
    });
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        if (current.status == Status.loading ||
            current.status == Status.error ||
            current.status == Status.shortcut) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        switch (state.status) {
          case Status.shortcut:
            return SizedBox(
              height: Config.screenHight! * 0.2,
              child: ListView.separated(
                itemCount: state.shortcuts?.length ?? 0,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ShortcutWidget(
                  shortcutModel: state.shortcuts?[index] ?? ShortcutModel(),
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 8),
              ),
            );
          case Status.error:
            return Center(child: Text(state.exception.toString()));
          default:
            return const Center(child: CircularProgressIndicator.adaptive());
        }
      },
    );
  }
}
