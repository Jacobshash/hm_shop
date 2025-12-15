import 'package:flutter/material.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/viewmodels/Home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List<BannerImageItem> _bannerImages = [];

  @override
  void initState() {
    super.initState();
    _bannerImages= _getBannerItems();
  }


  List<Widget> _getSlivers() {
    return [
      SliverToBoxAdapter(child: HmSlider(bannerList:_bannerImages)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HmCategory()),
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

  List<BannerImageItem> _getBannerItems() {
    return [
      BannerImageItem(
        image: "https://github.com/Jacobshash/picx-images-hosting/raw/master/20241130/20241130233034.39l810a000.webp",
        title: "Banner 1"
      ),
      BannerImageItem(
          image: "https://github.com/Jacobshash/picx-images-hosting/raw/master/20241130/20241130233037.lvrqngyo0.webp",
          title: "Banner 2"
      ),
      BannerImageItem(
          image: "https://github.com/Jacobshash/picx-images-hosting/raw/master/20241130/20241130233025.2a54nu78u7.webp",
          title: "Banner 3"
      ),
      BannerImageItem(
          image: "https://github.com/Jacobshash/picx-images-hosting/raw/master/20241130/20241130232801.pfdoda1dq.webp",
          title: "Banner 4"
      ),
      BannerImageItem(
          image: "https://github.com/Jacobshash/picx-images-hosting/raw/master/20241130/20241130232759.2obkepfjp7.webp",
          title: "Banner 5"
      ),
    ];

  }
}
