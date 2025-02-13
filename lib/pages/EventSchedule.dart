import 'package:flutter/material.dart';
import '/pages/HomePage.dart';
import '/pages/WorkshopSchedule.dart';
import '/pages/MapPage.dart';
import '/pages/Notifications.dart';

class EventSchedule extends StatefulWidget {
  final String folderName;
  const EventSchedule({required this.folderName, super.key});
  static const banner = Color(0xff404040);
  @override
  State<EventSchedule> createState() => _EventScheduleState();
}

class _EventScheduleState extends State<EventSchedule> {
  double availableScreenWidth = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    availableScreenWidth = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
          alignment: Alignment.bottomCenter,
          height: 100,
          decoration: BoxDecoration(color: EventSchedule.banner),
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
                      color: Colors.white),
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
        Expanded(
        child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Container(
                  width: availableScreenWidth,
                  height: 45,
                  child: Text(
                    "Event Schedule",
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
                      'Friday February 21',
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
                  height: 325,
                  decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
                  child: Text(
                      '3:00 – 5:00 PM Check-in/Registration (hotel does not guarantee room availability until 4PM) \n 3:00 – 5:00 PM Contest Registration/Informal Social Time \n 5:00 – 5:30 PM Divisional Orientation \n 5:30 – 6:00 PM Candidates Meeting (for all candidates who have filed or are considering running for a district board position) \n 6:00 – 6:30 PM Advisors/Chaperone Meeting  \n 7:00 – 10:00 PM Dinner and Opening Session \n 10:00 -11:30 PM Dance \n 12:00-1:00 AM Circle K Senior Night \n 12:00 – 6:00 AM Curfew',
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
                      'Saturday February 22',
                      textAlign: TextAlign.center, // Center-align the text content
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                          fontFamily: 'Quattrocento'
                      ),
                  )
              ),
              Row(
                children: [
                  Container(
                      width: availableScreenWidth - 50,
                      child: Text(
                        'View Workshop Schedule:',
                        textAlign: TextAlign.center, // Center-align the text content
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(0xff002e5d),
                            fontFamily: 'Quattrocento'
                        ),
                      )
                  ),
                  Container(
                    child: IconButton(
                      icon: const Icon(
                        Icons.schedule,
                        size: 30,
                        color: Color(0xffb4975e),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const WorkshopSchedule(folderName: 'pages',)),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                  width: availableScreenWidth,
                  height: 325,
                  decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
                  child: Text(
                      '9:00 – 9:30 AM Service Project & Workshops I \n 09:40 – 10:10 AM Service Project & Workshops II \n 10:20 – 10:50 AM Service Project & Workshops III \n 11:00 – 11:30 AM Service Project & Workshops IIII \n 12:00 – 1:00 PM Lunch \n 1:00 – 3:00 PM Free Time & Candidate Meet and Greet \n 1:00 – 3:00 PM Contest Judging (Oratorical, Talent, & other contests) \n 4:00 – 6:00 PM Caucusing \n 6:30 – 10:00 PM Awards Banquet \n 10:00 – 11:30 PM Governor’s Ball (dance) \n 12:00 – 6:00 AM Curfew',
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
                      'Sunday February 22',
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
                  height: 100,
                  decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    '8:30 – 10:00 AM House of Delegates \n 10:30 – 1:00 PM Governor’s Farewell Brunch \n 12:00 Noon Check out \n 1:30 – 2:30PM 2024-2025 & 2025-2026 Joint Board Meeting',
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
        /*const Divider(),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(25),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Files",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Create new",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              buildFileRow('Assets', true),
              buildFileRow('Brandbook', false),
              buildFileRow('Design', false),
              buildFileRow('Moodboards', false),
              buildFileRow('Wirefremes', false),
              buildFileRow('Other', false),
              buildFileRow('Assets', false),
            ],
          ),
        )
      floatingActionButton: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
          BoxShadow(color: Colors.white, spreadRadius: 7, blurRadius: 1)
        ]),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: 'Time',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              label: 'Folder',
            ),
          ]),

  Container buildFileRow(String folderName, bool showAlert) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(15)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Stack(
              children: [
                Icon(
                  Icons.folder,
                  color: Colors.blue[200],
                ),
                if (showAlert)
                  Positioned(
                    right: -1,
                    top: 2,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: const CircleAvatar(
                        radius: 3.5,
                        backgroundColor: Colors.red,
                      ),
                    ),
                  )
              ],
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              folderName,
              style: const TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert_rounded,
            color: Colors.grey,
          ),
        )
      ]),
    );
  }
  Widget buildAvatar(String name, String filename) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: Image.asset('assets/images/$filename.jpeg').image,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }*/
    ]),
    );
  }
}