import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/constants/constants.dart';
import 'package:login/domain/get_weather_api.dart';
import 'package:login/screens/widgets/exit_widget.dart';
import 'package:login/screens/widgets/logout_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  String cityName = 'City';
  String cityNotfound = 'City Not Found';
  String temp = '0.00';
  String pressure = '0.00';
  String hum = '0.00';
  String clouds = '0.00';

  WeatherApiFetching weatherApiFetching = WeatherApiFetching();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) => const LogOutWidget(),
                );
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: WillPopScope(
          onWillPop: () async {
            bool shouldExist = await showDialog(
              context: context,
              builder: (context) {
                return const ExitWidget();
              },
            );
            return shouldExist;
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 2));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoSearchTextField(
                    onSubmitted: (updatedName) async {
                      // final name = searchController.text.trim();

                      // cityName = updatedName;
                      final res = await weatherApiFetching.getWeather(cityName);
                      if (res != null) {
                        setState(() {
                          if (res.main!.temp != null) {
                            final a = res.main!.temp;

                            final t = a! - 273;
                            temp = t.toStringAsFixed(0);
                            cityName = res.name ?? 'City Not Found';
                          }

                          pressure = res.main!.pressure.toString();
                          hum = res.main!.humidity.toString();
                          clouds = res.clouds!.all.toString();
                        });
                      }
                    },
                    controller: searchController,
                    placeholder: 'Search for a city',
                    style: TextStyle(color: Colors.white),
                  ),
                  kheight,
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/placeholder.png',
                        height: 40,
                      ),
                      Text(cityName,
                          style: GoogleFonts.abel(
                              textStyle: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold))),
                    ],
                  ),
                  kheight,
                  Expanded(
                    child: ListView(children: [
                      SizedBox(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/cloudy (1).png',
                              height: 100,
                            ),
                            kheight,
                            SizedBox(
                              width: 100,
                              child: Stack(
                                children: [
                                  Text(
                                    temp,
                                    style: GoogleFonts.abel(
                                        textStyle: TextStyle(
                                      fontSize: 70,
                                      fontWeight: FontWeight.bold,
                                    )),
                                  ),
                                  Positioned(
                                      left: 60,
                                      child: Text(
                                        '°C',
                                        style: TextStyle(fontSize: 40),
                                      ))
                                ],
                              ),
                            ),
                            kheight
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SideListWidget(
                              details: pressure,
                              imgUrl: 'assets/images/pressure-gauge.png',
                              backgroundcolor: Color.fromARGB(255, 240, 190, 8),
                            ),
                            kWidth,
                            SideListWidget(
                                backgroundcolor:
                                    Color.fromARGB(255, 76, 157, 175),
                                details: hum,
                                imgUrl: 'assets/images/humidity (2).png'),
                            kWidth,
                            SideListWidget(
                              details: clouds,
                              imgUrl: 'assets/images/clouds.png',
                              backgroundcolor:
                                  Color.fromARGB(255, 54, 105, 244),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class SideListWidget extends StatelessWidget {
  const SideListWidget({
    super.key,
    required this.details,
    required this.imgUrl,
    required this.backgroundcolor,
  });
  final String imgUrl;
  final String details;
  final Color backgroundcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundcolor, borderRadius: BorderRadius.circular(15)),
      width: 150,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          kheight,
          Image.asset(
            imgUrl,
            height: 80,
          ),
          kheight,
          Text(
            '$details hPa',
            style: GoogleFonts.abel(
                textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
          )
        ],
      ),
    );
  }
}
