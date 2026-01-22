import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppGenderSelection extends StatefulWidget {
  const AppGenderSelection({super.key});

  @override
  State<AppGenderSelection> createState() => _AppGenderSelectionState();
}

class _AppGenderSelectionState extends State<AppGenderSelection> {
  int currentGenderIndex = 0;

  final genderList = ['Male', 'Female'];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xffEAEDEC),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: Theme.of(
              context,
            ).inputDecorationTheme.enabledBorder!.borderSide.color,
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<int>(
            isExpanded: true,
            value: currentGenderIndex,
            items: List.generate(
              genderList.length,
              (index) => DropdownMenuItem<int>(
                value: index,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.r,
                    vertical: 12.r,
                  ),
                  child: Text(
                    genderList[index],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
            onChanged: (value) {
              setState(() {
                currentGenderIndex = value!;
              });
            },
          ),
        ),
      ),
    );
  }
}
