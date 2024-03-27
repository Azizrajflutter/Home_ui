import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_practice_1/Home/constants.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HomeDetails extends StatefulWidget {
  final String title, image, humidifier, airPurrifier;
  final bool boolHumidifier, boolAirPurrifier;
  final double floorlamp, mainLight;
  HomeDetails(
      {super.key,
      required this.title,
      required this.image,
      required this.humidifier,
      required this.airPurrifier,
      required this.boolHumidifier,
      required this.boolAirPurrifier,
      required this.floorlamp,
      required this.mainLight});

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  late double _value = widget.mainLight;
  late double _value2 = widget.floorlamp;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Stack(
            children: [
              Column(
                children: [
                  Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: height / 2,
                  ),
                  Container(
                    height: height / 2,
                    decoration: BoxDecoration(color: bgColor, boxShadow: [
                      BoxShadow(
                          color: bgColor,
                          blurRadius: 20,
                          spreadRadius: 20,
                          offset: Offset(5, 0))
                    ]),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.2, vertical: defaultPadding),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 100,
                            spreadRadius: 100,
                            offset: Offset(5, 0))
                      ]),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                widget.title,
                                style: GoogleFonts.ubuntu(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.notifications_outlined,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 2 - 120,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 170,
                            padding: EdgeInsets.all(defaultPadding * 0.6),
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(30)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.humidifier,
                                      style: GoogleFonts.ubuntu(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 23),
                                    ),
                                    SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Image.asset(
                                          'assets/icons/humidity.png'),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: defaultPadding / 2,
                                ),
                                Expanded(
                                  child: Text(
                                    'Humidity air',
                                    style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54,
                                        fontSize: 16),
                                  ),
                                ),
                                SizedBox(
                                  height: defaultPadding * 2,
                                ),
                                Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: Colors.black12,
                                ),
                                SizedBox(
                                  height: defaultPadding * 0.2,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Mode',
                                      style: GoogleFonts.ubuntu(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54,
                                          fontSize: 18),
                                    ),
                                    GFToggle(
                                      onChanged: (bool? value) {},
                                      value: widget.boolHumidifier,
                                      enabledTrackColor: secondaryColor,
                                      enabledThumbColor: primaryColor,
                                      type: GFToggleType.ios,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: defaultPadding,
                        ),
                        Expanded(
                          child: Container(
                            height: 170,
                            padding: EdgeInsets.all(defaultPadding),
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(30)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.humidifier,
                                      style: GoogleFonts.ubuntu(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 23),
                                    ),
                                    SizedBox(
                                      width: 40,
                                      height: 40,
                                      child:
                                          Image.asset('assets/icons/wind.png'),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: defaultPadding / 2,
                                ),
                                Expanded(
                                  child: Text(
                                    'Air purifier',
                                    style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54,
                                        fontSize: 16),
                                  ),
                                ),
                                SizedBox(
                                  height: defaultPadding * 2,
                                ),
                                Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: Colors.black12,
                                ),
                                SizedBox(
                                  height: defaultPadding * 0.2,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Mode',
                                      style: GoogleFonts.ubuntu(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54,
                                          fontSize: 18),
                                    ),
                                    GFToggle(
                                      onChanged: (bool? value) {},
                                      value: widget.boolAirPurrifier,
                                      enabledTrackColor: secondaryColor,
                                      enabledThumbColor: primaryColor,
                                      type: GFToggleType.ios,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    Container(
                      height: 175,
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          top: defaultPadding,
                          right: defaultPadding,
                          bottom: defaultPadding),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: defaultPadding),
                            child: Text(
                              'Main Light',
                              style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                  fontSize: 16),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SfSliderTheme(
                                  data: SfSliderThemeData(
                                      activeDividerColor: secondaryColor,
                                      activeTrackHeight: 10,
                                      inactiveTrackHeight: 10,
                                      activeDividerRadius: 5,
                                      thumbStrokeWidth: 7,
                                      thumbRadius: 15,
                                      inactiveTrackColor: bgColor,
                                      thumbColor: bgColor,
                                      thumbStrokeColor: secondaryColor),
                                  child: SfSlider(
                                    max: 100,
                                    min: 0,
                                    interval: 5,
                                    value: _value,
                                    onChanged: (value) {
                                      setState(() {
                                        _value = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: Image.asset(
                                    'assets/icons/ceiling-lamp.png'),
                              )
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: defaultPadding),
                            child: Text(
                              'Floor Light',
                              style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                  fontSize: 16),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SfSliderTheme(
                                  data: SfSliderThemeData(
                                      activeDividerColor: secondaryColor,
                                      activeTrackHeight: 10,
                                      inactiveTrackHeight: 10,
                                      activeDividerRadius: 5,
                                      thumbStrokeWidth: 7,
                                      thumbRadius: 15,
                                      inactiveTrackColor: bgColor,
                                      thumbColor: bgColor,
                                      thumbStrokeColor: secondaryColor),
                                  child: SfSlider(
                                    max: 100,
                                    min: 0,
                                    interval: 5,
                                    value: _value2,
                                    onChanged: (value) {
                                      setState(() {
                                        _value2 = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: 40,
                                child:
                                    Image.asset('assets/icons/table-lamp.png'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: bgColor,
        padding: EdgeInsets.all(10),
        child: TabBar(
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
