import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stackmybiz/provider/provider_model.dart';

void showMessage(String? message, context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Consumer<ProviderModel>(builder: (context, model, child) {
          return AlertDialog(
            title: Text("Message"),
            content: (message == null)
                ? CircularProgressIndicator()
                : Text(message.toString()),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
      });
}
