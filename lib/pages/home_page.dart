import 'package:chat_app_tut/componenets/my_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 201, 191, 191)),
        ),
        child: NavigationBar(
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined,
                  color: Theme.of(context).colorScheme.primary),
              label: "Home",
            ),
            NavigationDestination(
              icon:
                  Icon(Icons.add, color: Theme.of(context).colorScheme.primary),
              label: "Post",
            ),
            NavigationDestination(
              icon: Icon(Icons.person_pin,
                  color: Theme.of(context).colorScheme.primary),
              label: "Profile",
            ),
          ],
          selectedIndex: _currentPageIndex, // Use the state variable
          onDestinationSelected: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
          }, // Update the selected index
        ),
      ),
      drawer: MyDraer(),
      appBar: AppBar(
        title: Text("Home"),
      ),
    );
  }
}
