import 'package:flutter/foundation.dart';

class messeges{
  String? messege;
  String? date;
  messeges.fromjson(data){
    messege=data['messeege'];
  }
}