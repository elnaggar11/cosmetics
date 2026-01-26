import 'package:cosmetics/core/ui/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCountryCode extends StatefulWidget {
  const AppCountryCode({super.key, this.onCountryCodeChanged});
  final ValueChanged<String>? onCountryCodeChanged;
  @override
  State<AppCountryCode> createState() => _AppCountryCodeState();
}

class _AppCountryCodeState extends State<AppCountryCode> {
  final list = ['10', '20', '30', '40'];
  late String currentCountryIndex;

  @override
  void initState() {
    super.initState();
    currentCountryIndex = list.first;
    widget.onCountryCodeChanged?.call(currentCountryIndex);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 6.r),
        child: DropdownButtonFormField<String>(
          borderRadius: BorderRadius.circular(8.r),
          decoration: InputDecoration(
            border: outLineInputBorder(color: Colors.white),
            enabledBorder: outLineInputBorder(
              color: Color(0xff669066).withAlpha(120),
            ),
            focusedBorder: outLineInputBorder(color: Color(0xffD75D72)),
            errorBorder: outLineInputBorder(color: Colors.red),
            focusedErrorBorder: outLineInputBorder(color: Colors.red),
          ),
          isExpanded: true,
          padding: EdgeInsets.symmetric(vertical: 6.r),
          dropdownColor: const Color(0xffD9D9D9),
          initialValue: currentCountryIndex,

          icon: AppImage(
            image: 'down.svg',
            color: Theme.of(context).primaryColor,
          ),
          items: list
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(
                    '+$e',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              currentCountryIndex = value!;
              widget.onCountryCodeChanged?.call(currentCountryIndex);
            });
          },
        ),
      ),
    );
  }
}

OutlineInputBorder outLineInputBorder({
  required Color color,
  double borderRadius = 8,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius),
    borderSide: BorderSide(color: color),
  );
}
