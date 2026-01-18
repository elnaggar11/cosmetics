import 'package:cosmetics/core/ui/app_input.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return AppInput(
      hintText: 'Search',
      suffixIcon: 'search.svg',
      textInputAction: TextInputAction.done,
    );
  }
}
