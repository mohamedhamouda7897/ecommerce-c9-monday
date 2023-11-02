// class ProductEntity {
//   ProductEntity({
//     this.data,
//   });
//
//   ProductEntity.fromJson(dynamic json) {
//     if (json['data'] != null) {
//       data = [];
//       json['data'].forEach((v) {
//         data?.add(Data.fromJson(v));
//       });
//     }
//   }
//   List<Data>? data;
// }
//
// class Data {
//   Data({
//     this.images,
//     this.title,
//     this.description,
//     this.price,
//     this.imageCover,
//     this.ratingsAverage,
//   });
//
//   Data.fromJson(dynamic json) {
//     images = json['images'] != null ? json['images'].cast<String>() : [];
//     id = json['_id'];
//     title = json['title'];
//     description = json['description'];
//     price = json['price'];
//     imageCover = json['imageCover'];
//     ratingsAverage = json['ratingsAverage'];
//     id = json['id'];
//   }
//   List<String>? images;
//   String? id;
//   String? title;
//   String? description;
//   int? price;
//   String? imageCover;
//   double? ratingsAverage;
// }
//
// class Brand {
//   Brand({
//     this.id,
//     this.name,
//     this.slug,
//     this.image,
//   });
//
//   Brand.fromJson(dynamic json) {
//     id = json['_id'];
//     name = json['name'];
//     slug = json['slug'];
//     image = json['image'];
//   }
//   String? id;
//   String? name;
//   String? slug;
//   String? image;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['_id'] = id;
//     map['name'] = name;
//     map['slug'] = slug;
//     map['image'] = image;
//     return map;
//   }
// }
