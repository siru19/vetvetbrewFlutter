List<MenuCategory> categoriesFromJson(List<dynamic> categoriesJson) =>
    List<MenuCategory>.from(
      categoriesJson.map(
        (categoryJson) => MenuCategory.fromJson(categoryJson),
      ),
    );

class MenuCategory {
  int? id;
  String? name;
  int? imageId;
  String? createdAt;
  String? updatedAt;
  // String? image;
  Image? image;

  MenuCategory(
      {this.id,
      this.name,
      this.imageId,
      this.createdAt,
      this.updatedAt,
      this.image});

  MenuCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageId = json['image_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
