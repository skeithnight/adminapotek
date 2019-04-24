class Customer {
  String id;
  String email;
  String password;
  String name;
  String jk;
  int ttl;
  String noTelp;

  Customer();

  Customer.fromSnapshot(Map<dynamic, dynamic> snapshot)
      : id = snapshot["id"],
        email = snapshot["email"],
        noTelp = snapshot["noTelp"],
        jk = snapshot["jk"],
        ttl = snapshot["ttl"],
        name = snapshot["name"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "noTelp": noTelp,
        "jk": jk,
        "ttl": ttl,
        // "enabled": enabled,
      };
  Map<String, dynamic> toJsonLogin() => {
        "username": email,
        "password": password,
      };
}
