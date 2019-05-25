import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dd/todo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main(){
    HttpOverrides.global = new MyHttpOverrides();
    runApp(new Home());
}


Future<Post> fetchPost() async {
  var response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');
      

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {

  final int id;
  final String phone;
  final String name;
  final String email;
  final String website;

  Post({this.id, this.name, this.phone, this.email,this.website});

  factory Post.fromJson(Map json) {
    return Post(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      website: json['website']
      
      
    );
  }
}

// void main() => runApp(MyApp(post: fetchPost()));

class Home extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Http App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  var users = new List<Post>();

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => Post.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("User List"),
           leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed:() => Navigator.pop(context, false),
           )
        ),
        body: ListView.builder(
          
          itemCount: users.length,
          itemBuilder: (context, index) {
                              
            return new Card(
              child: InkWell(
                
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Text("${(users[index].id).toString()} : ${users[index].name}"),
                  Text(users[index].name),
                  Text(users[index].email),
                  Text(users[index].phone),
                  Text(users[index].website),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Todo(
                      id: users[index].id
                    ),
                  )
                );
              }
              )
            );
          }
    )
        );
  }
}