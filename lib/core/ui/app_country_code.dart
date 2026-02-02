import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum DataState { loading, failure, success }

class AppCountryCode extends StatefulWidget {
  const AppCountryCode({super.key, this.onCountryCodeChanged});
  final ValueChanged<String>? onCountryCodeChanged;
  @override
  State<AppCountryCode> createState() => _AppCountryCodeState();
}

class _AppCountryCodeState extends State<AppCountryCode> {
  late String selectedCountryCode;

  @override
  void initState() {
    super.initState();
    getData();
  }

  late List<CountryModel> list;

  DataState state = DataState.loading;

  Future<void> getData() async {
    state = DataState.loading;
    setState(() {});
    final response = await DioHelper.getData('api/Countries');
    if (response.isSuccess) {
      list = (response.data as List<dynamic>)
          .map((e) => CountryModel.fromJson(e))
          .toList();
      selectedCountryCode = list.first.code;
      widget.onCountryCodeChanged?.call(selectedCountryCode);
      state = DataState.success;
    } else {
      state = DataState.failure;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 6.r),
        child: state == DataState.failure
            ? IconButton(
                onPressed: () {
                  getData();
                },
                icon: Icon(Icons.replay),
              )
            : state == DataState.loading
            ? CupertinoActivityIndicator()
            : DropdownButtonFormField<String>(
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

                initialValue: selectedCountryCode,
                icon: AppImage(
                  image: 'down.svg',
                  color: Theme.of(context).primaryColor,
                ),
                items: list
                    .map(
                      (e) => DropdownMenuItem<String>(
                        value: e.code,
                        child: Text(
                          e.code,
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 10.sp,
                              ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCountryCode = value!;
                    widget.onCountryCodeChanged?.call(selectedCountryCode);
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

class CountryModel {
  late final int id;
  late final String code, name;

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    code = json['code'] ?? '';
    name = json['name'] ?? '';
  }
}
