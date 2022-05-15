import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class BmrUI extends StatefulWidget {
  const BmrUI({Key? key}) : super(key: key);

  @override
  State<BmrUI> createState() => _BmrUIState();
}

class _BmrUIState extends State<BmrUI> {
  int sex = 1;
  String bmr = '-???-';

  TextEditingController weight_ctrl = TextEditingController();
  TextEditingController height_ctrl = TextEditingController();
  TextEditingController age_ctrl = TextEditingController();
  showWarningDialog(context, msg) {
//เรียกใช้งานฟังก์ชัน showDialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.white,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                ' คำเตือน',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ตกลง',
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('BMR APP'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40.0,
              ),
              Image.asset(
                'assets/images/bmr.png',
                height: 150.0,
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.people_sharp,
                    ),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          sex = int.parse(value.toString());
                        });
                      },
                      value: 1,
                      groupValue: sex,
                      activeColor: Colors.blue,
                    ),
                    Text(
                      'ชาย',
                    ),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          sex = int.parse(value.toString());
                        });
                      },
                      value: 2,
                      groupValue: sex,
                      activeColor: Colors.blue,
                    ),
                    Text(
                      'หญิง',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 52.5,
                  left: 40.0,
                  top: 15.0,
                ),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.water,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: TextField(
                        controller: weight_ctrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0.00',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'กิโลกรัม',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 40.0,
                  left: 40.0,
                  top: 15.0,
                ),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.rulerVertical,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: TextField(
                        controller: height_ctrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0.00',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'เซนติเมตร',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 90.0,
                  left: 40.0,
                  top: 15.0,
                ),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.heart,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: TextField(
                        controller: age_ctrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0.00',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'ปี',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 30.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          double bmrs = 0;
                          if (weight_ctrl.text.length == 0) {
                            showWarningDialog(
                                context, "น้ำหนักห้ามว่าง และห้ามเป็น 0");
                          } else if (height_ctrl.text.isEmpty) {
                            showWarningDialog(
                                context, "ส่วนสูงห้ามว่าง และห้ามเป็น 0");
                          } else if (age_ctrl.text.isEmpty) {
                            showWarningDialog(
                                context, "อายุห้ามว่าง และห้ามเป็น 0");
                          } else {
                            int? weight = int.parse(weight_ctrl.text);
                            int? height = int.parse(height_ctrl.text);
                            int? age = int.parse(age_ctrl.text);
                            if (sex == 1) {
                              bmrs = (66 +
                                  (13.7 * weight) +
                                  (5 * height) -
                                  (6.8 * age));
                            } else {
                              bmrs = (655 +
                                  (9.6 * weight) +
                                  (1.8 * height) -
                                  (4.7 * age));
                            }
                          }
                          setState(() {
                            //payPerMonth =
                            //calPayMoneyPerMonth.toStringAsFixed(2);
                            var fm = NumberFormat('#,###.00');
                            bmr = fm.format(bmrs);
                          });
                        },
                        child: Text(
                          'คำนวณ',
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.35,
                            50.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              15.0,
                            ),
                          ),
                          primary: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            bmr = '-???-';
                            weight_ctrl.text = '';
                            height_ctrl.text = '';
                            age_ctrl.text = '';
                          });
                        },
                        child: Text(
                          'ยกเลิก',
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.35,
                            50.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              15.0,
                            ),
                          ),
                          primary: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 5.0,
                width: MediaQuery.of(context).size.width - 80.0,
                color: Colors.grey,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'อัตราการเผาผลาญพลังงาน',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bmr,
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
