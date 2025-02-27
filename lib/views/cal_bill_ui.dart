// ignore_for_file: sort_child_properties_last, prefer_is_empty

import 'dart:io';
import 'package:flutter/material.dart';
import "package:flutter/services.dart";
import 'package:image_picker/image_picker.dart';
import 'package:sau_mukratha_app/views/show_bill_ui.dart';

class CalBillUI extends StatefulWidget {
  const CalBillUI({super.key});

  @override
  State<CalBillUI> createState() => _CalBillUIState();
}

class _CalBillUIState extends State<CalBillUI> {
//สร้างตัวแปรที่ไปใช้กับผู้ใหญ่/เด็ก
  bool adultCheck = false;
  bool childCheck = false;

//จำนวณ Textfield
  TextEditingController adultCtrl = TextEditingController();
  TextEditingController childCtrl = TextEditingController();
  TextEditingController cokeCtrl = TextEditingController();
  TextEditingController waterCtrl = TextEditingController();

//สร้างตัวแปรเพื่ีอใช้กับน้ำดื่ม
  int waterCheck = 1;

//สร้างตัวแปรเก็บรูปถ่าย
  File? imgFile;

//สร้าง method เปิดกล้องเพื่อถ่ายรูป
  Future<void> openCamera() async {
    final picker = await ImagePicker().pickImage(
      source: ImageSource.camera, //ImageSource.gallery เลือกจาก gallery
      imageQuality: 75,
    );

    if (picker == null) return;
    setState(() {
      imgFile = File(picker.path);
    });
  }

//สร้างตัวแปรเก็บประเภทสมาชิก
  List<String> memberType = [
    'ไม่เป็นสมาชิก',
    'สมาชิกทั่วไปลด 5%',
    'สมาชิก VIP ลด 20%',
  ];
//สร้างตัวแปรกับส่วนลดที่เลือกจากประเภทสมาชิก
  double discount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 50, right: 50),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    openCamera();
                  },
                  child: imgFile == null
                      ? Image.asset(
                          'assets/images/camera.jpg',
                          height: 150,
                        )
                      : Image.file(imgFile!, height: 150),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนคน',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (valueParam) {
                        setState(() {
                          adultCheck = valueParam!;
                        });
                      },
                      value: adultCheck,
                    ),
                    SizedBox(
                      width: 160,
                      child: Text(
                        'ผู้ใหญ่ 299 บาท/คน จำนวน',
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        enabled: adultCheck,
                        controller: adultCtrl,
                        decoration: InputDecoration(
                          prefix: Text('  '),
                          suffix: Text('คน'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (valueParam) {
                        setState(() {
                          childCheck = valueParam!;
                        });
                      },
                      value: childCheck,
                    ),
                    SizedBox(
                      width: 160,
                      child: Text(
                        'เด็ก 69 บาท/คน จำนวน',
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        enabled: childCheck,
                        controller: childCtrl,
                        decoration: InputDecoration(
                          prefix: Text('  '),
                          suffix: Text('คน'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'บุฟเฟต์น้ำดื่ม',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      onChanged: (valueParam) {
                        setState(() {
                          waterCheck = valueParam!;
                          if (waterCheck == 1) {
                            cokeCtrl.text = '0';
                            waterCtrl.text = '0';
                          }
                        });
                      },
                      value: 1,
                      groupValue: waterCheck,
                    ),
                    Text('รับ 25 บาท/หัว')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      onChanged: (valueParam) {
                        setState(() {
                          waterCheck = valueParam!;
                        });
                      },
                      value: 2,
                      groupValue: waterCheck,
                    ),
                    Text('ไม่รับ')
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 220,
                      child: Text(
                        '               โค้ก 20 บาท/ขวด จำนวน',
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        enabled: waterCheck == 1 ? false : true,
                        controller: cokeCtrl,
                        decoration: InputDecoration(
                          prefix: Text('  '),
                          suffix: Text('ขวด'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 220,
                      child: Text(
                        '               น้ำเปล่า 15 บาท/ขวด จำนวน',
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        enabled: waterCheck == 1 ? false : true,
                        controller: waterCtrl,
                        decoration: InputDecoration(
                          prefix: Text('  '),
                          suffix: Text('ขวด'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ประเภทสมาชิก',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //dropdown ประเภทสมาชิก
                DropdownButton(
                  value: discount,
                  isExpanded: true,
                  items: memberType
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(e,
                              style: TextStyle(
                                fontSize: 16,
                              )),
                          value: memberType.indexOf(e).toDouble(),
                        ),
                      )
                      .toList(),
                  onChanged: (valueParam) {
                    setState(() {
                      switch (valueParam) {
                        case 0:
                          discount = 0;
                          break;
                        case 1:
                          discount = 0.05;
                          break;
                        case 2:
                          discount = 0.2;
                          break;
                      }
                      discount = valueParam!;
                    });
                  },
                ),
                //button ปุ่ม
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (imgFile == null) {
                          } else if (adultCheck == true &&
                                  adultCtrl.text == '0' ||
                              adultCtrl.text.isEmpty) {
                          } else if (childCheck == true &&
                                  childCtrl.text == '0' ||
                              childCtrl.text.isEmpty) {}
                          int adult = int.parse(adultCtrl.text);
                          int child = int.parse(childCtrl.text);
                          int coke = int.parse(cokeCtrl.text);
                          int waterr = int.parse(waterCtrl.text);
                          double payWaterBuffet =
                              waterCheck == 1 ? 25.0 * (adult + child) : 0;
                          double payTotal = (299.0 * adult) +
                              (69.0 * child) +
                              (20.0 * coke) +
                              (15.0 * waterr) +
                              payWaterBuffet;
                          payTotal = payTotal - (payTotal * discount);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShowBillUI(
                                      payTotal: payTotal,
                                      imgFile: imgFile,
                                    )),
                          );
                        },
                        icon: Icon(
                          Icons.calculate,
                        ),
                        label: Text(
                          'คํานวณเงิน',
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(double.infinity, 50),
                          backgroundColor: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cancel,
                        ),
                        label: Text(
                          'ยกเลิก',
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(double.infinity, 50),
                          backgroundColor: Colors.tealAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
