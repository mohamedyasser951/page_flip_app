import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:page_flip_app/demo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GlobalKey<PageFlipWidgetState>();

    return Scaffold(
      body: PageFlipWidget(
        key: controller,
        backgroundColor: Colors.white,
        lastPage: Container(
          color: Colors.white,
          child: const Center(child: Text('Last Page!')),
        ),
        children: <Widget>[for (var i = 0; i < 5; i++) DemoPage(page: i)],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigate_next_rounded),
        onPressed: () {
          controller.currentState?.goToPage(5);
        },
      ),
    );
  }
}
