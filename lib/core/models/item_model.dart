class ItemModel {
  late String itemName;
  late double itemPrice;
  late String itemImage;
  late double itemRating;
  late String itemGroup;
  late String itemBrand;
  late bool isRecommended;
  late bool isFavorite;
  ItemModel({
    required this.itemName,
    required this.itemGroup,
    required this.itemPrice,
    required this.itemImage,
    required this.itemRating,
    required this.itemBrand,
    required this.isRecommended,
    required this.isFavorite,
  });
  Map<String, dynamic> toMap() {
    {
      return {
        'itemName': itemName,
        'itemPrice': itemPrice,
        'itemGroup': itemGroup,
        'itemImage': itemImage,
        'itemRating': itemRating,
        'itemBrand': itemBrand,
        'isRecommended': isRecommended,
        'isFavorite': isFavorite,
      };
    }
  }

  ItemModel.fromMap(Map<String, dynamic> map) {
    itemPrice = map['itemPrice'];
    itemGroup = map['itemGroup'];
    itemName = map['itemName'];
    itemImage = map['itemImage'];
    itemRating = map['itemRating'];
    itemBrand = map['itemBrand'];
    isRecommended = map['isRecommended'];
    isFavorite = map['isFavorite'];
  }
}
