class CategoryResultResponseModel {
  int? status;
  String? message;
  List<Data>? data;

  CategoryResultResponseModel({this.status, this.message, this.data});

  CategoryResultResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? foodId;
  String? foodName;
  String? rating;
  String? foodDescription;
  String? foodImage;
  double? foodPrice;
  String? currency;

  Data(
      {this.foodId,
      this.foodName,
      this.rating,
      this.foodDescription,
      this.foodImage,
      this.foodPrice,
      this.currency});

  Data.fromJson(Map<String, dynamic> json) {
    foodId = json['FoodId'];
    foodName = json['FoodName'];
    rating = json['Rating'];
    foodDescription = json['FoodDescription'];
    foodImage = json['FoodImage'];
    foodPrice = json['FoodPrice'];
    currency = json['Currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FoodId'] = foodId;
    data['FoodName'] = foodName;
    data['Rating'] = rating;
    data['FoodDescription'] = foodDescription;
    data['FoodImage'] = foodImage;
    data['FoodPrice'] = foodPrice;
    data['Currency'] = currency;
    return data;
  }
}
