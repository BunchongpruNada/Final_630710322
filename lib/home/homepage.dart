import 'package:flutter/material.dart';

class ReportForm extends StatefulWidget {
  @override
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  TextEditingController urlController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  String? selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Webby Fondue',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 237, 54, 115),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [SizedBox(height: 20.0),
            Text(
              'ต้องกรอกข้อมูล',
              style: TextStyle(fontSize: 16.0),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextField(
                controller: urlController,
                decoration: InputDecoration(
                  hintText: 'URL*',
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 16.0),
                maxLines: 1,
                minLines: 1,
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextField(
                controller: detailsController,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: 'รายละเอียด',
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 16.0),
                minLines: 1,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'ระบุประเภทเว็บเลว*',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedType = 'เว็บพนัน';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: selectedType == 'เว็บพนัน'
                        ? Colors.grey
                        : Colors.white,
                  ),
                  child: Text('เว็บพนัน\nการพนัน แทงบอล และอื่นๆ'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedType = 'ประเภทที่ 2';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: selectedType == 'ประเภทที่ 2'
                        ? Colors.grey
                        : Colors.white,
                  ),
                  child: Text('เว็บปลอมแปลง\nหลอกให้กรอกข้อมูลส่วนตัว/รหัสผ่าน'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedType = 'ประเภทที่ 3';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: selectedType == 'ประเภทที่ 3'
                        ? Colors.grey
                        : Colors.white,
                  ),
                  child: Text('เว็บข่าวมั่ว \n Fake news, ข้อมูลที่ทำให้เข้าใจผิด'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedType = 'ประเภทที่ 4';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: selectedType == 'ประเภทที่ 4'
                        ? Colors.grey
                        : Colors.white,
                  ),
                  child: Text('เว็บแชร์ลูกโซ่ \n หลอกให้ลงทุน'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // ทำสิ่งที่คุณต้องการเมื่อผู้ใช้กดปุ่ม
                String url = urlController.text;
                String details = detailsController.text;
                // ตรวจสอบว่า URL และรายละเอียดไม่ว่าง และประเภทถูกเลือก
                if (url.isNotEmpty &&
                    details.isNotEmpty &&
                    selectedType != null) {
                  // ส่งข้อมูลไปยัง API หรือทำสิ่งที่ต้องการด้วยข้อมูลที่ได้รับ
                  print('URL: $url');
                  print('Details: $details');
                  print('Selected Type: $selectedType');
                } else {
                  // แสดงข้อความแจ้งเตือนถ้ามีข้อมูลที่ขาดหายไป
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text(
                            'Please fill in both URL, details, and select a type.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
