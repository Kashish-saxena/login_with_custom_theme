import 'dart:developer';

import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool passwordVisibility = true;

  void visible(bool visibility) {
    passwordVisibility = !visibility;
        log("$passwordVisibility");
    notifyListeners();

  }
  }
