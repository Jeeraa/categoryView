import 'package:pos_van/modules/category/category_model.dart';
import 'package:pos_van/services/category_services/category_service_interface.dart';

class CategoryMockService implements CategoryServiceInterface {
  @override
  Future<List<BestSellerModel>> fetchBestSellerItems() async {
    return [
      BestSellerModel(
        skuId: '1111111111',
        barcode: '88293749285',
        productName: 'ช้างงงงงงง',
        aliasName: 'ช้างเล็ก ยกลัง',
        price: double.parse('793.50'),
        amount: 1,
        remainInStock: int.parse('6') * 2,
        bestSeller: true,
        categoryId: '1',
        promotionId: '2',
      ),
      BestSellerModel(
        skuId: '1111111111',
        barcode: '837649507466',
        productName: 'ช้างงงงงงง',
        aliasName: 'ช้างใหญ่ ยกลัง',
        price: double.parse('674.50'),
        amount: 1,
        remainInStock: int.parse('10') * 2,
        bestSeller: true,
        categoryId: '1',
        promotionId: '2',
      ),
      BestSellerModel(
        skuId: '1111111111',
        barcode: '0368802744628',
        productName: 'ช้างงงงงงง',
        aliasName: 'ช้างขวดเล็ก',
        price: double.parse('77.50'),
        amount: 1,
        remainInStock: int.parse('2') * 2,
        bestSeller: true,
        categoryId: '1',
        promotionId: '2',
      ),
      BestSellerModel(
        skuId: '1111111111',
        barcode: '837629562048',
        productName: 'ช้างงงงงงง',
        aliasName: 'ช้างขวดใหญ่',
        price: double.parse('80.50'),
        amount: 1,
        remainInStock: int.parse('6') * 2,
        bestSeller: true,
        categoryId: '1',
        promotionId: '2',
      ),
      BestSellerModel(
        skuId: '1111111111',
        barcode: '0368802744628',
        productName: 'ช้างงงงงงง',
        aliasName: 'ช้างกระป๋องเล็ก',
        price: double.parse('47.50'),
        amount: 1,
        remainInStock: int.parse('15') * 2,
        bestSeller: true,
        categoryId: '1',
        promotionId: '2',
      ),
      BestSellerModel(
        skuId: '1111111111',
        barcode: '0368802744628',
        productName: 'ช้างงงงงงง',
        aliasName: 'ช้างกระป๋องใหญ่',
        price: double.parse('87.50'),
        amount: 1,
        remainInStock: int.parse('10') * 2,
        bestSeller: true,
        categoryId: '1',
        promotionId: '2',
      ),
    ];
  }

  @override
  Future<List<CategoryNameModel>> fetchCategoryName() async {
    return [
      CategoryNameModel(
        categoryId: '1',
        categoryName: 'เครื่องดื่มแอลกอฮอล์',
        skuId: ['1', '5', '3', '8'],
      ),
      CategoryNameModel(
        categoryId: '2',
        categoryName: 'เครื่องดื่มเพื่อสุขภาพ',
        skuId: ['1', '5', '3', '8'],
      ),
      CategoryNameModel(
        categoryId: '3',
        categoryName: 'น้ำอัดลม',
        skuId: ['1', '5', '3', '8'],
      ),
      CategoryNameModel(
        categoryId: '4',
        categoryName: 'นม',
        skuId: ['1', '5', '3', '8'],
      ),
      CategoryNameModel(
        categoryId: '5',
        categoryName: 'น้ำดื่ม',
        skuId: ['1', '5', '3', '8'],
      ),
      CategoryNameModel(
        categoryId: '6',
        categoryName: 'อาหารว่าง',
        skuId: ['1', '5', '3', '8'],
      ),
      CategoryNameModel(
        categoryId: '7',
        categoryName: 'อาหารสำเร็จรูป',
        skuId: ['1', '5', '3', '8'],
      ),
      CategoryNameModel(
        categoryId: '8',
        categoryName: 'ขนมและลูกอม',
        skuId: ['1', '5', '3', '8'],
      ),
      CategoryNameModel(
        categoryId: '9',
        categoryName: 'ไอศกรีม',
        skuId: ['1', '5', '3', '8'],
      ),
      CategoryNameModel(
        categoryId: '10',
        categoryName: 'อาหารสด',
        skuId: ['1', '5', '3', '8'],
      ),
    ];
  }
}
