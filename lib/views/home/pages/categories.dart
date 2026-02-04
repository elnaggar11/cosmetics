import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:cosmetics/core/ui/app_country_code.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  late List<CategoryModel> list;

  DataState? state;
  Future<void> getData() async {
    state = DataState.loading;
    setState(() {});
    final response = await DioHelper.getData('api/Categories');
    if (response.isSuccess) {
      list = (response.data as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e))
          .toList();

      print(list.first.title);
      state = DataState.success;
    } else {
      state = DataState.failure;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD6D6D6),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.r),
          child: state == DataState.failure
              ? IconButton(
                  onPressed: () {
                    getData();
                  },
                  icon: Icon(Icons.replay),
                )
              : state == DataState.loading
              ? CupertinoActivityIndicator()
              : Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.r),
                      child: Text(
                        'Categories',
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(
                              color: Color(0xff434C6D),
                              fontVariations: [FontVariation('wght', 700)],
                            ),
                      ),
                    ),
                    Search(),
                    SizedBox(height: 10.h),
                    Expanded(
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.r),
                                  child: Row(
                                    children: [
                                      AppImage(
                                        image: list[index].imageUrl,
                                        height: 64.h,
                                        width: 64.w,
                                      ),
                                      SizedBox(width: 25.w),
                                      Text(
                                        list[index].title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              color: Color(0xff434C6D),
                                              fontVariations: [
                                                FontVariation('wght', 600),
                                              ],
                                            ),
                                      ),

                                      const Spacer(),
                                      AppImage(image: 'arrow_right.svg'),
                                    ],
                                  ),
                                ),

                                if (index < list.length - 1) Divider(),
                              ],
                            ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class CategoryModel {
  late final int id;
  late final String title;
  late final String imageUrl;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    title = json["title"] ?? '';
    imageUrl = json["imageUrl"] ?? '';
  }
}
