import 'package:flutter/material.dart';

class ProfileTabView extends StatelessWidget {
  const ProfileTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 222, 243, 33),
      child: const Center(child: Text("Profile")),
    );
  }
}
