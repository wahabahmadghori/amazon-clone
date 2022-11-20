import 'dart:convert';

import 'package:amazon_clone/constants/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle(
    {required http.Response response,
    required VoidCallback onSuccess,
    required BuildContext context}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(title: jsonDecode(response.body)['msg'], context: context);
      break;
    case 500:
      showSnackBar(title: jsonDecode(response.body)['err'], context: context);
      break;
    default:
      showSnackBar(context: context, title: response.body);
  }
}
