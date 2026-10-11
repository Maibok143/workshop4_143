import 'package:flutter/material.dart';
import '../models/foodmenu.dart';

// ข้อ 1-10, 15, 17-19: ฟอร์มเพิ่มข้อมูลอาหาร
class AddForm extends StatefulWidget {
  const AddForm({super.key});

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  // ข้อ 6: State สำหรับเก็บค่าที่รับจากฟอร์ม
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _component = '';
  int _price = 0;
  FoodType _foodType = FoodType.ttype1;
  Foodpic _foodpic = Foodpic.menu1;

  // ล้างฟอร์ม และคืนค่า State ของ Dropdown กลับเป็นค่าเริ่มต้น
  void _resetForm() {
    _formKey.currentState!.reset();
    setState(() {
      _foodType = FoodType.ttype1;
      _foodpic = Foodpic.menu1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("เพิ่มข้อมูล"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          // ข้อสุดท้าย: ครอบด้วย SingleChildScrollView แก้ปัญหา Bottom Overflow ตอนเปิดคีย์บอร์ด
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                // ข้อ 3, 7: ชื่ออาหาร (ไม่เกิน 20 ตัวอักษร + Validator)
                TextFormField(
                  maxLength: 20,
                  decoration: const InputDecoration(
                    label: Text(
                      "ชื่ออาหาร",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณาป้อนชื่ออาหาร";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                // ข้อ 5-6: Dropdown ชนิดอาหาร (ดึงจาก enum FoodType)
                DropdownButtonFormField<FoodType>(
                  initialValue: FoodType.ttype1,
                  decoration: const InputDecoration(
                    label: Text(
                      "ชนิดอาหาร",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  items: FoodType.values.map((key) {
                    return DropdownMenuItem<FoodType>(
                      value: key,
                      child: Text(key.ty),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _foodType = value!;
                    });
                  },
                ),
                // ข้อ 17-19: Dropdown เลือกรูปภาพ (แสดงชื่อรูป + รูปขนาดเล็ก)
                DropdownButtonFormField<Foodpic>(
                  initialValue: Foodpic.menu1,
                  decoration: const InputDecoration(
                    label: Text(
                      "เลือกรูปภาพ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  items: Foodpic.values.map((pic) {
                    return DropdownMenuItem<Foodpic>(
                      value: pic,
                      child: Row(
                        children: [
                          Text(pic.namefood),
                          const SizedBox(width: 10),
                          Image.asset(
                            pic.image,
                            width: 30,
                            height: 30,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _foodpic = value!;
                    });
                  },
                ),
                // ข้อ 3, 7: ส่วนประกอบสำคัญ (ไม่เกิน 100 ตัวอักษร + Validator)
                TextFormField(
                  maxLength: 100,
                  decoration: const InputDecoration(
                    label: Text(
                      "ส่วนประกอบสำคัญ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณาป้อนส่วนประกอบสำคัญ";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _component = value!;
                  },
                ),
                // ข้อ 3, 6: ราคา (คีย์บอร์ดตัวเลข แปลงเป็น int ก่อนเก็บ)
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text(
                      "ราคา",
                      style: TextStyle(fontSize: 20),
                    ),
                    suffixText: "บาท",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณาป้อนราคา";
                    }
                    if (int.tryParse(value) == null) {
                      return "ราคาต้องเป็นตัวเลขเท่านั้น";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _price = int.parse(value.toString());
                  },
                ),
                // ข้อ 4: เว้นระยะ 20 ก่อนปุ่มบันทึก
                const SizedBox(
                  height: 20,
                ),
                // ข้อ 4, 8-10, 15: ปุ่มบันทึกสีน้ำเงิน
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton(
                    onPressed: () {
                      // ข้อ 8: ตรวจ Validator ก่อน ถ้าผ่านค่อยบันทึก
                      if (_formKey.currentState!.validate()) {
                        // ข้อ 9: บันทึกค่าจากฟอร์มลง State
                        _formKey.currentState!.save();
                        // ข้อ 10: เพิ่มข้อมูลใหม่ลง List emp
                        emp.add(FoodMenu(
                          name: _name,
                          component: _component,
                          price: _price,
                          foodpic: _foodpic,
                          foodType: _foodType,
                        ));
                        // ตรวจสอบจำนวนข้อมูลใน List (ดูที่ Debug Console)
                        print(emp.length);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('บันทึกสำเร็จ! $_name'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        _formKey.currentState!.reset();
                        // ข้อ 15: ย้อนกลับไปหน้ารายการอาหาร
                        Navigator.pop(context);
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      "บันทึก",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // ปุ่มรีเซ็ตฟอร์ม
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: _resetForm,
                    child: const Text("รีเซ็ต"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}