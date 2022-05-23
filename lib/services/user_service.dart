import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myown/model/user_model.dart';


class UserService{
  String baseUrl = 'http://10.0.10.5:8080';

  Future<UserModel> addUser(
      {required String email,
      required String firstName,
      required String lastName,}) async {
    var url = '$baseUrl/users';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
    });

    // ignore: avoid_print
    print(jsonDecode(body));

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    // ignore: avoid_print
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user =  UserModel(id: data['id'], email: data['email'],firstName: data['first_name'],lastName: data['last_name'],avatar: 'udah punya default value');
     
      return user;
    } else {
      // ignore: avoid_print
      print("Gagal Post User");
      throw Exception("Gagal Post User");
    }
  }

  Future<List<UserModel>> getUsers() async{
    var url = "$baseUrl/users";
    var headers = {"Content-Type": "application/json"};

    var response = await http.get(Uri.parse(url), headers: headers);

    // ignore: avoid_print
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<UserModel> users = [];

      for (var user in data) {
        users.add(UserModel.fromJson(user));
      }

      return users;
    } else {
      throw Exception("Gagal get users");
    }

  }


}