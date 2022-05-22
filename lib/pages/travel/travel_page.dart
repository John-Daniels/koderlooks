import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({Key? key}) : super(key: key);

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {
  late TabController _tabController;

  double anim = 1.0;
  double anim2 = 1.0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 4);

    withAnimation(
        duration: const Duration(seconds: 1),
        vsync: this,
        tween: Tween(begin: 1.0, end: 0.0),
        callBack: (double? animVal, contVal) {
          anim = animVal!;
          setState(() {});
        });

    withRepeatAnimation(
      vsync: this,
      tween: Tween(begin: 2.0, end: 3.0),
      isRepeatReversed: true,
      callBack: (double? animVal, contVal) {
        anim2 = animVal!;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabIndex = _tabController.index;

    return Scaffold(
      backgroundColor: Vx.purple500,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: VStack([
          VxBox().size(20, 2).white.make(),
          5.heightBox,
          VxBox().size(28, 2).white.make(),
          5.heightBox,
          VxBox().size(15, 2).white.make(),
          5.heightBox,
        ]).pOnly(left: 16, top: 16),
      ),
      body: VStack([
        VxBox(
          child: VStack([
            VxBox()
                .square(100)
                .roundedFull
                .neumorphic(color: Vx.purple500, elevation: 30)
                .bgImage(const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/logo1.png')))
                .makeCentered(),
            "Hi. "
                .richText
                .withTextSpanChildren(['Koder'.textSpan.bold.make()])
                .white
                .xl2
                .makeCentered()
                .p8()
                .offset(offset: Offset(-300 * anim, 0.0)),
            "Solo Traveller".text.white.makeCentered(),
            VxTextField(
              borderType: VxTextFieldBorderType.none,
              borderRadius: 18,
              hint: "Search",
              fillColor: Vx.gray200.withOpacity(0.3),
              contentPaddingTop: 13,
              autofocus: false,
              prefixIcon:
                  const Icon(Icons.search_outlined, color: Colors.white),
            )
                .customTheme(themeData: ThemeData(brightness: Brightness.dark))
                .cornerRadius(10)
                .p16()
          ]),
        ).makeCentered().h40(context),
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: VxBox(
            child: VStack(
              [
                TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.purple,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Vx.purple500,
                  unselectedLabelColor: Vx.gray400,
                  labelPadding: Vx.m16,
                  tabs: [
                    const Icon(
                      Icons.map,
                      size: 10,
                    ).scale(scaleValue: tabIndex == 0 ? anim2 : 3.0),
                    const Icon(
                      Icons.pin_drop,
                      size: 10,
                    ).scale(scaleValue: tabIndex == 1 ? anim2 : 3.0),
                    const Icon(
                      Icons.restaurant,
                      size: 10,
                    ).scale(scaleValue: tabIndex == 2 ? anim2 : 3.0),
                    const Icon(
                      Icons.person,
                      size: 10,
                    ).scale(scaleValue: tabIndex == 3 ? anim2 : 3.0),
                  ],
                ),
                TabBarView(
                  controller: _tabController,
                  children: ['1', '2', '3', '4']
                      .map((e) => SingleChildScrollView(
                            child: VStack(
                              [
                                "Discover Places in London"
                                    .text
                                    .gray600
                                    .xl2
                                    .bold
                                    .make(),
                                20.heightBox,
                                const TravelCard(
                                  title: 'Tower Bridge',
                                  subtitle: 'Southwork',
                                  imageUrl: 'assets/images/logo1.png',
                                ),
                                20.heightBox,
                                const TravelCard(
                                  title: 'London Eye',
                                  subtitle: 'Country Hall',
                                  imageUrl: 'assets/images/logo2.png',
                                ),
                                20.heightBox,
                                const TravelCard(
                                  title: 'London Eye',
                                  subtitle: 'Country Hall',
                                  imageUrl: 'assets/images/logo2.png',
                                )
                              ],
                            ).p16(),
                          ))
                      .toList(),
                ).expand(),
              ],
            ),
          ).white.make(),
        ).expand()
      ]),
    );
  }
}

class TravelCard extends StatelessWidget {
  final String title, subtitle, imageUrl;

  const TravelCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HStack([
      Image.asset(
        imageUrl,
        fit: BoxFit.cover,
      ).wh(context.percentWidth * 35, 100).cornerRadius(10),
      20.widthBox,
      VStack(
        [
          title.text.xl.bold.make(),
          3.heightBox,
          subtitle.text.make().shimmer(),
          5.heightBox,
          HStack([
            VxRating(
              size: 13,
              onRatingUpdate: (value) {},
            ),
            5.widthBox,
            "(100)".text.xs.gray600.make()
          ])
        ],
        crossAlignment: CrossAxisAlignment.start,
      ).expand(),
    ]).backgroundColor(Vx.gray200).cornerRadius(8);
  }
}
