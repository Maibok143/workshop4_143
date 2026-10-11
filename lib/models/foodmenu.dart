// ข้อ 5: enum ชนิดอาหาร (ใช้ key.ty แสดงข้อความในตัวเลือก)
enum FoodType {
  ttype1(ty: "ต้ม"),
  ttype2(ty: "ผัด"),
  ttype3(ty: "ทอด"),
  ttype4(ty: "ย่าง"),
  ttype5(ty: "สุขภาพ"),
  ttype6(ty: "ของหวาน");

  const FoodType({required this.ty});
  final String ty;
}

// ข้อ 18: enum รูปภาพ เพิ่มชื่อรูป (namefood) ไว้แสดงใน Dropdown
enum Foodpic {
  menu1(namefood: "ไข่กระทะ", image: "assets/images/1.png"),
  menu2(namefood: "ชุดสลัดพร้อมเครื่องดื่ม", image: "assets/images/2.png"),
  menu3(namefood: "สเต็กเนื้อวากิว", image: "assets/images/3.png"),
  menu4(namefood: "ข้าวผัดปู", image: "assets/images/4.png"),
  menu5(namefood: "ต้มยำกุ้ง", image: "assets/images/5.png"),
  menu6(namefood: "ผัดไทยกุ้งสด", image: "assets/images/6.png"),
  menu7(namefood: "บิงซูสตรอเบอร์รี", image: "assets/images/7.png");

  const Foodpic({required this.namefood, required this.image});
  final String namefood;
  final String image;
}

class FoodMenu {
  FoodMenu({
    required this.name,
    required this.foodType,
    required this.component,
    required this.price,
    required this.foodpic,
  });
  String name;
  FoodType foodType;
  String component;
  int price;
  Foodpic foodpic;
}

// รายการอาหารตั้งต้น (ข้อมูลใหม่จากฟอร์มจะถูก add ต่อท้าย List นี้)
// หมายเหตุ: เก็บใน RAM เท่านั้น ปิดแอปแล้วข้อมูลที่เพิ่มจะหาย
List<FoodMenu> emp = [
  FoodMenu(
    name: "ไข่กระทะ",
    foodType: FoodType.ttype3,
    component: "ไข่ดาว, มะเขือเทศ, พริกหวาน, ผักสด",
    price: 99,
    foodpic: Foodpic.menu1,
  ),
  FoodMenu(
    name: "ชุดสลัดพร้อมเครื่องดื่ม",
    foodType: FoodType.ttype5,
    component: "ผักสลัด, มะเขือเทศ, แครอท, น้ำดื่ม",
    price: 159,
    foodpic: Foodpic.menu2,
  ),
  FoodMenu(
    name: "สเต็กเนื้อวากิว",
    foodType: FoodType.ttype4,
    component: "เนื้อวากิว, ผักสลัด, มะเขือเทศ",
    price: 389,
    foodpic: Foodpic.menu3,
  ),
  FoodMenu(
    name: "ข้าวผัดปู",
    foodType: FoodType.ttype2,
    component: "ข้าวสวย, เนื้อปู, แตงกวา, มะนาว",
    price: 120,
    foodpic: Foodpic.menu4,
  ),
  FoodMenu(
    name: "ต้มยำกุ้ง",
    foodType: FoodType.ttype1,
    component: "กุ้ง, เห็ด, ตะไคร้, พริก, ใบมะกรูด",
    price: 250,
    foodpic: Foodpic.menu5,
  ),
  FoodMenu(
    name: "ผัดไทยกุ้งสด",
    foodType: FoodType.ttype2,
    component: "เส้นจันท์, กุ้งสด, ถั่วลิสง, ถั่วงอก",
    price: 95,
    foodpic: Foodpic.menu6,
  ),
  FoodMenu(
    name: "บิงซูสตรอเบอร์รี",
    foodType: FoodType.ttype6,
    component: "น้ำแข็งใส, สตรอเบอร์รี, ซอสสตรอเบอร์รี",
    price: 129,
    foodpic: Foodpic.menu7,
  ),
];