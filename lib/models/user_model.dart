class Profile {
  String? id;
  String? profilePic;
  String? firstName;
  String? lastName;
  String? city;
  String? email;

  Profile({
    this.id,
    this.profilePic,
    this.firstName,
    this.lastName,
    this.city,
    this.email
  });

  factory Profile.fromJson(Map<String, dynamic> jsonData) => Profile(
    id: jsonData['user']["_id"],
    profilePic: jsonData['user']["profileImg"],
      email: jsonData['user']["email"],
      firstName: jsonData['user']["firstName"],
      lastName: jsonData['user']["lastName"],
      city: jsonData['user']["city"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "profileImg": profilePic,
    "firstName": firstName,
    "lastName": lastName,
    "city": city,
    "email": email
  };

}
