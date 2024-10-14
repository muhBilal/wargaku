import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wargaku/provider/category_provider.dart';
import 'package:wargaku/view/home/scanpay/scan.dart';
import 'package:wargaku/view/utils/colornotifire.dart';
import 'package:wargaku/view/utils/media.dart';
import 'package:wargaku/view/utils/string.dart';
import 'package:wargaku/view/webViewScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wargaku/view/utils/weather_chart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with ChangeNotifier {
  late ColorNotifire notifire;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCategory();
      getdarkmodepreviousstate();
    });
  }

  void _getCategory() async {
    await Provider.of<CategoryProvider>(context, listen: false)
        .loadCategories();
  }

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    notifire.setIsDark = previusstate;
  }

  List img = [
    "images/mobile.png",
    "images/shopping.png",
    "images/water.png",
    "images/wifi1.png",
    "images/assurance.png",
    "images/ticket.png",
    "images/bill.png",
    "images/categories.png",
  ];
  List paymentname = [
    CustomStrings.nearbystores,
    CustomStrings.onlineshopping,
    CustomStrings.travelflight,
    CustomStrings.eventsmovies,
    CustomStrings.buyinsurance,
    CustomStrings.getfastag,
    CustomStrings.buyelectronic,
    CustomStrings.allservices,
  ];

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    notifire = Provider.of<ColorNotifire>(context, listen: true);

    return Scaffold(
      // backgroundColor: Color(0xffF7F7F9),
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage(
              "images/background.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 60.0, bottom: 40.0, left: 25),
                          child: Row(
                            children: [
                              Image.asset(
                                "images/man2.png",
                                scale: 4,
                              ),
                              SizedBox(
                                width: width / 20 - 10,
                              ),
                              Text(
                                CustomStrings.hello,
                                style: TextStyle(
                                    color: notifire.getdarkscolor,
                                    fontSize: 20,
                                    fontFamily: 'Gilroy Bold'),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(height: height / 6),
                            Container(
                              margin: const EdgeInsets.only(left: 25, bottom: 20),
                              child: Text(
                                "Keterlibatan Warga untuk Perubahan!",
                                style: TextStyle(
                                    color: notifire.getdarkscolor,
                                    fontSize: 27,
                                    fontFamily: 'Gilroy Bold'),
                              ),
                            ),
                            const Center(
                              child: WeatherChart(
                                temperature: 32.0,
                                condition: 'Cerah',
                                location: 'Surabaya, Indonesia',
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: height / 8,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var category in categoryProvider.categories) ...[
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                category.category,
                                style: TextStyle(
                                  fontSize: height / 35,
                                  fontFamily: "Gilroy Bold",
                                  color: notifire.getdarkscolor,
                                ),
                              ),
                            ),
                            SizedBox(height: height / 50),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: category.data.length,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: height / 4 - 10,
                                mainAxisExtent: height / 5.7,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: height / 50,
                                mainAxisSpacing: height / 40,
                              ),
                              itemBuilder: (context, index) {
                                final dataItem = category.data[index];
                                return GestureDetector(
                                  onTap: () {
                                    // launch(dataItem.appUrl);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => WebViewPage(url: dataItem.appUrl),
                                    //   ),
                                    // );
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     // builder: (context) => WebViewPage(appUrl: dataItem.appUrl),
                                    //     builder: (context) => WebViewPage(appUrl: 'https://github.com/'),
                                    //   ),
                                    // );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => WebViewScreen(appUrl: dataItem.appUrl),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: width / 7,
                                    height: width / 7,
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.5),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.2),
                                          blurRadius: 8.0,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: width / 7,
                                          width: width / 7,
                                          decoration: BoxDecoration(
                                            color: notifire.gettabwhitecolor,
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    Colors.white.withOpacity(0.1),
                                                blurRadius: 4.0,
                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          alignment: Alignment.topLeft,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              dataItem.imageUrl,
                                              height: 40.0,
                                              width: 40.0,
                                              fit: BoxFit.cover,
                                              errorBuilder: (BuildContext context,
                                                  Object error,
                                                  StackTrace? stackTrace) {
                                                return Center(
                                                    child: Icon(Icons.error));
                                              },
                                            ),
                                          ),
                                        ),
                                        Text(
                                          dataItem.name,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: "Gilroy Bold",
                                            color: notifire.getdarkscolor,
                                            fontSize: height / 50,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ],
                      ),
                    ),
                    // add box
                    SizedBox(height: height / 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
