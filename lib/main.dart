import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smart_home/RoomCard.dart';
import 'package:smart_home/detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<RoomCard> listRooms = [
    RoomCard(
      roomName: "Living Room",
      deviceCount: 5,
      urlImg: "🛋️",
      bgColor: Color.fromARGB(255, 254, 246, 229),
    ),
    RoomCard(
      roomName: "Kitchen",
      deviceCount: 5,
      urlImg: "🍳",
      bgColor: Color.fromARGB(255, 233, 231, 247),
    ),
    RoomCard(
      roomName: "Office",
      deviceCount: 5,
      urlImg: "🖨️",
      bgColor: Color.fromARGB(255, 208, 236, 245),
    ),
    RoomCard(
      roomName: "Bedroom",
      deviceCount: 5,
      urlImg: "🛏️",
      bgColor: Color.fromARGB(255, 250, 235, 232),
    ),
    RoomCard(
      roomName: "Bathroom",
      deviceCount: 5,
      urlImg: "🛀",
      bgColor: Color.fromARGB(255, 239, 247, 228),
    ),
    RoomCard(
      roomName: "Dining Room",
      deviceCount: 5,
      urlImg: "🍽️",
      bgColor: Color.fromARGB(255, 243, 206, 186),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(CupertinoIcons.bars),
                  Icon(CupertinoIcons.ellipsis_vertical),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Hi, Vesel4ak 👋🏻",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Welcome to Smart Home.",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Your ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      TextSpan(
                          text: "Rooms",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black)),
                    ]),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        primary: Colors.greenAccent[100],
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text("Add",
                                style: TextStyle(color: Colors.green[300])),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.add_circle,
                              color: Colors.green[300],
                            )
                          ],
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Wrap(children: [
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: listRooms.length,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.6)),
                    itemBuilder: (BuildContext context, int index) =>
                        InkResponse(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreen()));
                            },
                            child: listRooms[index])),
              ]),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
