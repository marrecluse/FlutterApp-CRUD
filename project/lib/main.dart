import 'dart:convert';

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import './view.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}
class _HomeState extends State<Home>{


  TextEditingController name= TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  TextEditingController phone1= TextEditingController();
  TextEditingController phone2= TextEditingController();
  TextEditingController add1= TextEditingController();
  TextEditingController add2= TextEditingController();



  Future<void> insertrecord() async {
    if (name.text != "" ||
        email.text != "" ||
        password.text != "" ||
        phone1.text != "" ||
        phone2.text != "" ||
        add1.text != "" ||
        add2.text != "") {
      try {
        String uri ="http://192.168.1.7/project_api/insertdata.php";
        var res = await http.post(Uri.parse(uri), body: {
          'pname': name.text,
          'pemail': email.text,
          'ppassword': password.text,
          'pphone1': phone1.text,
          'pphone2': phone2.text,
          'padd1': add1.text,
          'padd2': add2.text,
        });

        var response = jsonDecode(res.body);

        if (response['success'] == 'true') {
          print('Record Inserted Successfully');
          name.text = "";
          email.text = "";
          password.text = "";
          phone1.text = "";
          phone2.text = "";
          add1.text = "";
          add2.text = "";
        } else {
          print('Failed Insert Record');
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Please fill all fields");
    }
  }





 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Dashboard'),
     ),
     body: SingleChildScrollView(
       child: Container(
         padding: EdgeInsets.all(10),
         child: Column(
           children: [

             TextFormField(
               controller: name,
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 label: Text('Name'),
               ),
             ),

             SizedBox(
               height: 10,
             ),


             TextFormField(
               controller: email,
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 label: Text('Email'),
               ),
             ),

             SizedBox(
               height: 10,
             ),

             TextFormField(
               controller: password,
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 label: Text('Password'),
               ),
             ),

             SizedBox(
               height: 10,
             ),

             TextFormField(
               controller: phone1,
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 label: Text('Phone1'),
               ),
             ),

             SizedBox(
               height: 10,
             ),


             TextFormField(
               controller: phone2,
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 label: Text('Phone2'),
               ),
             ),

             SizedBox(
               height: 10,
             ),


             TextFormField(
               controller: add1,
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 label: Text('Address1'),
               ),
             ),

             SizedBox(
               height: 10,
             ),

             TextFormField(
               controller: add2,
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 label: Text('Address2'),
               ),
             ),



             Container(
               child: ElevatedButton(
                 onPressed: insertrecord,
                 child: Text('Add'),
               ),
             ),

             Container(
               child: ElevatedButton(
                 onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>View()));

                 }, child: Text('View'),
               ),
             ),


           ],
         ),
       ),
     ),
   );
 }


}














