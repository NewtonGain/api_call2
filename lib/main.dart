import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
void main()=>runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);
  

  @override
  _MyappState createState() => _MyappState();
}

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
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar
      (title: const Text("API call"),
      centerTitle: true,
      backgroundColor: Colors.teal,
    
    ),
    backgroundColor: Colors.teal,
    drawer: Drawer(backgroundColor: Colors.green[100],
    elevation: 5.0,
    child: ListView(
      children: [
        const DrawerHeader(decoration: BoxDecoration(gradient: LinearGradient(
          begin: Alignment.bottomLeft,end: Alignment.topRight,
          colors: [Colors.greenAccent,Colors.lightGreen],
          ),
          ),
          child: Text('Drawer Header'),
          ),
          ListTile(leading: const Icon(Icons.person,size: 40,color: Colors.lightGreen),
          title: const Text('person'),
          onTap: (){},
          ),
          ListTile(leading: const Icon(Icons.person,size: 40,color: Colors.lightGreen),
          title: const Text('person'),
          onTap: (){},
          ),
          ListTile(leading: const Icon(Icons.person,size: 40,color: Colors.lightGreen),
          title: const Text('person'),
          onTap: (){},
          ),
      ],
    ),
    ),
   body: ListView.builder(
     itemCount: listResponse?.length,itemBuilder: (context,index){
     return  Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         children: [Image.network(listResponse?[index]["avatar"],),
         Text(listResponse![index]["id"].toString()),
         Text(listResponse?[index]["first_name"]),
         Text(listResponse?[index]["last_name"]),
         Text(listResponse?[index]["email"]),
         
         ],
       ),
     );
   }),
    ),
    );
  }
}