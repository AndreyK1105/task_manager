import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TodoDays extends StatelessWidget {
  const TodoDays({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 20,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 100,
          itemBuilder: ((context, index) {
            return Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: Text('data${index}'),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                      width: 30,
                      child: Divider(
                        thickness: 3,
                      )),
                ),
                // Container(
                //   width: 30,
                //   color: Colors.amber,
                // )
              ],
            );
          })),
    );
  }
}
