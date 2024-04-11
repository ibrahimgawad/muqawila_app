import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDataContractorRegister {
  final String? location;
  final num? total;
  final String? image;
  final String? nameOrder;


  UserDataContractorRegister({
    this.location,
    this.total,
    this.image,
    this.nameOrder,

  });
}


class UserDataProviderContractorRegister extends ChangeNotifier {
  List<UserDataContractorRegister> _usersData = [];

  List<UserDataContractorRegister> get usersData => _usersData;

  void addUser(UserDataContractorRegister userData) {
    _usersData.add(userData);
    notifyListeners();
  }


   void removeUser(UserDataContractorRegister userData) {
    _usersData.remove(userData);
    notifyListeners();
  }
}
