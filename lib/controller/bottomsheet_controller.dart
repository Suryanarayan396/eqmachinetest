import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomsheetController with ChangeNotifier {
  int selectedcolorindex = 0;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  List<TextEditingController> addressControllers = [
    TextEditingController(),
  ];

  void addAddressController() {
    //new adressfeild adding
    addressControllers.add(
      TextEditingController(),
    );
    notifyListeners();
  }

  void removeAddressController(int index) {
    //removing added adressfeild
    if (index < addressControllers.length) {
      addressControllers[index].dispose();
      addressControllers.removeAt(index);
      notifyListeners();
    }
  }
}
