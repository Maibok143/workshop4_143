import 'package:flutter/material.dart';
import '../models/foodmenu.dart';
import 'addform.dart';

// ข้อ 12-14: หน้ารายการอาหาร + ปุ่มเพิ่มข้อมูล (Routing ด้วย Navigator.push)
class Item extends StatefulWidget {
  const Item({super.key});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  // สีพื้นหลังแยกตามชนิดอาหาร
  Color typeColor(FoodType type) {
    switch (type) {
      case FoodType.ttype1: // ต้ม
        return Colors.redAccent.shade100;
      case FoodType.ttype2: // ผัด
        return Colors.amberAccent;
      case FoodType.ttype3: // ทอด
        return Colors.yellow.shade300;
      case FoodType.ttype4: // ย่าง
        return Colors.orange.shade300;
      case FoodType.ttype5: // สุขภาพ
        return Colors.lightGreenAccent.shade100;
      case FoodType.ttype6: // ของหวาน
        return Colors.pink.shade100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ข้อ 12: ครอบ ListView ด้วย Expanded เพื่อแบ่งพื้นที่ให้ปุ่มด้านล่าง
        Expanded(
          child: ListView.builder(
            itemCount: emp.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: typeColor(emp[index].foodType),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            emp[index].name,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            emp[index].component,
                            style: const TextStyle(fontSize: 13),
                          ),
                          Text(
                            "ประเภทอาหาร : ${emp[index].foodType.ty}",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "ราคา : ${emp[index].price} บาท",
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      emp[index].foodpic.image,
                      width: 100,
                      height: 100,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.fastfood,
                            size: 90, color: Colors.orange);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        // ข้อ 13-14: ปุ่มเรียกหน้าเพิ่มข้อมูล
        SizedBox(
          width: 100,
          height: 80,
          child: IconButton(
            icon: const Icon(
              Icons.add,
              size: 40,
              color: Colors.orange,
            ),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddForm()),
              );
              // กลับมาจากหน้าฟอร์มแล้ว สั่งให้วาดหน้าจอใหม่เพื่อแสดงข้อมูลล่าสุด
              if (!mounted) return;
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}