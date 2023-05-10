import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreenBotomBar extends StatelessWidget {
  const HomeScreenBotomBar({
    required this.child,
    super.key,
  });

  final Widget child;
  //int _selectedIndex = 0;
  // List<String> routs = ['/home_screen', '/calendar'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important_rounded),
            label: 'Notes',
          ),
        ],
      ),

      //Test(),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/calendar')) {
      return 1;
    }
    if (location.startsWith('/notes')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
        break;
      case 1:
        GoRouter.of(context).go('/calendar');
        break;
      case 2:
        GoRouter.of(context).go('/notes');
        break;
    }
  }
}
