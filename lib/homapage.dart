import 'package:flutter/material.dart';
import 'package:store/allname.dart';
import 'package:store/inputForm.dart';
import 'package:store/province.dart';
import 'package:store/stepper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Data Collection'),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TabBar(
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Tab(
                    icon: Image.asset('images/people.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Tab(
                    icon: Image.asset('images/identification-card.png'),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AllNamesPage(),
                  NamesByProvincePage(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StepperForm(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
