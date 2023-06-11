import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/person.dart';
import 'package:store/provider/dataofperson.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  final formKey = GlobalKey<FormState>();

//controller
  final titleContro = TextEditingController();
  final dateOfBirth = TextEditingController();
  final Phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แบบฟอร์มกรอกข้อมูล'),
      ),
      body: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration:
                    new InputDecoration(labelText: 'รหัสประจำตัวประชาชน'),
                autofocus: true,
                controller: titleContro,
                validator: (str) {
                  if (str!.isEmpty) {
                    return "กรุณากรอกชื่อ-นามสกุล";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: new InputDecoration(labelText: 'ชื่อ-นามสกุล'),
                controller: dateOfBirth,
                validator: (str) {
                  if (str!.isEmpty) {
                    return "กรุณากรอกวันเกิด";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: new InputDecoration(labelText: 'เบอร์โทรศัพท์'),
                controller: Phone,
                validator: (str) {
                  if (str!.isEmpty) {
                    return "กรุณากรอกวันเกิด";
                  }
                  return null;
                },
              ),
              /*ElevatedButton(
                  onPressed: () {
                    //เช็คค่าว่าง
                    if (formKey.currentState!.validate()) {
                      var tittle = titleContro.text;
                      var date = dateOfBirth.text;
                      var tele = Phone.text;

                      //เตรียมข้อมูล
                      DataPeople statement = DataPeople(
                          names: tittle, idcard: tele, nickname: date); //object

                      //เรียกใช้ provider
                      var provider =
                          Provider.of<DataOfPerson>(context, listen: false);
                      provider.addDataPeople(statement);

                      Navigator.pop(context);
                    }
                  },
                  child: Text('ถัดไป'))*/
            ],
          )),
    );
  }
}
