import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/homapage.dart';
import 'package:store/models/person.dart';
import 'package:store/provider/dataofperson.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  @override
  Widget build(BuildContext context) {
    return
        //สร้างproviderและเรียกใช้งาน provider=> consumer รอรับข้อมูลจาก provider
        MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return DataOfPerson();
        })
      ],
      child: MaterialApp(
        title: 'Personal Data Collection App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
