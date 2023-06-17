class CategoryButton {
  String categoryName;
  String imagePath;
  bool isSelected;
  CategoryButton(
      {required this.categoryName,
      required this.imagePath,
      required this.isSelected});
}

class Place {
  String placeName;
  String imagePath;
  String location;
  String desc;
  double rating;
  bool isLiked;
  String price;
  Place(
      {required this.placeName,
      required this.imagePath,
      required this.location,
      required this.desc,
      required this.rating,
      required this.isLiked,
      required this.price});
}

class Package {
  String packageName;
  String price;
  String imagePath;
  String desc;
  double rating;
  bool isLiked;
  Package(
      {required this.packageName,
      required this.price,
      required this.imagePath,
      required this.desc,
      required this.rating,
      required this.isLiked});
}
