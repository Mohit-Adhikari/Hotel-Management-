class Hotels {
  String uid;
  String name;
  String location;
  String imagePath;
  String rating;

  Hotels({
    required this.uid,
    required this.name,
    required this.location,
    required this.imagePath,
    required this.rating,
  });
  String get _uid => uid;
  String get _name => name;
  String get _location => location;
  String get _imagePath => imagePath;
  String get _rating => rating;
}
