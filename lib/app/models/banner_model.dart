class BannerModel {
  final String? route;
  final String? banner;

  BannerModel({
    this.route,
    this.banner,
  });

  BannerModel.fromJson(Map<String, dynamic> json)
      : route = json['route'] as String?,
        banner = json['banner'] as String?;

  Map<String, dynamic> toJson() => {'route': route, 'banner': banner};
}
