import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class RestaurantTab extends StatelessWidget {
  const RestaurantTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = [
      {
        'title': "Ayo's Pastries",
        'subtitle': "Ayo Koder",
        'image': "assets/images/logo2.png",
      },
      {
        'title': "Vicktor's Pot",
        'subtitle': "Vickey okro",
        'image': "assets/images/logo2.png",
      }
    ];

    return VStack([
      "Checkout Restaurants".text.xl2.bold.gray600.make(),
      20.heightBox,
      for (var rest in data)
        RestaurantCard(
          title: rest['title']!,
          subtitle: rest['subtitle']!,
          image: rest['image']!,
        )
    ]);
  }
}

class RestaurantCard extends StatelessWidget {
  final String title, subtitle, image;
  const RestaurantCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HStack([
      Image.asset(image, fit: BoxFit.cover)
          .wh(context.safePercentWidth * 35, 100)
          .cornerRadius(10),
      20.widthBox,
      VStack([
        title.text.bold.xl2.make(),
        3.heightBox,
        subtitle.text.make().shimmer(),
        5.heightBox,
        HStack([
          VxRating(size: 13, onRatingUpdate: (value) {}),
          "(99)".text.gray600.make()
        ])
      ]).expand()
    ]).backgroundColor(Vx.gray200).cornerRadius(10).pOnly(bottom: 16);
  }
}
