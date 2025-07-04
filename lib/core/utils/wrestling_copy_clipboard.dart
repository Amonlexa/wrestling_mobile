import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wrestling_hub/core/constants/app_strings.dart';

class CopyClipBoard {


  void copy(String copy, String message) async {
    try{
      await Clipboard.setData(ClipboardData(text: copy));
      showToast(message);
    }catch(e) {
      showToast("${AppStrings.errorUnknown}${e.toString()}");
    }
  }

  void showToast(String msg) {
    Fluttertoast.showToast(msg: msg);
  }

}