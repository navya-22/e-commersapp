class TrendingProductModel {
  String? sId;
  String? image;
  String? name;
  int? price;
  int? oldprice;
  String? offer;
  int? iV;

  TrendingProductModel(
      {this.sId,
        this.image,
        this.name,
        this.price,
        this.oldprice,
        this.offer,
        this.iV});

  TrendingProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    name = json['name'];
    price = json['price'];
    oldprice = json['oldprice'];
    offer = json['offer'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['name'] = this.name;
    data['price'] = this.price;
    data['oldprice'] = this.oldprice;
    data['offer'] = this.offer;
    data['__v'] = this.iV;
    return data;
  }
}
