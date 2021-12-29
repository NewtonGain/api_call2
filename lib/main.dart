import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
void main()=>runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);
  

  @override
  _MyappState createState() => _MyappState();
}
var stringData;
Map? mapResponse;
Map? mapJsonData;
List? listResponse;

class _MyappState extends State<MyApp> {
  fetchData() async {
    http.Response response;
    response =await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode==200){
      mapResponse=jsonDecode(response.body);
      setState(() {
        mapJsonData=mapResponse;
        listResponse= mapJsonData?["data"] ;
        
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar
      (title: const Text("API call"),
    
    ),
   body: ListView.builder(itemCount: listResponse?.length,itemBuilder: (context,index){
     return Container(child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         children: [Image.network(listResponse?[index]["avatar"]),
         Text(listResponse![index]["id"].toString()),
         Text(listResponse?[index]["first_name"]),
         Text(listResponse?[index]["last_name"]),
         Text(listResponse?[index]["email"]),
         
         ],
       ),
     ),
     
     );
   }),
    ),
    );
  }
}