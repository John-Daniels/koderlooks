import 'package:flutter/material.dart';
import 'package:koderlooks/utils/theme.dart';
import 'package:velocity_x/velocity_x.dart';

// appbar widget
AppBar MyAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: MyBar().pOnly(left: 16, top: 16),
  );
}

// bar widget
VStack MyBar() {
  return VStack([
    VxBox().size(20, 2).white.make(),
    5.heightBox,
    VxBox().size(28, 2).white.make(),
    5.heightBox,
    VxBox().size(15, 2).white.make(),
  ]);
}

// circle Image
class MyCircleImage extends StatelessWidget {
  final String image;
  const MyCircleImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox()
        .square(100)
        .roundedFull
        .neumorphic(color: mainColor, elevation: 30)
        .bgImage(
          DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        )
        .make();
  }
}
