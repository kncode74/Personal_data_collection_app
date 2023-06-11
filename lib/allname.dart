import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:store/alertDelete.dart';
import 'package:store/models/person.dart';
import 'package:store/profile.dart';
import 'package:store/provider/dataofperson.dart';
import 'package:store/stepper.dart';

class AllNamesPage extends StatefulWidget {
  const AllNamesPage({super.key});

  @override
  State<AllNamesPage> createState() => _AllNamesPageState();
}

class _AllNamesPageState extends State<AllNamesPage> {
  String titles = 'AlertDialog';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, DataOfPerson provider, child) {
        var count = provider.inform.length;
        if (count <= 0) {
          return const Center(
            child: Text(
              'ไม่พบข้อมูลผู้ใช้',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          );
        } else {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Myprofile(),
                ),
              );
            },
            child: ListView.builder(
                itemCount: count,
                itemBuilder: (context, int index) {
                  DataPeople datain = provider.inform[index];
                  return Card(
                    child: ListTile(
                      title: Text(datain.names),
                      subtitle: Text(datain.idcard),
                      trailing: SizedBox(
                        width: 40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () async {
                                  final action = await AlertDialogs.yesorCancel(
                                      context, 'Delete', 'Are you sure ?');
                                  if (action == DialogsAction.yes) {
                                    setState(() {
                                      provider.inform.removeAt(index);
                                    });
                                  }
                                },
                                child: Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        }
      }),
    );
  }
}
