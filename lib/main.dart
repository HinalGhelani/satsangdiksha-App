import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'detail_page.dart';
import 'homePage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const SplashPage(),
      'firstPage': (context) => const FirstPage(),
      'homePage': (context) => const MyApp(),
      'detail_page': (context) => const DetailPage(),
    },
  ));
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, 'firstPage'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: const Color(0xffBF1A42),
      child: Image.asset(
        "assets/images/logo.png",
        height: 200,
        width: 200,
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  List finalData = [];

  String jsonData = '';

  loadJson() async {
    jsonData = await rootBundle.loadString("assets/json/student_data.json");
  }

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 190),
            Image.asset(
              "assets/images/logo.png",
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 120),
            GestureDetector(
              onTap: () async{
                List decodeData = jsonDecode(jsonData);

                setState(() {
                  finalData = decodeData;
                });
                Navigator.of(context).pushNamed('homePage',arguments: finalData);
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child:
                const Text(
                  "Sholka",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffBF1A42)),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Color(0xffBF1A42),
    );
  }
}
