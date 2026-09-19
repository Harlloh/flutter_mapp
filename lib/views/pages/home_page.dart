import 'package:flutter/material.dart';
import 'package:my_app/views/pages/course_page.dart';
import 'package:my_app/views/widgets/container_widget.dart';
import 'package:my_app/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.0),
            HeroWidget(title: "Home page", nextPage: CoursePage()),
            SizedBox(height: 10.0),
            ...List.generate(5, (index) {
              return ContainerWidget(
                title: "Basic Layout",
                desc: "This is the description",
              );
            }),
          ],
        ),
      ),
    );
  }
}
