import 'package:ecommerce_c9_monday/features/home/domain/entities/CategoryAndBrandEntity.dart';

class CategoryAndBrandModel extends CategoryAndBrandEntity {
  CategoryAndBrandModel({
    this.results,
    this.metadata,
    super.data,
  });

  CategoryAndBrandModel.fromJson(dynamic json) {
    results = json['results'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  int? results;
  Metadata? metadata;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Data extends DataEntity {
  Data({
    super.id,
    super.name,
    this.slug,
    super.image,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? slug;

  String? createdAt;
  String? updatedAt;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Metadata {
  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  int? currentPage;
  int? numberOfPages;
  int? limit;
}
