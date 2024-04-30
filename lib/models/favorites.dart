class TourismPlace {
  String id;
  String name;
  String informationAbout;
  String imgCover;

  TourismPlace({
    required this.id,
    required this.name,
    required this.informationAbout,
    required this.imgCover,
  });

  factory TourismPlace.fromJson(Map<String, dynamic> json) {
    return TourismPlace(
      id: json['_id'],
      name: json['name'],
      informationAbout: json['informationAbout'],
      imgCover: json['imgCover'],
    );
  }
}

class WishlistResponse {
  String msg;
  List<TourismPlace> wishListTourismPlace;

  WishlistResponse({
    required this.msg,
    required this.wishListTourismPlace,
  });

  factory WishlistResponse.fromJson(Map<String, dynamic> json) {
    return WishlistResponse(
      msg: json['msg'],
      wishListTourismPlace: List<TourismPlace>.from(json['wishListTourismPlace'].map((x) => TourismPlace.fromJson(x))),
    );
  }
}

