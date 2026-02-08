part of '../view.dart';

class _Offers extends StatefulWidget {
  const _Offers();

  @override
  State<_Offers> createState() => _OffersState();
}

class _OffersState extends State<_Offers> {
  late List<SliderModel> list;
  DataState? state;
  Future<void> getData() async {
    state = DataState.loading;
    setState(() {});
    final response = await DioHelper.getData('api/Sliders');
    if (response.isSuccess) {
      list = (response.data as List<dynamic>)
          .map((e) => SliderModel.fromJson(e))
          .toList();
      state = DataState.success;
    } else {
      state = DataState.failure;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return state == DataState.failure
        ? IconButton(
            onPressed: () {
              getData();
            },
            icon: Icon(Icons.replay),
          )
        : state == DataState.loading
        ? CupertinoActivityIndicator()
        : CarouselSlider(
            options: CarouselOptions(
              height: 320.h,
              aspectRatio: 364.w / 320.h,
              viewportFraction: 1,
              autoPlay: true,
            ),
            items: List.generate(
              list.length,
              (index) => ClipRRect(
                child: Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    // AppImage(image: 'offer_background.png'),
                    AppImage(image: list[index].imageUrl),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffE9DCD3).withValues(alpha: 0.8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 18.r),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text.rich(
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(
                                        color: Color(0xff62322D),
                                        fontVariations: [
                                          FontVariation('wght', 700),
                                        ],
                                      ),

                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            '${list[index].discountPercent}% OFF DISCOUNT\n',
                                      ),
                                      TextSpan(
                                        text:
                                            'COUPON CODE : ${list[index].couponCode}',
                                      ),
                                    ],
                                  ),
                                ),
                                AppImage(image: 'offer.svg'),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                AppImage(image: 'offer.svg'),
                                Text.rich(
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(
                                        color: Color(0xff434C6D),
                                        fontVariations: [
                                          FontVariation('wght', 700),
                                        ],
                                      ),

                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            '${list[index].descriptionTitle1}\n',
                                      ),
                                      TextSpan(
                                        text: list[index].descriptionTitle2,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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

class SliderModel {
  late final int id;
  late final String couponCode;
  late final int discountPercent;
  late final String descriptionTitle1;
  late final String descriptionTitle2;
  late final String imageUrl;

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    couponCode = json["couponCode"] ?? '';
    discountPercent = json["discountPercent"] ?? 0;
    descriptionTitle1 = json["descriptionTitle1"] ?? '';
    descriptionTitle2 = json["descriptionTitle2"] ?? '';
    imageUrl = json["imageUrl"] ?? '';
  }
}
