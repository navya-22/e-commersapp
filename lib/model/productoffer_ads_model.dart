class ProductOfferAds {
  String? sId;
  String? image;
  String? offer;
  String? content;
  int? iV;

  ProductOfferAds({this.sId, this.image, this.offer, this.content, this.iV});

  ProductOfferAds.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    offer = json['offer'];
    content = json['content'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['offer'] = this.offer;
    data['content'] = this.content;
    data['__v'] = this.iV;
    return data;
  }
}
