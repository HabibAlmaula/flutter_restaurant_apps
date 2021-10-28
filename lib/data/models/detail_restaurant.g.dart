// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailRestaurant _$DetailRestaurantFromJson(Map<String, dynamic> json) =>
    DetailRestaurant(
      error: json['error'] as bool,
      message: json['message'] as String,
      restaurant: ContentDetailRestaurant.fromJson(
          json['restaurant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailRestaurantToJson(DetailRestaurant instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'restaurant': instance.restaurant,
    };

ContentDetailRestaurant _$ContentDetailRestaurantFromJson(
        Map<String, dynamic> json) =>
    ContentDetailRestaurant(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      city: json['city'] as String,
      address: json['address'] as String,
      pictureId: json['pictureId'] as String,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      menus: json['menus'] == null
          ? null
          : Menus.fromJson(json['menus'] as Map<String, dynamic>),
      rating: json['rating'],
      customerReviews: (json['customerReviews'] as List<dynamic>?)
          ?.map((e) => CustomerReview.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContentDetailRestaurantToJson(
        ContentDetailRestaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'city': instance.city,
      'address': instance.address,
      'pictureId': instance.pictureId,
      'categories': instance.categories,
      'menus': instance.menus,
      'rating': instance.rating,
      'customerReviews': instance.customerReviews,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      name: json['name'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'name': instance.name,
    };

CustomerReview _$CustomerReviewFromJson(Map<String, dynamic> json) =>
    CustomerReview(
      name: json['name'] as String,
      review: json['review'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$CustomerReviewToJson(CustomerReview instance) =>
    <String, dynamic>{
      'name': instance.name,
      'review': instance.review,
      'date': instance.date,
    };

Menus _$MenusFromJson(Map<String, dynamic> json) => Menus(
      foods: (json['foods'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      drinks: (json['drinks'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenusToJson(Menus instance) => <String, dynamic>{
      'foods': instance.foods,
      'drinks': instance.drinks,
    };
