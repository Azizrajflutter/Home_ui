import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_practice_1/Home/Models/devices.dart';
import 'package:home_practice_1/Home/constants.dart';
import 'package:home_practice_1/Home/Models/home_interior.dart';
import 'package:home_practice_1/Screens/home_details.dart';
import 'package:home_practice_1/Screens/settings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  final pageController = PageController(initialPage: 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding * 1.5, vertical: defaultPadding * 1),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Hello, Aziz!',
                    style: GoogleFonts.ubuntu(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ),
                Icon(
                  Icons.settings_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                SizedBox(
                  width: defaultPadding,
                ),
                Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 30,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding * 1.5),
            child: SizedBox(
              height: 150,
              width: double.infinity,
              child: ListView.builder(
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: demoHomeInterior.length,
                  itemBuilder: (context, index) {
                    return homeCard(
                      homeInterior: demoHomeInterior[index],
                    );
                  }),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Center(
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: WormEffect(
                  dotColor: Colors.grey.withOpacity(0.3),
                  activeDotColor: secondaryColor,
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding * 1.5, vertical: defaultPadding / 2),
            child: Text(
              'My devices',
              style:
                  GoogleFonts.ubuntu(fontSize: 22, fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding * 0.2),
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: demoHomeDevices.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 20,
                    mainAxisExtent: MediaQuery.of(context).size.width / 2 - 36),
                itemBuilder: (context, index) {
                  return devicesCard(homeDevices: demoHomeDevices[index]);
                },
              ),
            ),
          ),
        ],
      )),
      bottomNavigationBar: Container(
        height: 70,
        color: bgColor,
        padding: EdgeInsets.all(10),
        child: TabBar(
            onTap: (Value) {
              if (Value == 2) {
                Get.to(() => SettingsPage());
              }
            },
            labelColor: secondaryColor,
            unselectedLabelColor: Colors.grey.shade400,
            controller: _tabController,
            indicator: UnderlineTabIndicator(borderSide: BorderSide.none),
            tabs: [
              ImageIcon(
                AssetImage('assets/icons/home.png'),
                size: 35,
              ),
              ImageIcon(
                AssetImage('assets/icons/search.png'),
                size: 35,
              ),
              ImageIcon(
                AssetImage('assets/icons/dashboard.png'),
                size: 35,
              ),
              ImageIcon(
                AssetImage('assets/icons/account.png'),
                size: 35,
              ),
            ]),
      ),
    );
  }
}

class homeCard extends StatefulWidget {
  final HomeInterior homeInterior;
  const homeCard({super.key, required this.homeInterior});

  @override
  State<homeCard> createState() => _homeCardState();
}

class _homeCardState extends State<homeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: defaultPadding),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return HomeDetails(
                      title: widget.homeInterior.title,
                      image: widget.homeInterior.image,
                      humidifier: widget.homeInterior.humidifier,
                      airPurrifier: widget.homeInterior.airPurrifier,
                      boolHumidifier: widget.homeInterior.boolHumidifier,
                      boolAirPurrifier: widget.homeInterior.boolAirPurrifier,
                      floorlamp: widget.homeInterior.floorlamp,
                      mainLight: widget.homeInterior.mainLight);
                },
              ));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.asset(
                widget.homeInterior.image,
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: defaultPadding),
            child: Text(
              widget.homeInterior.title,
              style: GoogleFonts.ubuntu(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class devicesCard extends StatefulWidget {
  final HomeDevices homeDevices;
  const devicesCard({super.key, required this.homeDevices});

  @override
  State<devicesCard> createState() => _devicesCardState();
}

class _devicesCardState extends State<devicesCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13),
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 85,
            width: 85,
            child: Image.asset(
              widget.homeDevices.image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: defaultPadding * 0.2,
          ),
          FittedBox(
            child: Text(
              widget.homeDevices.title,
              style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
          SizedBox(
            height: defaultPadding * 0.2,
          ),
          FittedBox(
            child: Text(
              widget.homeDevices.subTitel,
              style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.w400,
                  color: Colors.black38,
                  fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
