class productModel {
  String? sId;
  String? image;
  String? name;
  String? details;
  int? price;
  int? rate;
  int? iV;

  productModel(
      {this.sId,
        this.image,
        this.name,
        this.details,
        this.price,
        this.rate,
        this.iV});

  productModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    name = json['name'];
    details = json['details'];
    price = json['price'] is int ? json['price'] : int.tryParse(json['price'].toString()) ?? 0;
    rate = json['rate'] is int ? json['rate'] : int.tryParse(json['rate'].toString()) ?? 0;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['name'] = this.name;
    data['details'] = this.details;
    data['price'] = this.price;
    data['rate'] = this.rate;
    data['__v'] = this.iV;
    return data;
  }
}







