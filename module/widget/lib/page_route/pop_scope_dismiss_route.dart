import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

MaterialPageRoute popScopeDismissRoute ({required Widget Function() child,required RouteSettings settings}){
  return MaterialPageRoute(
    settings: settings,
      builder: (_) => WillPopScope(
        onWillPop: (){
          if(EasyLoading.isShow){
            EasyLoading.dismiss();
            return Future.value(false);
          }
          return Future.value(true);
        },
          child: child.call()));
}