import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_practice_1/Home/Models/statistics.dart';
import 'package:home_practice_1/Home/constants.dart';
import 'package:home_practice_1/Home/home.dart';
import 'package:home_practice_1/Screens/chart_ring.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with TickerProviderStateMixin {
  final _tabs = [
    Tab(
      text: 'Electricity',
    ),
    Tab(
      text: 'Water',
    )
  ];
  final _tabs2 = [
    Tab(
      text: '24 hours',
    ),
    Tab(
      text: '1 week',
    ),
    Tab(
      text: '1 month',
    )
  ];
  late TabController _tabController;
  late TabController _tabController2;
  late TabController _tabController3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController2 = TabController(length: 2, vsync: this);
    _tabController3 = TabController(length: 3, vsync: this);
    _tabController.index = 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  style: GoogleFonts.ubuntu(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: defaultPadding / 2,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 20,
                    ),
                    SizedBox(
                      width: defaultPadding,
                    ),
                    Text(
                      'Statistics',
                      style: GoogleFonts.ubuntu(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  height: defaultPadding / 2,
                ),
                TabBar(
                    labelColor: secondaryColor,
                    indicatorColor: secondaryColor,
                    labelStyle: TextStyle(fontSize: 18),
                    unselectedLabelColor: Colors.black,
                    controller: _tabController2,
                    dividerHeight: 0,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: _tabs),
                SizedBox(
                  height: defaultPadding / 2,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      width: 1,
                      color: secondaryColor.withOpacity(0.4),
                    ),
                  ),
                  child: TabBar(
                      labelColor: secondaryColor,
                      indicatorColor: secondaryColor,
                      labelStyle: TextStyle(fontSize: 18),
                      unselectedLabelColor: Colors.black,
                      controller: _tabController3,
                      dividerHeight: 0,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          color: secondaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(width: 1, color: secondaryColor)),
                      tabs: _tabs2),
                ),
                // SizedBox(
                //   height: defaultPadding * 2,
                // ),
                Expanded(flex: 2, child: ChartRing()),
                Expanded(
                  child: ListView.builder(
                      itemCount: demoHomeStatistics.length,
                      itemBuilder: (context, index) {
                        return rowlist(
                          homeStatistics: demoHomeStatistics[index],
                        );
                      }),
                ),
                SizedBox(
                  height: defaultPadding * 2,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: bgColor,
        padding: EdgeInsets.all(10),
        child: TabBar(
            onTap: (Value) {
              if (Value == 0) {
                Get.to(() => HomePage());
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

class ChartData {
  final String x;
  final double y;
  final Color color;
  ChartData(this.x, this.y, this.color);
}

final List<ChartData> chartdata = [
  ChartData('Bedroom', 28, Colors.black38),
  ChartData('Childreen\'s', 7, Colors.yellow),
  ChartData('Kitchen', 35, Colors.blue),
  ChartData('Bathroom', 12, Colors.red),
  ChartData('Living room', 18, Colors.purple)
];

class rowlist extends StatefulWidget {
  final HomeStatistics homeStatistics;
  const rowlist({super.key, required this.homeStatistics});

  @override
  State<rowlist> createState() => _rowlistState();
}

class _rowlistState extends State<rowlist> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: Row(
        children: [
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: widget.homeStatistics.color),
          ),
          SizedBox(
            width: defaultPadding / 2,
          ),
          Expanded(
            child: Text(
              widget.homeStatistics.homeInterior,
              style: GoogleFonts.ubuntu(color: Colors.black),
            ),
          ),
          SizedBox(
            width: defaultPadding / 2,
          ),
          Text(
            widget.homeStatistics.electricity,
            style: GoogleFonts.ubuntu(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
