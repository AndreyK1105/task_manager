import 'package:flutter/material.dart';

class CheckListWidget extends StatelessWidget {
  const CheckListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Container(
                height: size.height / 3,
                width: size.width / 2.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 186, 194, 207)),

                //height: 400,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                          alignment: Alignment.bottomLeft,
                          height: 50,
                          child: const Text(
                            'Title check list one erevev efd',
                            overflow: TextOverflow.ellipsis,
                          )),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: LinearProgressIndicator(
                        value: 0.5,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          //shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: 30,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Checkbox(value: false, onChanged: (_) {}),
                                Text('check item$index'),
                              ],
                            );
                          }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
