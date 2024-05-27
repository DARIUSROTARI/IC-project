typedef Type = String;
typedef Category = String;
typedef Quantity = String;
typedef Essences = String;

class Parfum {
  final int id;
  final Type type;
  final Category category;
  final Quantity quantity;
  final List<Essences> essences;
  final double price;

  Parfum({
    required this.id,
    required this.type,
    required this.category,
    required this.quantity,
    required this.essences,
    required this.price,
  });

  factory Parfum.fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    final quantity = json['quantity'];
    final Map<Type, double> typePrices = {
      "EAU_DE_PARFUM": 10.0,
      "EXTRAIT_DE_PARFUM": 15.0,
    };

    final Map<Quantity, double> quantityPrices = {
      "ML_30": 10.0,
      "ML_50": 15.0,
      "ML_80": 20.0,
      "ML_100": 25.0,
      "ML_125": 30.0,
    };

    final typePrice = typePrices[type] ?? 0.0;
    final quantityPrice = quantityPrices[quantity] ?? 0.0;

    final price = typePrice + quantityPrice;

    return Parfum(
      id: json['id'],
      type: type,
      category: json['category'],
      quantity: quantity,
      essences: List<String>.from(json['parfumEssences']),
      price: price,
    );
  }
}
