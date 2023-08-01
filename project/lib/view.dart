import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import './Update.dart';

class View extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ViewState();
  }

}

class _ViewState extends State<View>{
 List userdata = [];



 Future<void> viewdata() async {

   String uri ="http://192.168.1.7/project_api/view.php";

   try {
     var response = await http.get(Uri.parse(uri));
     setState(() {
       List decodedData = jsonDecode(response.body);
       userdata.clear();
       userdata.addAll(decodedData);
     });
   } catch (e) {
     print(e);
   }

 }

 Future<void> deluser(String id) async {
   String uri ="http://192.168.1.7/project_api/delete.php";
   try {
     var response = await http.post(Uri.parse(uri), body: {
       'user_id': id
     });
     var res = jsonDecode(response.body);

     if (res['success'] == 'true') {
       print('record deleted successfully');
       viewdata();
     } else {
       print('delete error');
     }
   } catch (e) {
     print(e);
   }


 }







 @override
 void initState() {
   // TODO: implement initState
   viewdata();
   super.initState();
 }






  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('View Record'),
      ),
      body: ListView.builder(
        itemCount: userdata.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>Update(
    userdata[index]['name'],
    userdata[index]['email'],
    userdata[index]['phone1'],
    userdata[index]['phone2'],
    userdata[index]['add1'],
    userdata[index]['add2'],
    userdata[index]['user_id'],



  )));
          },
              child: Card(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Row(
              children: [
              Text(userdata[index]['name']),
              Text(userdata[index]['email']),

              ],
              ),

              Row(
              children: [
              Text(userdata[index]['phone1']),
              Text(userdata[index]['phone2']),
                  ],

                ),

                Row(
                    children: [
                      Text(userdata[index]['add1']),
                      Text(userdata[index]['add2']),
                    ],

                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){
                        deluser(userdata[index]['user_id']);
                    }, icon: Icon(Icons.delete))
                  ],
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}