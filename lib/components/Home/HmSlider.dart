import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/Home.dart';

class HmSlider extends StatefulWidget {
  final List<BannerImageItem> bannerList;

  const HmSlider({super.key, required this.bannerList});

  @override
  State<HmSlider> createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  CarouselSliderController carouselController = CarouselSliderController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_getBannerItems(), _getSearch(), _getDotsIndicator()],
    );

    // return Container(
    //   color: Colors.blue,
    //   height: 300,
    //   alignment: Alignment.center,
    //   child: Center(child: Text("轮播图", style: TextStyle(color: Colors.white))),
    // );
  }

  // 在 `_getBannerItems` 方法中优化网络图片处理：

  Widget _getDotsIndicator() {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (index) {
            return GestureDetector(
              onTap: () {
                carouselController.animateToPage(index);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: index == 0 ? 20 : 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      index == _currentIndex
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.5),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _getBannerItems() {
    return CarouselSlider(
      items: List.generate(widget.bannerList.length, (index) {
        return Image.network(
          widget.bannerList[index].image,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        );
      }),
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          _currentIndex = index;
          setState(() {});
        },
      ),
      carouselController: carouselController,
    );
  }

  Widget _getSearch() {
    return Positioned(
      left: 0,
      right: 0,
      top: 10,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: TextField(
          decoration: InputDecoration(
            hintText: "搜索...",
            filled: true,
            fillColor: Colors.white.withValues(alpha: 0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
              gapPadding: 10,
              // 添加填充边框
            ),
          ),
        ),
      ),
    );
  }
}
