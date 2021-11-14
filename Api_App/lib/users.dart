import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/net.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot){
        if(snapshot.hasData) {
          List<User>? data  = snapshot.data;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: data!.length,
              itemBuilder: (BuildContext context, index){

              return Column(
                children: [
                  Text(data[index].firstname.toString() + " " + data[index].surname.toString()),
                  const SizedBox(height: 10,),
                  //Text(data[index].email.toString())

                ],
              );
              });
        }else if(snapshot.hasError){
          return Text("${snapshot.error}");

        }
        return const CircularProgressIndicator();
        }
        );
  }
}
