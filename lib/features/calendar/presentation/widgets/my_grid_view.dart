import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  final firstMonthDay;
  final amountDays;
  final previosMonthLastDay;
  const MyGridView(
      {required this.firstMonthDay,
      required this.amountDays,
      required this.previosMonthLastDay,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 300,
      child: GridView.builder(
          reverse: false,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          //physics: ClampingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              //maxCrossAxisExtent: 50,
              childAspectRatio: 0.5,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemCount: ((firstMonthDay + amountDays - 1) / 7).ceil() * 7,
          itemBuilder: (BuildContext ctx, index) {
            return firstMonthDay - index - 2 < 0
                ? Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: index <= amountDays + firstMonthDay - 2
                            ? const Color.fromARGB(255, 240, 202, 165)
                            : const Color.fromARGB(186, 214, 214, 214),
                        borderRadius: BorderRadius.circular(5)),
                    child: index <= amountDays + firstMonthDay - 2
                        ? Text("${index - firstMonthDay + 2} ")
                        : Text("${index - firstMonthDay - amountDays + 2} "),
                  )
                : Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(186, 214, 214, 214),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                        "${previosMonthLastDay - firstMonthDay + index + 2} "),
                  );
          }),
    );
  }
}
