
//产品列表项数据转换
class ProductItemModal{
  String desc;//产品描述
  String type;//产品类型
  String name;//产品名称
  String imageUrl;//产品图片路径
  String point;

  ProductItemModal({
    this.desc,
    this.type,
    this.name,
    this.imageUrl,
    this.point,
});

  factory ProductItemModal.fromJson(dynamic json){
    return ProductItemModal(
      desc: json['desc'],
      type: json['type'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      point: json['point'],
    );
  }

}

//产品列表数据转换
class ProductListModal{

  List<ProductItemModal> data;
  ProductListModal(this.data);

  factory ProductListModal.fromJson(List json){
    return ProductListModal(
      json.map((i) => ProductItemModal.fromJson((i))).toList()
    );
  }

}