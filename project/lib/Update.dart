import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './view.dart';
class Update extends StatefulWidget{
   String name,email,phone1,phone2,add1,add2,user_id;
  Update(this.name,this.email,this.phone1,this.phone2,this.add1,this.add2,this.user_id);

  @override
  State<StatefulWidget> createState() {
    return _updateState(name,email,phone1,phone2,add1,add2,user_id);
  }

}

class _updateState extends State<Update> {
   String pname,pemail,pphone1,pphone2,padd1,padd2,puser_id;
  _updateState(this.pname,this.pemail,this.pphone1,this.pphone2,this.padd1,this.padd2,this.puser_id);

  TextEditingController name= TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  TextEditingController phone1= TextEditingController();
  TextEditingController phone2= TextEditingController();
  TextEditingController add1= TextEditingController();
  TextEditingController add2= TextEditingController();







@override
  void initState() {
    // TODO: implement initState

  super.initState();
  name.text = pname;
  email.text = pemail;
  phone1.text = pphone1;
  phone2.text = pphone2;
  add1.text =padd1;
  add2.text = padd2;



}

Future<void> updatedata() async {

  if (name.text != "" ||
      email.text != "" ||
      phone1.text != "" ||
      phone2.text != "" ||
      add1.text != "" ||
      add2.text != "") {
    try {
      String uri ="http://192.168.1.7/project_api/updatedata.php";
      var res = await http.post(Uri.parse(uri), body: {

        'pname': name.text,
        'pemail': email.text,
        'pphone1': phone1.text,
        'pphone2': phone2.text,
        'padd1': add1.text,
        'padd2': add2.text,
        'user_id': puser_id,

      });

      var response = jsonDecode(res.body);

      if (response['success'] == 'true') {
        print('Record Updated Successfully');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => View()));
      } else {
        print('Failed update Record');
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
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text('Update Record'),
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
                  onPressed: (){
                    updatedata();
                  },
                  child: Text('Update'),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }


}