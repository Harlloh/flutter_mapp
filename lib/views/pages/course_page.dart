import 'package:flutter/material.dart';
import 'package:my_app/data/classes/activity_class.dart';
import 'package:my_app/views/widgets/hero_widget.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late Future<Activity> activityFuture;

  @override
  void initState() {
    super.initState();
    activityFuture = getData();
  }

  Future<Activity> getData() async {
    var url = Uri.https('bored-api.appbrewery.com', '/random');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      return Activity.fromJson((jsonDecode(response.body)));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: activityFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // Widget widget;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            Activity activity = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  HeroWidget(title: activity.activity),
                  Text(activity.activity),
                ],
              ),
            );
          } else {
            return Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
