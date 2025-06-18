import 'package:flutter/material.dart';

class CartTabView extends StatelessWidget {
  const CartTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(child: Text("Cart")),
    );
  }
}
