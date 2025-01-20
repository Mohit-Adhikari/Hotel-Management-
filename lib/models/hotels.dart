class Hotels {
  String name;
  String location;
  String imagePath;  
  String rating;
  

  Hotels(
      {required this.name,
      required this.location,
      required this.imagePath,
      required this.rating,
      });
  String get _name=>name;
  String get _location=>location;
  String get _imagePath=>imagePath;
  String get _rating=>rating;
}

