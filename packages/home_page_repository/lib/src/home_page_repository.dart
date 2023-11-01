

import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'model/model.dart';
import 'package:http/http.dart';
class HomePageRepository {
  final String endPoint = "https://reqres.in/api/";

  Future<List<UserModel>>  getUser() async{
    Response response = await get(Uri.parse("${endPoint}users?page=2"));
    if(response.statusCode ==200){
      final userFromJson=jsonDecode(response.body)["data"];
      final list=userFromJson.map<UserModel>((dynamic i)=>UserModel.fromJson(i)).toList();
          return Future.value(list);
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
  Future <UserModel> getUserDetails() async{
    Response response=await get(Uri.parse("${endPoint}users/2"));
    if(response.statusCode==200){
      final userFromJson=UserModel.fromJson(jsonDecode(response.body)["data"]);
      return Future.value(userFromJson);
    }
    else{
      throw Exception(response.reasonPhrase);
    }
  }
}
final homePageProvider = Provider<HomePageRepository>((ref)=> HomePageRepository());
