import 'package:pos_van/modules/category/category_model.dart';
import 'package:pos_van/services/category_services/category_mock_service.dart';
import 'package:pos_van/services/category_services/category_service_interface.dart';

class CategoryViewModel {
  List<BestSellerModel> bestSellerItems = [];
  List<CategoryNameModel> categoryNames = [];
  CategoryServiceInterface service = CategoryMockService();

  Future<void> readCategoryName() async {
    categoryNames = await service.fetchCategoryName();
  }

  Future<void> readBestSellerItems() async {
    bestSellerItems = await service.fetchBestSellerItems();
  }

  Future<bool> onUserTappedBestSellerCard(
      {required BestSellerModel item}) async {
    bool adjustAmountResult = item.tryIncreaseAmount();
    return adjustAmountResult;
  }

  Future<void> onUserTappedGiftPromotionButton({
    required String sku,
  }) async {}

  Future<void> onUserTappedSearchButton() async {}

  Future<void> onUserTappedCategoryNameCard() async {}

  Future<void> onUserTappedCartButton() async {}
}
