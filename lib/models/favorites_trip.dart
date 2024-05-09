class Trips {
  String id;
  String name;
  String informationAbout;
  String imgCover;
  final List<String> images;

  Trips({
    required this.id,
    required this.name,
    required this.informationAbout,
    required this.imgCover,
    required this.images,
  });

  factory Trips.fromJson(Map<String, dynamic> json) {
    return Trips(
      id: json['_id'],
      name: json['title'],
      informationAbout: json['description'],
      imgCover: json['imgCover'],
      images: List<String>.from(json['images']),
    );
  }
}

class WishlistResponseTrip {
  String msg;
  List<Trips> wishListTrip;

  WishlistResponseTrip({
    required this.msg,
    required this.wishListTrip,
  });

  factory WishlistResponseTrip.fromJson(Map<String, dynamic> json) {
    return WishlistResponseTrip(
      msg: json['msg'],
      wishListTrip: List<Trips>.from(json['wishListTrip'].map((x) => Trips.fromJson(x))),
    );
  }
}