import 'package:flutter/material.dart';

class UserAccount {
  String email;
  /// This is used only for unit tests purposes.
  /// In app flow, this should always be ??? for
  /// security reasons.
  String password;
  UserAccount({@required this.email, this.password});
}