// Some quick models for demo purposes
class Product {
  int id;
  String description;
  String ref;
  double price;

  Product({
    required this.id,
    required this.description,
    required this.ref,
    required this.price,
  });
}

class Line {
  double? rebate;
  Product product;
  int? count;
  LineTypes type;
  Line({
    required this.product,
    required this.type,
    this.rebate,
    this.count,
  });
}

enum LineTypes {
  Sale,
  Refund
}