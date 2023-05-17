import 'package:pos_van/modules/category/category_model.dart';

abstract class CategoryServiceInterface {
  Future<List<BestSellerModel>> fetchBestSellerItems();

  Future<List<CategoryNameModel>> fetchCategoryName();
}
