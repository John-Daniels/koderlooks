import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PersonTab extends StatelessWidget {
  const PersonTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = [
      {
        'title': "John Koder",
        'subtitle': "JohnDkoder",
        'image': "assets/images/logo2.png",
      },
      {
        'title': "Ayo Koder",
        'subtitle': "Youngs modulos",
        'image': "assets/images/logo2.png",
      }
    ];

    return VStack([
      "Meet new People!".text.xl2.bold.gray600.make(),
      20.heightBox,
      for (var rest in data)
        PersonCard(
          title: rest['title']!,
          subtitle: rest['subtitle']!,
          image: rest['image']!,
        )
    ]);
  }
}

class PersonCard extends StatelessWidget {
  final String title, subtitle, image;
  const PersonCard(
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
