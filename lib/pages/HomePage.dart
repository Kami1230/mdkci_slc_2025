import 'package:flutter/material.dart';
import '/pages/EventSchedule.dart';
import '/pages/MapPage.dart';
import '/pages/Notifications.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
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
      body: Column(
        children: [
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
                    "MDKCI SLC",
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
                  Container(
                    child: IconButton(
                      icon: const Icon(
                        Icons.picture_as_pdf,
                        size: 20,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _launchURL('https://www.canva.com/design/DAGb5vFvMVA/O3jddifg06Wt8kZnvgp1Rg/view?utm_content=DAGb5vFvMVA&utm_campaign=designshare&utm_medium=link&utm_source=viewer'); // Replace with your actual URL
                      },
                    ),
                  ),
                ],
              )
            ]),
          ),
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            "WELCOME MICHIGAN \nDISTRICT TO SLC 2025!",
                            textAlign: TextAlign.center,
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
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Image.asset(
                            'assets/Images/Dboard.png',
                            alignment: Alignment.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            "Welcome to the 74th Annual Michigan District of Key Club Service Leadership Conference (SLC 2025)! We are thrilled to invite you to join us from February 21-23, 2025, at the Crowne Plaza Lansing West for an unforgettable experience of service, leadership, and growth. \n \n This year's theme, \"Service Under The Sea,\" promises to make a splash as we celebrate another year of outstanding achievements and the 100th birthday of Key Club International! ",
                            textAlign: TextAlign.center,
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
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  )) {
    throw "Could not launch $url";
  }
}