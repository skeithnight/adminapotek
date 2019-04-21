import 'service_model.dart';
import 'apotek_model.dart';

class Obat extends Service {
  Obat();
  Obat.fromSnapshot(Map<dynamic, dynamic> snapshot) {
    id = snapshot["id"];
    apotek = Apotek.fromSnapshot(snapshot["Apotek"]);
    name = snapshot["name"];
    descrition = snapshot["descrition"];
    pictures = snapshot["pictures"];
    price = snapshot["price"];
  }
}
