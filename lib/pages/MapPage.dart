import 'package:flutter/material.dart';
import '/pages/HomePage.dart';
import '/pages/EventSchedule.dart';
import '/pages/Notifications.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatefulWidget {
  final String folderName;
  const MapPage({required this.folderName, super.key});
  static const banner = Color(0xff404040);
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  double availableScreenWidth = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    availableScreenWidth = MediaQuery
        .of(context)
        .size
        .width - 50;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(children: [
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
        Expanded(
            child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  SizedBox(
                    width: availableScreenWidth,
                    height: 45,
                    child: Text(
                      "Hotel Map",
                      textAlign: TextAlign.center, // Center-align the text content
                      style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Aboreto'
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: availableScreenWidth,
                      height: 100,
                      child: Text(
                          'Pinch the map to zoom in and out and pan around to find your current & goal locations or switch to landscape view to best view the map below.',
                          textAlign: TextAlign.center, // Center-align the text content
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Quattrocento'
                          )
                      )
                  ),
                  Container(
                      child: InteractiveViewer(
                        minScale: 0.5,  // Minimum scale factor
                        maxScale: 10.0,  // Maximum scale factor
                        child: Image.asset(
                          'assets/Images/Hotel_Map.png',
                          height: 600,
                          alignment: Alignment.topCenter,
                          fit: BoxFit.contain,
                        ),
                      ),
                  )
                ]
            )
        )
      ]),
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