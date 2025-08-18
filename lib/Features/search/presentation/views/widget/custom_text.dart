import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key,required this.onSubmitted});
  final Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted:onSubmitted,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.search),
        hintText: 'Search',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
