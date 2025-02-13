import 'package:flutter/material.dart';
import '/pages/EventSchedule.dart';
import '/pages/MapPage.dart';
import '/pages/Notifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const banner = Color(0xff404040);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double availableScreenWidth = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    availableScreenWidth = MediaQuery.of(context).size.width - 50;
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(children: [
          // Header Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 17),
            alignment: Alignment.bottomCenter,
            height: 100,
            decoration: BoxDecoration(color: HomePage.banner),
            child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "MDKCI SLC 2025",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Aboreto'
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    child: IconButton(
                      icon: const Icon(
                        Icons.home,
                        size: 20,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                        },
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: const Icon(
                        Icons.notifications,
                        size: 20,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Notifications(folderName: 'pages',)),
                        );
                      },
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: const Icon(
                        Icons.calendar_month,
                        size: 20,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const EventSchedule(folderName: 'pages',)),
                        );
                      },
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: const Icon(
                        Icons.map,
                        size: 20,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MapPage(folderName: 'pages',)),
                        );
                      },
                    ),
                  ),
                ],
              )
            ]),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
              children: [
                Flexible( // Allows the Text to wrap and take available space
                  child: Text(
                    "WELCOME MICHIGAN \nDISTRICT TO SLC 2025!",
                    textAlign: TextAlign.center, // Center-align the text content
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                        fontFamily: 'Aboreto'
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible( // Allows the Text to wrap and take available space
                child: Image.asset(
                  'assets/Images/Dboard.png',
                  alignment: Alignment.center,
                  ),
                ),
            ],
          ),
        ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
              children: [
                Flexible( // Allows the Text to wrap and take available space
                  child: Text(
                    "Welcome to the 74th Annual Michigan District of Key Club Service Leadership Conference (SLC 2025)! We are thrilled to invite you to join us from February 21-23, 2025, at the Crowne Plaza Lansing West for an unforgettable experience of service, leadership, and growth. \n \n This year's theme, \"Service Under The Sea,\" promises to make a splash as we celebrate another year of outstanding achievements and the 100th birthday of Key Club International! ",
                    textAlign: TextAlign.center, // Center-align the text content
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                        fontFamily: 'Quattrocento'
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ])
    );
  }
}