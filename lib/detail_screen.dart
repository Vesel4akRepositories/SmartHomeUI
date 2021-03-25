import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/DeviceCard.dart';

import 'RoomCard.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double _sliderValue = 50;
  List<DeviceCard> listDevices = [
    DeviceCard(
      deviceName: "Light",
      urlImg: "💡",
      on: true,
      bgColor: Color.fromARGB(255, 254, 246, 229),
    ),
    DeviceCard(
      deviceName: "Cooler",
      on: true,
      urlImg: "❄",
      bgColor: Color.fromARGB(255, 233, 231, 247),
    ),
    DeviceCard(
      on: false,
      deviceName: "Smart TV",
      urlImg: "🖥️",
      bgColor: Color.fromARGB(255, 208, 236, 245),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(CupertinoIcons.chevron_back),
                ),
                SizedBox(width: 20),
                Text(
                  "Living Room",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(150)),
              child: Column(
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 254, 246, 229),
                          Color.fromARGB(255, 233, 148, 198),
                        ]),
                        borderRadius: BorderRadius.circular(155)),
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(300),
                            color: Colors.white),
                        width: 100,
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "21°C",
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: SizedBox(
                        width: 250,
                        child: Slider(
                          max: 100,
                          min: 0,
                          inactiveColor: Colors.blue[100],
                          value: _sliderValue,
                          onChanged: (value) {
                            setState(() {
                              _sliderValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Room Temperature",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Devices",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: listDevices.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) => listDevices[index],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
