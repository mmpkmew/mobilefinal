import 'dart:async';
import 'dart:convert';
import 'dart:io';

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
    runApp(new Todo());
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
  final String title;
  final String completed;

  Post({this.id, this.title, this.completed});

  factory Post.fromJson(Map json) {
    return Post(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}

// void main() => runApp(MyApp(post: fetchPost()));

class Todo extends StatelessWidget {
  final int id;
  // In the constructor, require a Todo
  Todo({Key key, @required this.id }) : super(key: key);
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
    API2.getUsers().then((response) {
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
          title: Text("Todo"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return new Card(
              child: InkWell(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("eiei"),
                  // Text((users[index].id).toString()),
                  Text(users[index].title),
                  Text(users[index].completed),
                ],
              ),
              onTap: () {
        
              }
              )
            );
          }
    )
        );
  }
}