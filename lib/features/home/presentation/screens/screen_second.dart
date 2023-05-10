import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ScreenSecond extends StatefulWidget {
  static var page;

  const ScreenSecond({super.key});

  @override
  State<ScreenSecond> createState() => _ScreenSecondState();
}

class _ScreenSecondState extends State<ScreenSecond> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
