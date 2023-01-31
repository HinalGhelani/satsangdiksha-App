import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List finalData = [];
  //
  // String jsonData = '';
  //
  // loadJson() async {
  //   jsonData = await rootBundle.loadString("assets/json/student_data.json");
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   loadJson();
  // }

  @override
  Widget build(BuildContext context) {

    final h = ModalRoute.of(context)!.settings.arguments as List;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Satsangdiksha",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () async {
        //         List decodeData = jsonDecode(jsonData);
        //
        //         setState(() {
        //           finalData = decodeData;
        //         });
        //       },
        //       icon: const Icon(Icons.download))
        // ],
        backgroundColor: Color(0xffB91940),
      ),
      body: ListView.builder(
        itemCount: h.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'detail_page', arguments: [
                h[i]['id'],
                h[i]['title'],
                h[i]['sholka'],
                h[i]['meaning'],
                h[i]['english']
              ]);
              print("${h[i]['id']}");
            },
            child: Card(
              elevation: 3,
              child: Container(
                height: 70,
                alignment: Alignment.center,
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffF8DDE4),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${h[i]['id']}",
                      style: const TextStyle(
                          color: Color(0xffB91940),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  title: Text("${h[i]['title']}"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}