part of '../view.dart';

class _Offers extends StatelessWidget {
  const _Offers();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 364.w,
      height: 320.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/offer_background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Align(
        alignment: AlignmentGeometry.center,
        child: Container(
          width: 364.w,
          height: 150.w,
          decoration: BoxDecoration(color: Color(0xccE9DCD3)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18.r),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text.rich(
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Color(0xff62322D),
                        fontVariations: [FontVariation('wght', 700)],
                      ),

                      TextSpan(
                        children: [
                          TextSpan(text: '50% OFF DISCOUNT\n'),
                          TextSpan(text: 'COUPON CODE : 125865'),
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
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Color(0xff434C6D),
                        fontVariations: [FontVariation('wght', 700)],
                      ),

                      TextSpan(
                        children: [
                          TextSpan(text: 'Hurry up!\n'),
                          TextSpan(text: 'Skin care only !'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
