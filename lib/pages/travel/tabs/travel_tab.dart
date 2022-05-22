import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TravelTab extends StatelessWidget {
  const TravelTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        'Discover Places in London'.text.gray600.xl2.bold.make(),
        20.heightBox,
        const TravelCard(
          title: "Tower Bridge",
          subtitle: "Southwork",
          image: "assets/images/logo1.png",
        ),
      ],
    );
  }
}

class TravelCard extends StatelessWidget {
  final String image, title, subtitle;
  const TravelCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
        ).wh(context.safePercentWidth * 35, 100).cornerRadius(10),
        20.widthBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title.text.bold.xl.make(),
            3.heightBox,
            subtitle.text.make().shimmer(),
            5.heightBox,
            Row(
              children: [
                VxRating(size: 13, onRatingUpdate: (value) {}),
                5.widthBox,
                "(100)".text.xs.gray600.make()
              ],
            ),
          ],
        ).expand()
      ],
    ).backgroundColor(Vx.gray200).cornerRadius(8);
  }
}
