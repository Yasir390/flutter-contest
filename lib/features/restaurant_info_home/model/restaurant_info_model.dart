class RestaurantInfoResponseModel {
  int? status;
  String? message;
  Data? data;

  RestaurantInfoResponseModel({this.status, this.message, this.data});

  RestaurantInfoResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? profileImageUrl;
  String? averageDeliveryTime;
  String? averageRating;
  String? totalRating;
  int? minOrderAmount;
  String? currency;
  String? deliveryMode;
  String? distance;

  Data(
      {this.name,
        this.profileImageUrl,
        this.averageDeliveryTime,
        this.averageRating,
        this.totalRating,
        this.minOrderAmount,
        this.currency,
        this.deliveryMode,
        this.distance});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    profileImageUrl = json['ProfileImageUrl'];
    averageDeliveryTime = json['AverageDeliveryTime'];
    averageRating = json['AverageRating'];
    totalRating = json['TotalRating'];
    minOrderAmount = json['MinOrderAmount'];
    currency = json['Currency'];
    deliveryMode = json['DeliveryMode'];
    distance = json['Distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['ProfileImageUrl'] = this.profileImageUrl;
    data['AverageDeliveryTime'] = this.averageDeliveryTime;
    data['AverageRating'] = this.averageRating;
    data['TotalRating'] = this.totalRating;
    data['MinOrderAmount'] = this.minOrderAmount;
    data['Currency'] = this.currency;
    data['DeliveryMode'] = this.deliveryMode;
    data['Distance'] = this.distance;
    return data;
  }
}
