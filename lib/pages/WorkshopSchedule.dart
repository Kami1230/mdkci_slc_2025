import 'package:flutter/material.dart';
import '/pages/HomePage.dart';
import '/pages/EventSchedule.dart';
import '/pages/MapPage.dart';
import '/pages/Notifications.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkshopSchedule extends StatefulWidget {
  final String folderName;
  const WorkshopSchedule({required this.folderName, super.key});
  static const banner = Color(0xff404040);
  @override
  State<WorkshopSchedule> createState() => _WorkshopScheduleState();
}

class _WorkshopScheduleState extends State<WorkshopSchedule> {
  double availableScreenWidth = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    availableScreenWidth = MediaQuery.of(context).size.width - 50;
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
                      "Workshop Schedule",
                      textAlign: TextAlign.center, // Center-align the text content
                      style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Aboreto'
                      ),
                    ),
                  ),
                  Container(
                      width: availableScreenWidth,
                      height: 30,
                      decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(12), color: Color(0xff002e5d)),
                      child: Text(
                          'SESSION 1: 9:00am -9:45am',
                          textAlign: TextAlign.center, // Center-align the text content
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Quattrocento'
                          )
                      )
                  ),
                  Container(
                      width: availableScreenWidth,
                      height: 200,
                      decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        'Ballroom A: Shark Fin Headbands \n Ballroom B: Icebreaker \n Ballroom C: Dog Toys \n Ballroom D: International \n Ballroom E: Plarning \n Ballroom F: Sea Of Affirmations \n REO: Bookmarks \n Cord: Under the C(ollege) ',
                          textAlign: TextAlign.center, // Center-align the text content
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Quattrocento'
                          )
                      )
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: availableScreenWidth,
                      height: 30,
                      decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(12), color: Color(0xff002e5d)),
                      child: Text(
                          'SESSION 2: 9:55am -10:40am',
                          textAlign: TextAlign.center, // Center-align the text content
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Quattrocento'
                          )
                      )
                  ),
                  Container(
                      width: availableScreenWidth,
                      height: 200,
                      decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
                      child: Text(
                          'Ballroom A: Shark Fin Headbands \n Ballroom B: Swimming with Sharks \n Ballroom C: Bracelet Making \n Ballroom D: Konnecting the K\'s \n Ballroom E: Plarning \n Ballroom F: Thirst Project \n REO: Bookmarks \n Cord: Incorporating DEI',
                          textAlign: TextAlign.center, // Center-align the text content
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Quattrocento'
                          )
                      )
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: availableScreenWidth,
                      height: 30,
                      decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(12), color: Color(0xff002e5d)),
                      child: Text(
                          'SESSION 3: 10:50am - 11:35am',
                          textAlign: TextAlign.center, // Center-align the text content
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Quattrocento'
                          )
                      )
                  ),
                  Container(
                      width: availableScreenWidth,
                      height: 230,
                      decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
                      child: Text(
                          'Ballroom A: D-Board Q & A \n Ballroom B: How to Get a Date \n Ballroom C: Bracelet Making \n Ballroom D: International \n Ballroom E: The Birdhouse Project \n Ballroom F: Sea Of Affirmations \n REO: How to Make a Splash! (Standing out as a member)\n Cord: Under the C(ollege)',
                          textAlign: TextAlign.center, // Center-align the text content
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Quattrocento'
                          )
                      )
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: availableScreenWidth,
                      height: 30,
                      decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(12), color: Color(0xff002e5d)),
                      child: Text(
                          'SESSION 4: 11:45am -12:30am',
                          textAlign: TextAlign.center, // Center-align the text content
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Quattrocento'
                          )
                      )
                  ),
                  Container(
                      width: availableScreenWidth,
                      height: 230,
                      decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
                      child: Text(
                          'Ballroom A: D-Board Q & A \n Ballroom B: How to stay afloat (mental health) \n Ballroom C: YOF Workshop \n Ballroom D: Konnecting the K\'s \n Ballroom E: The Birdhouse Project \n Ballroom F: Thirst Project \n REO: How to Make a Splash! (Standing out as a member) \n Cord: How to Get a Date ',
                          textAlign: TextAlign.center, // Center-align the text content
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Quattrocento'
                          )
                      )
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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