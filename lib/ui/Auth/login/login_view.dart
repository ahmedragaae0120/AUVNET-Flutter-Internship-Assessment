import 'dart:developer';

import 'package:auvnet_task/core/resuble_componets/validator.dart';
import 'package:auvnet_task/core/utils/assets_manager.dart';
import 'package:auvnet_task/core/utils/config.dart';
import 'package:auvnet_task/core/utils/routes_manager.dart';
import 'package:auvnet_task/core/utils/toast_message.dart';
import 'package:auvnet_task/ui/Auth/view_model/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _loginPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      AuthBloc.get(context).login(
          email: _emailController.text, password: _passwordController.text);
    }
    return null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        switch (state.status) {
          case Status.success:
            toastMessage(
                message: "Successfully login",
                tybeMessage: TybeMessage.positive);
            Navigator.pushNamedAndRemoveUntil(
                context, RouteManager.mainScreen, (_) => false);
            break;
          case Status.error:
            log(state.exception.toString());
            toastMessage(
                message: state.exception.toString(),
                tybeMessage: TybeMessage.negative);
            break;
          default:
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                spacing: 18,
                children: [
                  Center(child: Image.asset(AssetsManager.imagesNawelIcon)),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    controller: _emailController,
                    validator: Validator.email,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                    controller: _passwordController,
                    validator: Validator.password,
                  ),
                  SizedBox(
                    height: Config.screenHight! * 0.01,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _loginPressed();
                    },
                    child: state.status == Status.loading
                        ? const CircularProgressIndicator.adaptive()
                        : const Text("Log in"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, RouteManager.singupScreen, (route) => false);
                    },
                    child: const Text("Create an account"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
