class User {
  String uid;
  String fName;
  String lName;
  String dOB;
  String photo_url;
  String photoID_url;
  String gesture;
  String validityFrom;
  String validityTo;
  bool keepData;

  User(
      {required this.uid,
      required this.fName,
      required this.lName,
      required this.dOB,
      required this.photo_url,
      required this.photoID_url,
      required this.gesture,
      required this.validityFrom,
      required this.validityTo,
      required this.keepData});
}
