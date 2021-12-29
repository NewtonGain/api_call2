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
        listResponse= mapJsonData?["data"] as List;
        
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
    return MaterialApp(home: Scaffold(appBar: AppBar(title: const Text("API call"),
    ),
    body: Center(child: Container(child: Text('${listResponse?[5]["first_name"].toString()}'),)),
    ),
    );
  }
}