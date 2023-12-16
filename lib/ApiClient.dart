import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class Apiclient{
  static const String api_Key = "AIzaSyAUbaB083S1JOn6RXT5NtqwROFySdgu6HsI";

  Future<Response>getPlaces(String place,double latitude,double longitude, double radius)async{
    String url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=$place&key=$api_Key&location=$latitude,$longitude&radius=$radius";
    Response response = await http.get(Uri.parse(url));
    return response;
  }
  Future<Response>getOthers(String company_ID) async
  {
    String url = "";
    Response response = await http.get(Uri.parse(url));
    return response;
  }
  Future<Response>isRegistered(String email) async{
    Response response = await http.post(Uri.parse("https://era.romarioburke.com/api/ifregisted"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, Object>{
          'Email': email,
        }));
    return response;
  }

}