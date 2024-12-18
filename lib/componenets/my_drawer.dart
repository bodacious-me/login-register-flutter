import 'package:chat_app_tut/services/auth/auth_services.dart';
import 'package:chat_app_tut/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyDraer extends StatelessWidget {
  const MyDraer({super.key});

  void logout() {
    final authServices = AuthServices();
    authServices.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Center(
                  child: DrawerHeader(
                      child: Icon(
                Icons.message,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ))),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: ListTile(
                      title: Text("H O M E"),
                      leading: Icon(
                        Icons.home,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: ListTile(
                      title: Text("S E T T I N G S"),
                      leading: Icon(
                        Icons.settings,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsPage()));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 25),
            child: ListTile(
              title: Text("L O G O U T"),
              leading: Icon(
                Icons.logo_dev,
                color: Theme.of(context).colorScheme.primary,
              ),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
