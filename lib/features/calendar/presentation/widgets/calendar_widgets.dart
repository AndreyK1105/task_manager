import 'package:flutter/material.dart';

import 'my_grid_view.dart';

Widget month(
    int previosMonthLastDay, int firstMonthDay, int amountDays, String month) {
  //firstMonthDay = 6;

  return Padding(
    padding: const EdgeInsets.only(left: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 60,
        ),
        Text(
          month,
          style: const TextStyle(fontSize: 40),
        ),
        const SizedBox(
          height: 60,
        ),
        Row(
          children: [
            // SizedBox(
            //     height: 250,
            //     width: 25,
            //     child: ListView.separated(
            //       scrollDirection: Axis.vertical,
            //       shrinkWrap: true,
            //       itemCount: daysOfTheWeek.length,
            //       itemBuilder: (BuildContext context, index) {
            //         return Text(

            //           daysOfTheWeek[index],
            //           style: TextStyle(
            //               color: index > 4 ? Colors.red : Colors.black),
            //         );
            //       },
            //       separatorBuilder: (BuildContext context, int index) =>
            //           const Divider(
            //         height: 19,
            //       ),
            //     )),

            daysWeek(),
            MyGridView(
              amountDays: amountDays,
              firstMonthDay: firstMonthDay,
              previosMonthLastDay: previosMonthLastDay,
            ),
            // SizedBox(
            //   height: 250,
            //   width: 300,
            //   child: GridView.builder(
            //       reverse: false,
            //       scrollDirection: Axis.horizontal,
            //       shrinkWrap: true,
            //       //physics: ClampingScrollPhysics(),
            //       gridDelegate:
            //           const SliverGridDelegateWithFixedCrossAxisCount(
            //               crossAxisCount: 7,
            //               //maxCrossAxisExtent: 50,
            //               childAspectRatio: 0.5,
            //               crossAxisSpacing: 5,
            //               mainAxisSpacing: 5),
            //       itemCount:
            //           ((firstMonthDay + amountDays - 1) / 7).ceil() * 7,
            //       itemBuilder: (BuildContext ctx, index) {
            //         return firstMonthDay - index - 2 < 0
            //             ? Container(
            //                 alignment: Alignment.center,
            //                 decoration: BoxDecoration(
            //                     color: index <= amountDays + firstMonthDay - 2
            //                         ? const Color.fromARGB(255, 240, 202, 165)
            //                         : const Color.fromARGB(
            //                             186, 214, 214, 214),
            //                     borderRadius: BorderRadius.circular(5)),
            //                 child: index <= amountDays + firstMonthDay - 2
            //                     ? Text("${index - firstMonthDay + 2} ")
            //                     : Text(
            //                         "${index - firstMonthDay - amountDays + 2} "),
            //               )
            //             : Container(
            //                 alignment: Alignment.center,
            //                 decoration: BoxDecoration(
            //                     color:
            //                         const Color.fromARGB(186, 214, 214, 214),
            //                     borderRadius: BorderRadius.circular(5)),
            //                 child: Text(
            //                     "${previosMonthLastDay - firstMonthDay + index + 2} "),
            //               );
            //       }),
            // ),
          ],
        ),
        // Column(
        //   children: const [
        //     Text(
        //       'П   3 10 17 24 31',
        //       style: TextStyle(fontSize: 20),
        //     ),
        //     Text(
        //       'В   4 11 18 25 ',
        //       style: TextStyle(fontSize: 20),
        //     ),
        //     Text(
        //       'С   5 12 19 26',
        //       style: TextStyle(fontSize: 20),
        //     ),
        //     Text(
        //       'Ч   6 13 20 27',
        //       style: TextStyle(fontSize: 20),
        //     ),
        //     Text(
        //       'П   7 14 21 28',
        //       style: TextStyle(fontSize: 20),
        //     ),
        //     Text(
        //       'С 1 8 15 22 29',
        //       style: TextStyle(fontSize: 20),
        //     ),
        //     Text(
        //       'В 2 9 16 23 30',
        //       style: TextStyle(fontSize: 20),
        //     ),
        //   ],
        // )
      ],
    ),
  );
}

Widget myBox() {
  return Column(
    children: [
      Container(
        height: 200,
        width: 200,
        color: Colors.amberAccent,
        child: const Text('Box1'),
      ),
      Container(
        height: 200,
        width: 200,
        color: Color.fromARGB(255, 46, 51, 54),
        child: const Text('Box2'),
      )
    ],
  );
}

Widget daysWeek() {
  const List<String> daysOfTheWeek = ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС'];
  return SizedBox(
      height: 250,
      width: 25,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: daysOfTheWeek.length,
        itemBuilder: (BuildContext context, index) {
          return Text(
            daysOfTheWeek[index],
            style: TextStyle(color: index > 4 ? Colors.red : Colors.black),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 19,
        ),
      ));
}
