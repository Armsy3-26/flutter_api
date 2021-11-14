import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class User {

  final String? firstname;
  final String? surname;
  final String? email;

  User({this.firstname, this.surname, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstname: json['firstname'],
      surname: json['surname'],
      email: json['email'],
    );

  }
Map toMap() {
    var map = {};

    map['firstname'] = firstname;
    map['surname'] = surname;
    map['email'] = email;

    return map;
}
}

Future<User>  postUser(String firstname, String surname, String email) async{
  final response  =  await http.post(Uri.parse("http://10.0.2.2:5000//vbnet/register.php"),
  headers: <String, String>{
    "Content-Type": 'application/json; charset=UTF-8',

  },
    body: json.encode(<String, String>{
      'firstname': firstname,
      'surname': surname,
      'email': email,
    }),

  );

  if(response.statusCode == 201) {

    final jsonResponse  =  json.decode(response.body);

    return User.fromJson(jsonResponse[0]);
  }else

    {
      throw Exception(".....");
    }

}

///fetching the data
Future<List<User>> getUsers() async {

  final response   =  await http.get(Uri.parse("http://10.0.2.2:5000//vbnet/register.php"),
  headers:  {
    "Content-Type": 'application/json; charset-UTF-8'
  });

  if(response.statusCode == 200 ) {

    List jsonResponse  =  json.decode(response.body);

    return jsonResponse.map((data) => User.fromJson(data)).toList();
  }else {

    throw Exception("We can't fetch info know need for troubleshooting!");
  }

}

//delete a user

Future<User>  delete() async {

  final response   =  await http.get(Uri.parse("http://10.0.2.2:5000//vbnet/register.php"),
  headers:  {
    'Content-Type': 'application/json; charset-UTF-8'
  });

  if(response.statusCode == 200) {
    return json.decode(response.body);
  }else {
    throw Exception("Bad Request or so");
  }
}

//update user

Future<User>  updateUser(String firstname, String surname, String email) async {

  final response   =  await http.post(Uri.parse("http://127.0.0.1:5000/"),
  headers:  {
    'Content-Type': 'application/json'
  },
    body: json.encode({
      'firstname': firstname,
      'surname': surname,
      'email': email,
    })
  );

  if(response.statusCode == 200 ){
    return json.decode(response.body);
  }else {
    throw Exception("Something terrible took place");
  }
}
