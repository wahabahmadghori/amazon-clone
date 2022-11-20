import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showSnackBar({required String title, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(title),
    ),
  );
}
