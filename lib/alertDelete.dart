import 'package:flutter/material.dart';

enum DialogsAction { yes, cancel }

class AlertDialogs {
  static Future<DialogsAction> yesorCancel(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text(title),
            content: Text(body),
            actions: <Widget>[
              TextButton(
                  onPressed: () =>
                      Navigator.of(context).pop(DialogsAction.cancel),
                  child: Text(
                    'Cancel',
                  )),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(DialogsAction.yes),
                  child: Text(
                    'Confirm',
                  ))
            ],
          );
        });
    return (action != null) ? action : DialogsAction.cancel;
  }
}
