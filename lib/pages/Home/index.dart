
import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/viewmodels/home.dart';



class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List<BannerImageItem> _bannerImages = [];
  List<CategoryItem> _categoryList = [];


  @override
  void initState() {
    super.initState();
    _getBannerItems();
    _getCategoryList();

  }


  List<Widget> _getSlivers() {
    return [
      SliverToBoxAdapter(child: HmSlider(bannerList:_bannerImages)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HmSuggestion()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(child: HmHot()),
            SizedBox(width: 10),
            Expanded(child: HmHot()),
          ],
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HmMoreList(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getSlivers());
  }

     _getBannerItems() async {
    _bannerImages=  await getBannerListAPI();

  }

  _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
  }
}
