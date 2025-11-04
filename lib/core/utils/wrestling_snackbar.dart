import 'package:flutter/material.dart';

class WrestlingSnackBar {

  void show(BuildContext context,String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message,style: Theme.of(context).textTheme.bodySmall,)));
  }

}