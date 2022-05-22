import 'package:flutter/material.dart';
import 'package:koderlooks/pages/travel/tabs/food_tab.dart';
import 'package:koderlooks/pages/travel/tabs/person_tab.dart';
import 'package:koderlooks/pages/travel/tabs/reastaurant_tab.dart';
import 'package:koderlooks/pages/travel/tabs/travel_tab.dart';
// import 'package:koderlooks/pages/travel/travel_page.dart';
import 'package:koderlooks/utils/theme.dart';
import 'package:koderlooks/widgets/travel/travel_widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({Key? key}) : super(key: key);

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {
  late TabController _tabController;

  double anim = 1.0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 4);
    withAnimation(
        duration: const Duration(seconds: 2),
        vsync: this,
        tween: Tween(begin: 1.0, end: 0.0),
        callBack: (double? animVal, contVal) {
          anim = animVal!;
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    var tabIndex = _tabController.index;
    return Scaffold(
      backgroundColor: mainColor,
      appBar: MyAppBar(),
      body: VStack(
        [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //logo image
            const MyCircleImage(
              image: 'assets/images/logo1.png',
            ),
            "Hi. "
                .richText
                .withTextSpanChildren(["Koder".textSpan.bold.make()])
                .white
                .xl2
                .make()
                .p8()
                .offset(offset: Offset(-300 * anim, 0)),

            "Solo traveller".text.white.make(),
            10.heightBox,
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
          ]).h40(context),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: VxBox(
              child: VStack([
                TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.purple,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: mainColor,
                  unselectedLabelColor: Vx.gray400,
                  labelPadding: Vx.m16,
                  tabs: const [
                    Icon(Icons.map, size: 30),
                    Icon(Icons.pin_drop, size: 30),
                    Icon(Icons.restaurant, size: 30),
                    Icon(Icons.person, size: 30)
                    // .scale(scaleValue: tabIndex == 3 ? anim2 : 30),
                  ],
                ),
                TabBarView(controller: _tabController, children: [
                  const TravelTab().p16(),
                  const RestaurantTab().p16(),
                  const FoodTab().p16(),
                  const PersonTab().p16()
                ]).expand()
              ]),
            ).white.make(),
          ).expand()
        ],
      ),
    );
  }
}
