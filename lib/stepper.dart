import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/person.dart';
import 'package:store/provider/dataofperson.dart';

class StepperForm extends StatefulWidget {
  const StepperForm({super.key});

  @override
  State<StepperForm> createState() => _StepperFormState();
}

class _StepperFormState extends State<StepperForm> {
  int _currentStep = 0;
  bool isCompleted = false;
  final formKey = GlobalKey<FormState>(); //object ไว้ใช้ตอน validation

  final idCard = TextEditingController();
  final names = TextEditingController();
  final nickname = TextEditingController();
  final birthday = TextEditingController();
  final numPhone = TextEditingController();
  //ที่อยู่
  final noHose = TextEditingController();
  final tombon = TextEditingController();
  final aomphue = TextEditingController();
  final province = TextEditingController();
  final id = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แบบฟอร์มกรอกข้อมูล'),
      ),
      body: Form(
        key: formKey,
        child: Stepper(
            currentStep: _currentStep,
            steps: getSteps(),
            onStepTapped: (int newIndex) {
              formKey.currentState!.validate();
              setState(() {
                _currentStep = newIndex;
              });
            },
            onStepContinue: () {
              final isLastStep = _currentStep == getSteps().length - 1;
              formKey.currentState!.validate();
              bool isDetailvalid = isDetailCompleate(); //เช้คว่าถ้าok ก็จะไปต่อ

              if (isDetailvalid) {
                if (isLastStep) {
                  setState(() {
                    isCompleted = true;
                  });
                } else {
                  setState(() {
                    _currentStep += 1;
                  });
                }
              }
            },
            onStepCancel: () {
              if (_currentStep == 0) {
                null;
              } else {
                setState(() {
                  _currentStep -= 1;
                });
              }
            }),
      ),
    );
  }

  bool isDetailCompleate() {
    if (_currentStep == 0) {
      //check idcard
      if (idCard.text.isEmpty ||
          names.text.isEmpty ||
          nickname.text.isEmpty ||
          birthday.text.isEmpty ||
          numPhone.text.isEmpty) {
        return false;
      } else {
        return true;
      }
    } else if (_currentStep == 1) {
      if (noHose.text.isEmpty ||
          tombon.text.isEmpty ||
          aomphue.text.isEmpty ||
          province.text.isEmpty ||
          id.text.isEmpty) {
        return false;
      } else {
        return true;
      }
    }
    return false;
  }

  List<Step> getSteps() => [
        Step(
            title: Text('ข้อมูลส่วนตัว'),
            isActive: _currentStep >= 0,
            state: _currentStep > 0 ? StepState.complete : StepState.disabled,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'รหัสประจำตัวประชาชน'),
                  autofocus: true,
                  controller: idCard,
                  validator: (str) {
                    if (str!.isEmpty) {
                      return "กรุณากรอกรหัสประจำตัวประชาชน 13 หลัก";
                    } else if (str.length != 13) {
                      return 'รหัสประจำตัวประชาชนมี 13 หลัก';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: 'ชื่อ-นามสกุล'),
                  autofocus: true,
                  controller: names,
                  validator: (str) {
                    if (str!.isEmpty) {
                      return "กรุณากรอกชื่อ-นามสกุล";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: 'ชื่อเล่น'),
                  autofocus: true,
                  controller: nickname,
                  validator: (str) {
                    if (str!.isEmpty) {
                      return "กรุณากรอกชื่อเล่น";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: 'วันเกิด'),
                  autofocus: true,
                  controller: birthday,
                  keyboardType: TextInputType.datetime,
                  validator: (str) {
                    if (str!.isEmpty) {
                      return "กรุณากรอกวันเกิด 00/00/0000";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: 'เบอร์โทรศัพท์'),
                  autofocus: true,
                  keyboardType: TextInputType.phone,
                  controller: numPhone,
                  validator: (str) {
                    if (str!.isEmpty) {
                      return "กรุณากรอกเบอร์โทรศัพท์ 10 หลัก";
                    } else if (str.length != 10) {
                      return 'เบอร์โทรศัพท์ มี 10 หลัก';
                    }
                    return null;
                  },
                ),
              ],
            )),
        Step(
            title: Text('ข้อมูลที่อยู่ตามบัตรประชาชน'),
            isActive: _currentStep >= 1,
            state: _currentStep > 1 ? StepState.complete : StepState.disabled,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: new InputDecoration(labelText: 'เลขที่'),
                  autofocus: true,
                  controller: noHose,
                  validator: (str) {
                    if (str!.isEmpty) {
                      return "กรุณากรอกที่อยู่";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: 'ตำบล/เขต'),
                  autofocus: true,
                  controller: tombon,
                  validator: (str) {
                    if (str!.isEmpty) {
                      return "กรุณากรอกตำบล/เขต";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: 'อำเภอ/แขวง'),
                  autofocus: true,
                  controller: aomphue,
                  validator: (str) {
                    if (str!.isEmpty) {
                      return "กรุณากรอกอำเภอ/แขวง";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: 'จังหวัด'),
                  autofocus: true,
                  controller: province,
                  validator: (str) {
                    if (str!.isEmpty) {
                      return "กรุณากรอกจังหวัด";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: 'รหัสไปรษณีย์'),
                  autofocus: true,
                  controller: id,
                  keyboardType: TextInputType.number,
                  validator: (str) {
                    if (str!.isEmpty) {
                      return "กรุณากรอกรหัสไปรษณีย์";
                    } else if (str.length != 5) {
                      return 'รหัสไปรษณีย์ มี 5 หลัก';
                    } else
                      return null;
                  },
                ),
              ],
            )),
        Step(
            title: const Text('สิ้นสุด'),
            isActive: _currentStep >= 2,
            state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('รหัสประจำตัวประชาชน:${idCard.text}'),
                Text('ชื่อ-นามสกุล:${names.text}'),
                Text('ชื่อเล่น:${nickname.text}'),
                Text('วันเกิด:${birthday.text}'),
                Text('เบอร์มือถือ:${numPhone.text}'),
                Text('บ้านเลขที่:${noHose.text}'),
                Text('ตำบล/เขต:${tombon.text}'),
                Text('อำเภอ/แขวง:${aomphue.text}'),
                Text('รหัสไปรษณีย์:${idCard.text}'),
                ElevatedButton(
                    onPressed: () {
                      //เช็คค่าว่าง
                      if (formKey.currentState!.validate()) {
                        var idcard1 = idCard.text;
                        var names1 = names.text;
                        var nick1 = nickname.text;
                        var datebirth = birthday.text;
                        var number = numPhone.text;

                        var no = noHose.text;
                        var tombon1 = tombon.text;
                        var aumpeu = aomphue.text;
                        var province1 = province.text;
                        var idPro = id.text;

                        //เตรียมข้อมูล
                        DataPeople statementlatest = DataPeople(
                          idcard: idcard1,
                          names: names1,
                          nickname: nick1,
                          birthDay: datebirth,
                          phone: number,
                          numberHouse: no,
                          tombon: tombon1,
                          aomphe: aumpeu,
                          province: province1,
                          id: idPro,
                        ); //object

                        //เรียกใช้ provider
                        var provider =
                            Provider.of<DataOfPerson>(context, listen: false);
                        provider.addDataPeople(statementlatest);

                        Navigator.pop(context);
                      }
                    },
                    child: const Text('บันทึกข้อมูล'))
              ],
            ))
      ];
}
