import 'package:flutter/material.dart';
import 'package:my_app/views/pages/expanded_test.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});

  final String title;
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.00;
  String? menuItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("Alert content"),
                        title: Text("alert title"),
                        actions: [
                          FilledButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Close"),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
                child: Text("Open Dialog"),
              ),
              Divider(color: Colors.teal, thickness: 2.0),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Snack bar"),
                      duration: Duration(seconds: 5),
                    ),
                  );
                },
                child: Text("Open Snack bar"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
              ),
              DropdownButton(
                value: menuItem,
                items: [
                  DropdownMenuItem(value: '', child: Text("Select item")),
                  DropdownMenuItem(value: 'e1', child: Text("Element 1")),
                  DropdownMenuItem(value: 'e2', child: Text("Element 2")),
                ],
                onChanged: (String? value) {
                  setState(() {
                    menuItem = value;
                  });
                },
              ),
              Text("Hello"),
              TextField(
                controller: controller,
                decoration: InputDecoration(border: OutlineInputBorder()),
                onEditingComplete: () {
                  setState(() {});
                },
              ),
              Text(controller.text),
              Checkbox(
                tristate: true,
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              CheckboxListTile.adaptive(
                tristate: true,
                title: Text("Click me"),
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              Switch(
                value: isSwitched,
                onChanged: (bool value) => setState(() {
                  isSwitched = value;
                }),
              ),
              SwitchListTile.adaptive(
                title: Text("Holla"),
                activeThumbColor: Colors.green,
                value: isSwitched,
                onChanged: (bool value) => setState(() {
                  isSwitched = value;
                }),
              ),
              Slider.adaptive(
                value: sliderValue,
                divisions: 10,
                max: 10,
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value;
                  });
                  print(sliderValue);
                },
              ),
              InkWell(
                splashColor: Colors.teal,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.white12,
                ),
                onTap: () {
                  print('Image Tapped');
                },
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ExpandedTestPage();
                      },
                    ),
                  );
                },
                child: Text("Show Flexible and Expanded"),
              ),
              FilledButton(onPressed: () {}, child: Text("CLick me")),
              TextButton(
                onPressed: () {},
                child: Text("CLick me"),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text("CLick me"),
                style: TextButton.styleFrom(foregroundColor: Colors.green),
              ),
              CloseButton(),
            ],
          ),
        ),
      ),
    );
  }
}
