import 'package:flutter/material.dart';
import 'package:linkedin/src/core/constants/app_strings.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return SizedBox(
      height: 35,
      child: TextFormField(
        cursorColor: const Color(0xFF85828E),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 5,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          fillColor: const Color(0xFFEFEFEF),
          filled: true,
          hintText: AppStrings.search,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(width: 0),
          ),
        ),
      ),
    );
  }
}
