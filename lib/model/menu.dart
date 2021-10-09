class FoodItem {
  int id;
  String name;
  int price;
  String image;

  FoodItem(this.id, this.name, this.price, this.image);
  @override
  String toString() {
    var out ="ชื่อเมนู : $name\nราคา : $price บาท";
    return out;
  }
}