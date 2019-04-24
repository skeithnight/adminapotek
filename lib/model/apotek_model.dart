class Apotek {

  String id;
  String email;
  String staffName;
  String noIjin;
  String password;
  String name;
  String address;
  double latitude;
  double longitude;
  String jk;
  int ttl;
  String noTelp;
  bool enabled;

  Apotek();

  Apotek.fromSnapshot(Map<dynamic, dynamic> snapshot)
      : id = snapshot["id"],
        email = snapshot["email"],
        staffName = snapshot["staffName"],
        noIjin = snapshot["noIjin"],
        name = snapshot["name"],
        address = snapshot["address"],
        latitude = snapshot["latitude"],
        longitude = snapshot["longitude"],
        jk = snapshot["jk"],
        ttl = snapshot["ttl"],
        noTelp = snapshot["noTelp"],
        enabled = snapshot["enabled"];

  Map<String, dynamic> toJsonRegister() => {
        "noIjin": noIjin,
        "email": email,
        "staffName": staffName,
        "password": password,
        "name": name,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "jk": jk,
        "ttl": ttl,
        "noTelp": noTelp,
        "enabled": true,
      };
  Map<String, dynamic> toJsonLogin() => {
        "username": email,
        "password": password,
      };
}
