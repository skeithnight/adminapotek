import 'package:flutter/material.dart';

class DialogWidget {
  BuildContext context;
  bool dismiss = false;
  DialogWidget({this.context, this.dismiss});
  void tampilDialog(String tittle, String message, dynamic route) {
    showDialog(
      barrierDismissible: dismiss,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(tittle),
          content: new Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                if (tittle == "Failed") {
                  Navigator.of(context).pop();
                } else if (tittle == "Success") {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: ((context) => route)));
                }
              },
            ),
          ],
        );
      },
    );
  }
}

// showDialog(
//               barrierDismissible: false,
//               context: context,
//               child: new CupertinoAlertDialog(
//                 title: new Column(
//                   children: <Widget>[
//                     new Text("GridView"),
//                     new Icon(
//                       Icons.favorite,
//                       color: Colors.green,
//                     ),
//                   ],
//                 ),
//                 content: new Text("Selected Item $index"),
//                 actions: <Widget>[
//                   new FlatButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: new Text("OK"))
//                 ],
//               ),
//             );