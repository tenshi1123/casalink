import 'package:dio/dio.dart';

import '../models/category_model.dart';
import '../utils/constants/api_path.dart';

class CategoryRepo {
  Dio dio = Dio();

  //danh sách danh mục
  Future<List<CategoryModel>> getCategories() async {
    Response response;
    response = await dio.get(
      ApiPath.category,
    );
    List<CategoryModel> result = ((response.data)['data'] as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
    return result;
  }

  //Thư viện tài liệuliệu
  Future<List<LibraryModel>> getLibrary(String id) async {
    Response response;
    response = await dio.get(
      ApiPath.library,
      queryParameters: {
        'category_id': id,
      },
    );
    List<LibraryModel> result = ((response.data)['data'] as List)
        .map((e) => LibraryModel.fromJson(e))
        .toList();
    return result;
  }

  //Danh mục bảng tin
  Future<List<CategoryModel>> getPostCaties() async {
    Response response;
    response = await dio.get(
      ApiPath.postCategory,
    );
    List<CategoryModel> result = ((response.data)['data'] as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
    return result;
  }

  //Chi tiết bài viết
  Future<List<PostModel>> getPostCategory(String id) async {
    Response response;
    response = await dio.get(
      ApiPath.detailPost,
      queryParameters: {
        'category_id': id,
      },
    );
    List<PostModel> result = ((response.data)['data'] as List)
        .map((e) => PostModel.fromJson(e))
        .toList();
    return result;
  }
}
