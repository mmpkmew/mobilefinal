import 'package:flutter/material.dart';

    
  class RegistForm extends StatefulWidget {
  @override
  RegistFormState createState() {
    return RegistFormState();
  }
}


class RegistFormState extends State<RegistForm> {

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final _id = TextEditingController();
    final name = TextEditingController();
    final age = TextEditingController();
    final pass = TextEditingController();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: Text("Register"), centerTitle: true),
        body: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(50.0),
            children: <Widget>[
              TextFormField(
                controller: _id,
                decoration: InputDecoration(
                    hintText: 'User Id',
                    prefixIcon: Icon(Icons.person)
                    ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please fill out this form";
                  } else if (value.length < 6 || value.length > 12) {
                    return "Please fill UserId Correctly";
                  // } else if (this.isUserIn) {
                  //   return "This Username is taken";
                  // }
                  }
                }
                  ),
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                    hintText: 'Name',
                    prefixIcon: Icon(Icons.account_circle)),
              ),
              TextFormField(
                controller: age,
                decoration: InputDecoration(
                    hintText: 'Age',
                    prefixIcon: Icon(Icons.calendar_today)),
                obscureText: true,
              ),
              TextFormField(
                controller: pass,
                decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock)),
                obscureText: true,
              ),
              RaisedButton(
                onPressed: () {
                  if (_id.text.isEmpty || name.text.isEmpty || age.text.isEmpty || pass.text.isEmpty){
                    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("กรุณาระบุข้อมูลให้ครบถ้วน"))); 
                  }
                },
                child: Text('CONTINUE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  }