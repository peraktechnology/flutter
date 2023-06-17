const String collectionCategory='Categories';

const String categoryFieldId='categoryId';
const String categoryFieldName='categoryName';
const String categoryFieldProductCount='productCount';


class CategoryModel{

  String? categoryId;
  String categoryName;
  num productCount;

  CategoryModel({
    this.categoryId,
    required this.categoryName,
     this.productCount=0,
  });

  Map<String,dynamic>toMap(){
    return <String,dynamic>{
      categoryFieldId:categoryId,
      categoryFieldName:categoryName,
      categoryFieldProductCount:productCount,
    };
  }

  factory CategoryModel.fromMap(Map<String,dynamic>map)=>CategoryModel(
    categoryId: map[categoryFieldId],
    categoryName: map[categoryFieldName],
    productCount: map[categoryFieldProductCount],
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModel &&
          runtimeType == other.runtimeType &&
          categoryId == other.categoryId;

  @override
  int get hashCode => categoryId.hashCode;
}