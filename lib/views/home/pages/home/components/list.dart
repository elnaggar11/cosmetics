part of '../view.dart';

class _List extends StatelessWidget {
  const _List();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top rated products',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Color(0xff434C6D),
            fontVariations: [FontVariation('wght', 700)],
          ),
        ),
        SizedBox(height: 14.h),
        GridView.builder(
          itemCount: 4,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.w,
            crossAxisSpacing: 12.h,
            childAspectRatio: 180.w / 240.h,
          ),
          itemBuilder: (context, index) {
            return _Item();
          },
        ),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  const _Item();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffD2D2D2),
      elevation: 6,
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AppImage(image: 'first_product.png'),
                Positioned(
                  right: 6.h,
                  top: 6.h,
                  child: InkWell(
                    child: Container(
                      height: 32.w,
                      width: 32.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: AppImage(image: 'add_to_cart.svg'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 11.h),
            Text(
              'Face tint / lip tint',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Color(0xff434C6D),
                fontVariations: [FontVariation('wght', 600)],
              ),
            ),

            SizedBox(height: 11.h),

            Text(
              '\$44.99',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Color(0xff70839C),
                fontVariations: [FontVariation('wght', 700)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
