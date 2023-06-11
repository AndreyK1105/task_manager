// import 'package:flutter/material.dart';

// class TodoTaskDay extends StatelessWidget {
//   const TodoTaskDay({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return Container(
//       //height: 30,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: Color.fromARGB(255, 128, 149, 185)),
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ConstrainedBox(
//               constraints:
//                   BoxConstraints(maxHeight: size.height / 3, minHeight: 100),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: 100,
//                         itemBuilder: ((context, index) {
//                           return Text('data= $index');
//                         })),
//                   ),
//                   Text('100'),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
