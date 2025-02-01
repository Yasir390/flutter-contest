class FoodDetailsResponseModel {
  int? status;
  String? message;
  Data? data;

  FoodDetailsResponseModel({this.status, this.message, this.data});

  FoodDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? foodId;
  String? foodName;
  String? foodImage;
  double? foodPrice;
  String? foodDescription;
  bool? isShowVariant;
  String? currency;

  Data(
      {this.foodId,
      this.foodName,
      this.foodImage,
      this.foodPrice,
      this.foodDescription,
      this.isShowVariant,
      this.currency});

  Data.fromJson(Map<String, dynamic> json) {
    foodId = json['FoodId'];
    foodName = json['FoodName'];
    foodImage = json['FoodImage'];
    foodPrice = json['FoodPrice'];
    foodDescription = json['FoodDescription'];
    isShowVariant = json['IsShowVariant'];
    currency = json['Currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FoodId'] = foodId;
    data['FoodName'] = foodName;
    data['FoodImage'] = foodImage;
    data['FoodPrice'] = foodPrice;
    data['FoodDescription'] = foodDescription;
    data['IsShowVariant'] = isShowVariant;
    data['Currency'] = currency;
    return data;
  }
}
