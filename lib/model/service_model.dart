import 'apotek_model.dart';

class Service {
  String idApotek;
  String id;
  Apotek apotek;
  String name;
  String descrition;
  List<String> pictures;
  double price;

  Service();
  

  Service.fromSnapshot(Map<dynamic, dynamic> snapshot) {
    id = snapshot["id"];
    apotek = Apotek.fromSnapshot(snapshot["Apotek"]);
    name = snapshot["name"];
    descrition = snapshot["descrition"];
    pictures = snapshot["pictures"];
    price = snapshot["price"];
  }

  Map<String, dynamic> toJsonInsert() => {
        "Apotek": {
          "id": idApotek,
        },
        "name": name,
        "descrition": descrition,
        // "pictures": address,
        "price": price,
      };
}
