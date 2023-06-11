import 'package:flutter/material.dart';

class NamesByProvincePage extends StatefulWidget {
  const NamesByProvincePage({super.key});

  @override
  State<NamesByProvincePage> createState() => _NamesByProvincePageState();
}

class _NamesByProvincePageState extends State<NamesByProvincePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, int index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
                child: FittedBox(
              child: Text('500'),
            )),
            title: Text('Thailand'),
            subtitle: Text('1319300234507'),
          ),
        );
      }),
    );
  }
}
