import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/person.dart';
import 'package:store/provider/dataofperson.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile detail'),
        ),
        body: Consumer(
          builder: (context, DataOfPerson provider, child) {
            var count = provider.inform.length;
            return ListView.builder(
                itemCount: count,
                itemBuilder: (context, int index) {
                  DataPeople datain = provider.inform[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Column(
                        children: [
                          const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ข้อมูลส่วนตัว',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text('รหัสประจำตัวประชาชน :   '),
                              Text(datain.idcard)
                            ],
                          ),
                          Row(
                            children: [
                              Text('ชื่อ - สกุล :   '),
                              Text(datain.names)
                            ],
                          ),
                          Row(
                            children: [
                              Text('ชื่อเล่น :   '),
                              Text(datain.nickname)
                            ],
                          ),
                          Row(
                            children: [
                              Text('วันเกิด:   '),
                              Text(datain.birthDay)
                            ],
                          ),
                          Row(
                            children: [
                              Text('เบอร์โทรศัพท์ :   '),
                              Text(datain.phone)
                            ],
                          ),
                          const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ข้อมูลที่อยู่',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text('เลขที่ :   '),
                              Text(datain.numberHouse)
                            ],
                          ),
                          Row(
                            children: [
                              Text('ตำบล/เขต:   '),
                              Text(datain.tombon)
                            ],
                          ),
                          Row(
                            children: [
                              Text('อำเภอ/แขวง :   '),
                              Text(datain.aomphe)
                            ],
                          ),
                          Row(
                            children: [
                              Text('จังหวัด:   '),
                              Text(datain.province)
                            ],
                          ),
                          Row(
                            children: [
                              Text('รหัสไปรษณีย์:   '),
                              Text(datain.id)
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
        ));
  }
}
