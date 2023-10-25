class Diaryfood {
  String? message;
  int? foodId;
  String? foodShopname;
  String? foodImage;
  int? foodPay;
  int? foodMeal;
  String? foodDate;
  String? foodProvince;

  Diaryfood(
      {this.message,
      this.foodId,
      this.foodShopname,
      this.foodImage,
      this.foodPay,
      this.foodMeal,
      this.foodDate,
      this.foodProvince});

  Diaryfood.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    foodId = json['foodId'];
    foodShopname = json['foodShopname'];
    foodImage = json['foodImage'];
    foodPay = json['foodPay'];
    foodMeal = json['foodMeal'];
    foodDate = json['foodDate'];
    foodProvince = json['foodProvince'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['foodId'] = this.foodId;
    data['foodShopname'] = this.foodShopname;
    data['foodImage'] = this.foodImage;
    data['foodPay'] = this.foodPay;
    data['foodMeal'] = this.foodMeal;
    data['foodDate'] = this.foodDate;
    data['foodProvince'] = this.foodProvince;
    return data;
  }
}