import 'service_model.dart';
import 'apotek_model.dart';
import 'customer_model.dart';
import 'detail_transaksi_model.dart';

class Order {
  String id;
  Customer customer;
  Apotek apotek;
  String address;
  double latitude;
  double longitude;
  List<DetailTransaksi> groomings;
  List<DetailTransaksi> clinics;
  List<DetailTransaksi> hotels;
  int from;
  int to;
  String note;
  String status;

  Order();

  Order.fromSnapshot(
      Map<dynamic, dynamic> snapshot,
      List<DetailTransaksi> groomings,
      List<DetailTransaksi> clinics,
      List<DetailTransaksi> hotels)
      : id = snapshot["id"],
        customer = snapshot["customer"] == null
            ? null
            : Customer.fromSnapshot(snapshot["customer"]),
        apotek = snapshot["Apotek"] == null
            ? null
            : Apotek.fromSnapshot(snapshot["Apotek"]),
        address = snapshot["address"],
        latitude = snapshot["latitude"],
        longitude = snapshot["longitude"],
        this.groomings = groomings,
        this.clinics = clinics,
        this.hotels = hotels,
        from = snapshot["from"],
        to = snapshot["to"],
        note = snapshot["note"],
        status = snapshot["status"];
  Map<String, dynamic> toJsonChangeStatus(
          String idCourier, String statusEdit) =>
      {
        "id": id,
        "customer": {"id": customer.id},
        "Apotek": {"id": apotek.id},
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "from": from,
        "to": to,
        "note": note,
        "status": statusEdit,
      };
}
