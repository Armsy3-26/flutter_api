import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'net.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _firstnamecontroller  =  TextEditingController();
  final TextEditingController _surnamecontroller  =  TextEditingController();
  final TextEditingController _email  =  TextEditingController();

  Future<User>?  _futureUser;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,

      children:  [
        const SizedBox(height: 15,),

        const Center(
          child: Text("Register", style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 26
          ),),
        ),
        const SizedBox(height: 10,),

        TextField(
          controller: _firstnamecontroller,
          decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          label: const Text("Firstname"),
        ),),
        const SizedBox(height: 10,),

        TextField(
          controller: _surnamecontroller,
            decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),),
          label: const Text("Surname"),
        )
        ),

        const SizedBox(height: 10,),


        TextField(
          controller: _email,
          decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),),
          label: const Text("email"),
        ),),
        const SizedBox(height: 15,),

        SizedBox(
          height: 29,
          width: 6,
          child: Row(
            children: [
              const SizedBox(width: 150,),
              TextButton(

                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.black)
                  ))
                ),
                  onPressed: () {
                  print("submitted");
                _futureUser = postUser(
                  _firstnamecontroller.text, _surnamecontroller.text, _email.text
                );
              }, child: const Text("Submit")),
            ],
          ),
        )
      ],
    );
  }
}
