import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app_flutter/core/style/style.dart';
import 'package:payment_app_flutter/features/cart/logic/logic_cart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => IconButton(
        onPressed: () {
          if (ref.read(logicCartProvider).items.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('There are no products in the cart'),
              ),
            );
          } else {
            context.go('/CartScreen');
          }
        },
        icon: const Icon(
          Icons.shopping_cart_outlined,
          color: StyleApp.white,
        ),
      ),
    );
  }
}
