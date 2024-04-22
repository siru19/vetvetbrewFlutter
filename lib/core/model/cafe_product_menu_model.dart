import 'item_model.dart';

List<CafeMenuSet> cafeMenuItemsFromJson(List<dynamic> cafemenusJson) =>
    List<CafeMenuSet>.from(
      cafemenusJson.map(
        (cafeMenuJson) => CafeMenuSet.fromJson(cafeMenuJson),
      ),
    );

class CafeMenuSet {
  int? id;
  String? name;
  int? imageId;
  String? createdAt;
  String? updatedAt;
  List<CafeItem>? products;
  // String? image;
  Image? image;

  CafeMenuSet(
      {this.id,
      this.name,
      this.imageId,
      this.createdAt,
      this.updatedAt,
      this.products,
      this.image});

  CafeMenuSet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageId = json['image_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['products'] != null) {
      products = <CafeItem>[];
      json['products'].forEach((v) {
        products!.add(new CafeItem.fromJson(v));
      });
    }
    // image = json['image'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_id'] = this.imageId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    // data['image'] = this.image;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class Image {
  int? id;
  String? fileTitle;
  String? fileName;
  String? createdAt;
  String? updatedAt;

  Image(
      {this.id, this.fileTitle, this.fileName, this.createdAt, this.updatedAt});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileTitle = json['file_title'];
    fileName = json['file_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['file_title'] = this.fileTitle;
    data['file_name'] = this.fileName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
