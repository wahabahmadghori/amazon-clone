import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signUpUser(
      {required String email,
      required String password,
      required String name,
      required BuildContext context}) async {
    User user = User(
      id: '',
      address: '',
      email: email,
      password: password,
      name: name,
      type: '',
    );

    http.Response res = await http.post(
      Uri.parse('$url/api/sign-up'),
      body: user.toJson(),
      headers: {'Content-Type': 'application/json'},
    );
    print(res.statusCode);
    try {
      httpErrorHandle(
          response: res,
          onSuccess: () => {
                showSnackBar(
                    title: 'Account has been created!', context: context)
              },
          context: context);
    } catch (e) {
      print(e.toString());
    }
  }
}
