class UserModel {
  String? uid;
  String? uname;
  String? mnum;
  String? nic;
  String? email;

  UserModel({this.uid, this.uname, this.mnum, this.nic, this.email});

  //receiving data from server

  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        uname: map['uname'],
        mnum: map['mnum'],
        nic: map['nic'],
        email: map['email']);
  }

  //sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'uname': uname,
      'mnum': mnum,
      'nic': nic,
      'email': email
    };
  }
}
