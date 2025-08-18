import 'package:flutter/material.dart';

class CustomAppDetails extends StatelessWidget {
  const CustomAppDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                size: 30,
              )),
          const Spacer(),
          IconButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              icon: const Icon(Icons.shopping_cart_outlined)),
        ],
      ),
    );
  }
}
