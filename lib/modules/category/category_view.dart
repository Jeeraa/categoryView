import 'package:flutter/material.dart';
import 'package:pos_van/constants/decorations/colors.dart';
import 'package:pos_van/constants/decorations/text_styles.dart';
import 'package:pos_van/modules/category/category_view_model.dart';
import '../../components/circular_icon_button_secondary.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final CategoryViewModel _viewModel = CategoryViewModel();
  late double height;
  late double width;
  late double bottomNavHeight;
  late double searchHeight;
  late double bestSellerHeight;
  late double categoryHeight;

  @override
  void initState() {
    super.initState();
    _viewModel.readCategoryName();
    _viewModel.readBestSellerItems();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    searchHeight = height * 0.08;
    bestSellerHeight = height * 0.33;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: kPrimaryDarkColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            "ค้นหาสินค้า",
            style: kHeaderTextStyle,
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: _body(),
        floatingActionButton: FittedBox(
          child: Stack(
            alignment: const Alignment(1.4, -1.5),
            children: [
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: kPrimaryLightColor,
                child: const Icon(Icons.shopping_cart_outlined),
              ),
              Container(
                constraints: const BoxConstraints(minHeight: 28, minWidth: 28),
                decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryLightColor),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: const Center(
                  child: Text(
                    '10',
                    style: TextStyle(
                      color: kPrimaryLightColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _body() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Column(
        children: [
          _searchSection(),
          _bestSellerHeader(),
          _bestSellerList(),
          _categoryHeader(),
          _categoryList(),
        ],
      ),
    );
  }

  SizedBox _searchSection() {
    final TextEditingController searchController = TextEditingController();
    final FocusNode searchFocusNode = FocusNode();
    return SizedBox(
      width: double.infinity,
      height: searchHeight,
      child: TextField(
        focusNode: searchFocusNode,
        controller: searchController,
        decoration: const InputDecoration(
          suffixIcon: Icon(Icons.search),
          hintText: 'ชื่อสินค้าหรือบาร์โค้ด',
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }

  Padding _bestSellerHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "สินค้าขายดี",
            style: kTitleTextStyle,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                textStyle: kSecondaryContentTextStyle,
                backgroundColor: kPrimaryLightColor,
                minimumSize: Size.zero,
                padding: const EdgeInsets.all(6),
              ),
              icon: const Icon(
                Icons.edit_rounded,
                size: 14,
              ),
              label: const Text("แก้ไข"),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  SizedBox _bestSellerList() {
    return SizedBox(
      height: height * 0.21,
      width: double.infinity,
      child: ListView.builder(
        itemCount: _viewModel.bestSellerItems.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          // print(_viewModel.bestSellerItems.length);
          final String skuId = _viewModel.bestSellerItems[index].skuId;

          return Container(
            key: ValueKey(skuId),
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: kCardBackgroundColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  blurRadius: 3,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _viewModel.bestSellerItems[index].aliasName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  _viewModel.bestSellerItems[index].barcode,
                  style: const TextStyle(
                    color: kFadedTextColor,
                    fontSize: 12,
                  ),
                ),
                Text(
                  '${_viewModel.bestSellerItems[index].price} บาท',
                  style: const TextStyle(
                    color: kPrimaryDarkColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'เหลือ: ${_viewModel.bestSellerItems[index].remainInStock} ชิ้น',
                  style: const TextStyle(
                    color: kRedTextColor,
                    fontSize: 12,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    children: [
                      CircularIconButtonSecondary(
                        icon: Icons.card_giftcard,
                        iconColor: kPrimaryLightColor,
                        onTapped: () async {},
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text(
                        'โปรโมชั่น',
                        style: TextStyle(
                          color: kPrimaryDarkColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Padding _categoryHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "หมวดหมู่สินค้า",
            style: kTitleTextStyle,
          ),
        ],
      ),
    );
  }

  SizedBox _categoryList() {
    return SizedBox(
      height: height * 0.42,
      width: double.infinity,
      child: ReorderableListView.builder(
          itemCount: _viewModel.categoryNames.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            // print(_viewModel.categoryNames.length);
            final String categoryName =
                _viewModel.categoryNames[index].categoryName;
            return Container(
              key: ValueKey(categoryName),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(bottom: 8),
              decoration: const BoxDecoration(
                color: kCardBackgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: ListTile(
                horizontalTitleGap: 0,
                minVerticalPadding: 0,
                visualDensity: const VisualDensity(vertical: -4),
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: Transform.scale(
                  scale: 2,
                  child: IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.drag_indicator,
                      size: 20,
                      color: Color.fromRGBO(217, 217, 217, 1),
                    ),
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      categoryName,
                      style: kHighLightBodyTextStyle,
                    ),
                  ],
                ),
                trailing: const Icon(
                  Icons.navigate_next,
                  size: 30,
                  color: kPrimaryLightColor,
                ),
                onTap: () {},
              ),
            );
          },
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex = newIndex - 1;
              }
              final element = _viewModel.categoryNames.removeAt(oldIndex);
              _viewModel.categoryNames.insert(newIndex, element);
            });
          }),
    );
  }
}
