import 'dart:developer';

import 'package:auvnet_task/core/resuble_componets/validator.dart';
import 'package:auvnet_task/core/utils/assets_manager.dart';
import 'package:auvnet_task/core/utils/config.dart';
import 'package:auvnet_task/core/utils/routes_manager.dart';
import 'package:auvnet_task/core/utils/toast_message.dart';
import 'package:auvnet_task/ui/Auth/view_model/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _signUpPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      AuthBloc.get(context).createNewAccount(
          email: _emailController.text, password: _passwordController.text);
    }
    return null;
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
                message: "Successfully Signed up",
                tybeMessage: TybeMessage.positive);
            Navigator.pushNamedAndRemoveUntil(
                context, RouteManager.loginScreen, (_) => false);
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
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                    controller: _confirmPasswordController,
                    validator: Validator.confirmPassword,
                  ),
                  SizedBox(
                    height: Config.screenHight! * 0.01,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _signUpPressed();
                    },
                    child: const Text("Sign up"),
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
