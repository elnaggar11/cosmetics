import 'package:flutter/material.dart';

class DropDownTextField extends StatelessWidget {
  const DropDownTextField({super.key});

  final List<String> items = const ['+20', '+1', '+23', '+44', '+91'];
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: _buildBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        focusColor: Colors.grey,
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
      ),
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
      onChanged: (value) {},
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.grey),
    );
  }
}
