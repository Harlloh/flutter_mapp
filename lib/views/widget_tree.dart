import 'package:flutter/material.dart';
import 'package:my_app/data/constants.dart';
import 'package:my_app/data/notifiers.dart';
import 'package:my_app/views/pages/home_page.dart';
import 'package:my_app/views/pages/profile_page.dart';
import 'package:my_app/views/pages/settings_page.dart';
import 'package:my_app/views/widgets/navbar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

String title = "Flutter App or is it";
List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            onPressed: () async {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setBool(
                KConstants.isDarkModeKey,
                isDarkModeNotifier.value,
              );
            },
            icon: Icon(
              isDarkModeNotifier.value == false
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage(title: "Settings page or is it");
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      bottomNavigationBar: NavbarWidget(),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
    );
  }
}
