import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main/app.dart';

void main() {
  runApp(ProviderScope(child: MainApp()));
}
/*
class MyHomePageState extends StatelessWidget {
  List<String> itemsList = [
    "item0",
    "item1",
    "item2",
    "item3",
    "item4",
    "item5",
    "item2",
    "item3",
    "item4",
    "item5",
    "item3",
    "item4",
    "item5",
    "item2",
    "item3",
  ];

  MyHomePageState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Sample"),
      ),
      body: Container(
        //height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.blueAccent),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 100, maxHeight: 400),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: ((context, index) {
                      return Text('data= $index');
                    })),
              ),
            ],
          ),
        ),
      ),

      //     Container(
      //   color: Colors.black54,
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: <Widget>[
      //       ConstrainedBox(
      //         constraints: BoxConstraints(maxHeight: 200),
      //         child: ListView.builder(
      //             shrinkWrap: true,
      //             itemCount: itemsList.length,
      //             itemBuilder: (context, index) {
      //               return Container(
      //                   child: Align(
      //                     alignment: Alignment.centerRight,
      //                     child: Text(
      //                       itemsList[index],
      //                       style: TextStyle(
      //                           fontSize: 20, fontWeight: FontWeight.bold),
      //                     ),
      //                   ),
      //                   width: 100,
      //                   height: 20,
      //                   margin: EdgeInsets.only(bottom: 10),
      //                   color: Colors.red);
      //             }),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
*/