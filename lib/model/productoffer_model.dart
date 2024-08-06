class ProductOfferModel {
  String? sId;
  String? image;
  String? name;
  String? details;
  int? price;
  int? oldprice;
  String? offer;
  String? rate;
  int? iV;

  ProductOfferModel(
      {this.sId,
        this.image,
        this.name,
        this.details,
        this.price,
        this.oldprice,
        this.offer,
        this.rate,
        this.iV});

  ProductOfferModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    name = json['name'];
    details = json['details'];
    price = json['price'];
    oldprice = json['oldprice'];
    offer = json['offer'];
    rate = json['rate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['name'] = this.name;
    data['details'] = this.details;
    data['price'] = this.price;
    data['oldprice'] = this.oldprice;
    data['offer'] = this.offer;
    data['rate'] = this.rate;
    data['__v'] = this.iV;
    return data;
  }
}
