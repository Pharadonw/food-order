class FoodItem {
  final String name;
  final double price;
  final String description;
  bool isSelected;

  FoodItem({
    required this.name,
    required this.price,
    required this.description,
    this.isSelected = false,
  });
}

final List<FoodItem> foodMenu = [
  FoodItem(
    name: "Pad Thai",
    price: 50.0,
    description: "Stir-fried rice noodles with shrimp and peanuts",
  ),
  FoodItem(
    name: "Som Tum",
    price: 40.0,
    description: "Spicy green papaya salad",
  ),
  FoodItem(
    name: "Green Curry",
    price: 60.0,
    description: "Thai green curry with chicken and coconut milk",
  ),
  FoodItem(
    name: "Tom Yum Goong",
    price: 80.0,
    description: "Hot and sour soup with shrimp",
  ),
  FoodItem(
    name: "Mango Sticky Rice",
    price: 70.0,
    description: "Sweet sticky rice with fresh mango and coconut cream",
  ),
];
