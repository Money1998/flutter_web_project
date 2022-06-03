import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double? height;
  double? width;
  String dropdownValue = 'Jeffery Stevenson';

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    print("height => $height");
    print("width => $width");

    return Scaffold(
      body: SingleChildScrollView(
        child: (width!>1200?webView():mobileView()),
      ),
    );
  }

  Widget welCome() {
    return Row(
      children: [
        SizedBox(
          width: (width! * 0.05),
        ),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent, width: 2),
            shape: BoxShape.circle,
          ),
          child: const Center(
              child: Text(
            "AS",
            style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: 'RobotoMono'),
          )),
        ),
        SizedBox(
          width: (width! * (width!>1200?0.02:0.05)),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
          Text(
            "Welcome",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
          Text(
            "Anna Stevenson",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ]),
        SizedBox(
          width: (width! * (width!>=1200?0.2:width!>=1000?0.65:width!>=800?0.60:width!>=600?0.45:width!>=400?0.30:0.45)),
        ),
        const Icon(Icons.logout, color: Colors.blueAccent, size: 45),
      ],
    );
  }

  Widget middleWidget() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal:width!*0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Sign Up as a patient",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 22,
                ),
              ),
              const Text(
                "Plan your first visit to our office",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: height! * 0.02,
              ),
              SizedBox(
                height: 0.5,
                width: width!*(width!>1200?0.3:0.9),
                child: Center(
                  child: Container(
                    margin:
                        const EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                    height: 5.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: height! * 0.02,
              ),
              const Text(
                "Profile",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 22,
                ),
              ),
              const Text(
                "Change your Username and Password",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget cardWidget() {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        color: Colors.blueAccent,
        child: Padding(
          padding: EdgeInsets.fromLTRB(width!>1200?170:20, 0, width!>1200?170:20, 0),
          child: Column(children: [
            SizedBox(
              height: height! * (width!>1200?0.3:0.04),
            ),
            const Text(
              "View / Manage Accounts",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 26,color: Colors.white
              ),
            ),
            SizedBox(
              height: height! * 0.04,
            ),
             Align(
              alignment: (width!>1200?Alignment.center:Alignment.centerLeft),
              child: const Text(
                  "Manage health account shared with you.\nYou can set appointments, send messages,\npay bills or review health summary and\nother aspects of healthcare.", style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,color: Colors.white,
              )),
            ),
            SizedBox(
              height: height! * (width!>1200?0.08:0.04),
            ),
            Container(
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.0, style: BorderStyle.none),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                color: Colors.white
              ),
              child: DropdownButton<String>(
                value: dropdownValue,
                underline: Container(),
                isExpanded: true,
                items: <String>[
                  'Jeffery Stevenson',
                  'Jeffery sigar',
                  'paul martin',
                  'chris mouse'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
              ),
            ),
            SizedBox(
              height: (height! * (width!>1200?0.04:0.02)),
            ),
            buttonWidget(),
          ]),
        ),
      ),
    );
  }

  Widget webCardWidget() {
    return SizedBox(
      height: height,
      width: width!/2,
      child: Card(
        color: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(children: [
            SizedBox(
              height: height! * (width!>1000?0.3:0.02),
            ),
            const Text(
              "View / Manage Accounts",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 26,color: Colors.white
              ),
            ),
            SizedBox(
              height: height! * 0.04,
            ),
            Align(
              alignment: (width!>1000?Alignment.center:Alignment.centerLeft),
              child: const Text(
                  "Manage health account shared with you.You can set\nappointments, send messages,pay bills or review health \nsummary and other aspects of healthcare.", style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,color: Colors.white,
              )),
            ),
            SizedBox(
              height: height! * (width!>1000?0.08:0.04),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width!>1000?100:20, 0, width!>1000?100:20, 0),
              child: Container(
                decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.0, style: BorderStyle.none),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    color: Colors.white
                ),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  underline: Container(),
                  isExpanded: true,
                  items: <String>[
                    'Jeffery Stevenson',
                    'Jeffery sigar',
                    'paul martin',
                    'chris mouse'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: (height! * (width!>1000?0.04:0.02)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width!>1000?100:20, 0, width!>1000?100:20, 0),
              child: buttonWidget(),
            ),
          ]),
        ),
      ),
    );
  }

  Widget buttonWidget() {
    return Container(
      margin: const EdgeInsets.only(
        left: 1,
        right: 1,
      ),
      decoration: BoxDecoration(
        border: Border.all( color:Colors.white),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),

      ),
      height: 45,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const [
                Text(
                  "Proceed",
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget mobileView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: (height! * 0.1),
          ),
          welCome(),
          SizedBox(
            height: (height! * (width!>1200?0.2:0.1)),
          ),
          middleWidget(),
          SizedBox(
            height: (height! * 0.1),
          ),
          cardWidget(),
        ],
      ),
    );
  }
  Widget webView() {
    return SizedBox(
      height: height,
      child: Center(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: (height! * (width!>1000?0.05:0.2)),
                ),
                welCome(),
                SizedBox(
                  height: (height! * (width!>1000?0.3:0.1)),
                ),
                middleWidget(),
                SizedBox(
                  height: (height! * 0.1),
                ),
              ],
            ),
            webCardWidget(),
          ],
        ),
      ),
    );
  }
}
