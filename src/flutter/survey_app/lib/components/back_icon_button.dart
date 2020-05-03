import 'package:flutter/material.dart';

IconButton backIconButton(context) {
  return new IconButton(
    icon: Icon(Icons.arrow_back_ios),
    onPressed: () {
      Navigator.popUntil(
          context,
          ModalRoute.withName('/')
      );
    },
  );
}