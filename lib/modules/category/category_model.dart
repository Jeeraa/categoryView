class BestSellerModel {
  late String skuId;
  late String barcode;
  late String productName;
  late String aliasName;
  late double price;
  late int amount;
  late int remainInStock;
  late bool bestSeller;
  late String categoryId;
  late String promotionId;

  BestSellerModel({
    required this.skuId,
    required this.barcode,
    required this.productName,
    required this.aliasName,
    required this.price,
    required this.amount,
    required this.remainInStock,
    required this.bestSeller,
    required this.categoryId,
    required this.promotionId,
  });

  BestSellerModel.fromJson({required Map<String, dynamic> map}) {
    skuId = map['skuId'];
    barcode = map['barcode'];
    aliasName = map['aliasName'];
    price = map['price'];
    amount = 0;
    remainInStock = map['remainInStock'];
    bestSeller = map['bestSeller'];
  }

  bool tryIncreaseAmount() {
    if (amount < remainInStock) {
      amount++;
      return true;
    }

    return false;
  }

  void setAmount({required int amount}) {
    this.amount = amount;
  }

  bool isBestSellerItem() {
    if (bestSeller) {
      return true;
    }
    return false;
  }
}

class CategoryNameModel {
  late String categoryId;
  late String categoryName;
  late List<String> skuId;

  CategoryNameModel({
    required this.categoryId,
    required this.categoryName,
    required this.skuId,
  });

  CategoryNameModel.fromJson({required Map<String, dynamic> map}) {
    categoryId = map['categoryId'];
    categoryName = map['categoryName'];
    skuId = map['skuId'];
  }
}
