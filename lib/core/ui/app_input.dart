import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_image.dart';
import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  const AppInput({
    super.key,
    this.suffixIcon,
    this.hintText,
    this.label,
    this.withCountryCode = false,
    this.isPassword = false,
    this.textInputAction = TextInputAction.next,
    this.isGenderSelection = false,
    this.keyboardType = TextInputType.emailAddress,
    this.isInputContent = false,
  });
  final String? suffixIcon, hintText, label;
  final bool withCountryCode, isPassword, isGenderSelection, isInputContent;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  late int currentCuntryIndex;
  int currentGenderIndex = 0;

  final list = [10, 20, 30, 40];
  final genderList = ['Male', 'Female'];
  bool isHidden = true;
  @override
  void initState() {
    currentCuntryIndex = list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Row(
        children: [
          if (widget.withCountryCode)
            SizedBox(
              width: 90.w,
              child: Padding(
                padding: EdgeInsetsDirectional.only(end: 6.r),
                child: DropdownButtonFormField<int>(
                  borderRadius: BorderRadius.circular(8.r),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  isExpanded: true,
                  padding: EdgeInsets.symmetric(vertical: 6.r),
                  dropdownColor: const Color(0xffD9D9D9),
                  initialValue: currentCuntryIndex,

                  icon: AppImage(
                    image: 'down.svg',
                    color: Theme.of(context).primaryColor,
                  ),
                  items: list
                      .map(
                        (e) => DropdownMenuItem<int>(
                          value: e,
                          child: Text(
                            '+$e',
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      currentCuntryIndex = value!;
                    });
                  },
                ),
              ),
            ),
          widget.isGenderSelection == false
              ? Expanded(
                  child: TextFormField(
                    keyboardType: widget.keyboardType,
                    textInputAction: widget.textInputAction,
                    obscureText: isHidden && widget.isPassword,
                    decoration: InputDecoration(
                      alignLabelWithHint: widget.isInputContent ? true : false,
                      contentPadding: widget.isInputContent
                          ? EdgeInsets.symmetric(
                              horizontal: 18.r,
                              vertical: 60.r,
                            )
                          : Theme.of(
                              context,
                            ).inputDecorationTheme.contentPadding,
                      labelText: widget.label,
                      hintText: widget.hintText,
                      suffixIcon: widget.isPassword
                          ? Padding(
                              padding: EdgeInsets.all(12.r),
                              child: AppImage(
                                image: 'password_view.json',
                                height: 24.h,
                                width: 24.w,

                                onLottieClicked: () {
                                  setState(() {
                                    isHidden = !isHidden;
                                  });
                                },
                              ),
                            )
                          : widget.suffixIcon != null
                          ? AppImage(
                              image: widget.suffixIcon!,
                              boxFit: BoxFit.scaleDown,
                            )
                          : null,
                    ),
                  ),
                )
              : Expanded(
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
                ),
        ],
      ),
    );
  }
}
