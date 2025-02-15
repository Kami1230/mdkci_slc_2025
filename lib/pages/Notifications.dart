import 'dart:convert';

import 'package:flutter/material.dart';
import '/pages/HomePage.dart';
import '/pages/EventSchedule.dart';
import '/pages/MapPage.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Notifications extends StatefulWidget {
  final String folderName;
  const Notifications({required this.folderName, super.key});
  static const banner = Color(0xff404040);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final channel = WebSocketChannel.connect(Uri.parse('wss://secure-brook-93316-938a41b3b17a.herokuapp.com'));
  List<String> messages = [];

  @override
  void initState() {
    super.initState();
    channel.stream.listen((message) {
      setState(() {
        try {
          var parsedMessage = jsonDecode(message);

          if (parsedMessage['type'] == 'history') {
            List<dynamic> historyMessages = parsedMessage['messages'];
            messages = historyMessages.map((item) => item.toString()).toList();
          } else if (parsedMessage['type'] == 'message') {
            messages.insert(0, parsedMessage['content'].toString());
          } else if (parsedMessage['type'] == 'clear') {
            messages.clear();
          }
        } catch (e) {
          print('Error decoding message: $e');
          print('Original message: $message');
          messages.insert(0, message.toString());
        }
      });
    }, onError: (error) {
      print('WebSocket error: $error');
    }, onDone: () {
      print('WebSocket connection closed');
    });
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  double availableScreenWidth = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double availableScreenWidth = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
          alignment: Alignment.bottomCenter,
          height: 100,
          decoration: BoxDecoration(color: Notifications.banner),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
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
                            MaterialPageRoute(
                                builder: (context) => const Notifications(
                                  folderName: 'pages',
                                )),
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
                            MaterialPageRoute(
                                builder: (context) => const EventSchedule(
                                  folderName: 'pages',
                                )),
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
                            MaterialPageRoute(
                                builder: (context) => const MapPage(
                                  folderName: 'pages',
                                )),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ]),
        ),
        Expanded(
          child: Column(
            children: [
              SizedBox(
                width: availableScreenWidth,
                height: 40,
                child: Text(
                  "Event Notifications",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Aboreto'),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  // reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            messages[index],
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Quattrocento',
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}