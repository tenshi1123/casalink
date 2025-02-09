class CategoryModel {
  final String id;
  final String categoryName;
  CategoryModel({
    required this.id,
    required this.categoryName,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? json['category_id'] ?? '',
      categoryName: json['category_name'] ?? '',
    );
  }
}

class LibraryModel {
  final String img;
  final String id;
  final String linkDetail;
  LibraryModel({
    required this.img,
    required this.id,
    required this.linkDetail,
  });
  factory LibraryModel.fromJson(Map<String, dynamic> json) {
    return LibraryModel(
      img: json['img'] ?? '',
      id: json['id'] ?? '',
      linkDetail: json['link_detail'] ?? '',
    );
  }
}

class PostModel {
  final String id;
  final String postTitle;
  final String thumbnailUrl;
  final String link;
  PostModel({
    required this.id,
    required this.postTitle,
    required this.thumbnailUrl,
    required this.link,
  });
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['ID'] ?? '',
      postTitle: json['post_title'] ?? '',
      thumbnailUrl: json['thumbnail_url'] ?? '',
      link: json['link'] ?? '',
    );
  }
}
