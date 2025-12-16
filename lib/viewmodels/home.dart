

class BannerImageItem{
  String id;
  String imgUrl;
  BannerImageItem({required this.id,required this.imgUrl});

  // 扩展一个工厂函数 一般用factory来声明 一般用来创建实例对象
  factory BannerImageItem.formJSON(Map<String, dynamic> json) {
    // 必须返回一个BannerItem对象
    return BannerImageItem(id: json["id"] ?? "", imgUrl: json["imgUrl"] ?? "");
  }
}


class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
  });
  // 扩展一个工厂函数 一般用factory来声明 一般用来创建实例对象
  factory CategoryItem.formJSON(Map<String, dynamic> json) {
    // 必须返回一个CategoryItem对象
    return CategoryItem(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      picture: json["picture"] ?? "",
      children: json["children"] == null
          ? null
          : (json["children"] as List)
          .map(
            (item) => CategoryItem.formJSON(item as Map<String, dynamic>),
      )
          .toList(),
    );
  }
}
