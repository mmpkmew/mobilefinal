import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
      }
      
    }
    
    class LoginState extends State<Login> {
       TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
     @override
      Widget build(BuildContext context) {

        final emailField = TextField(
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "User Id",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );
        final passwordField = TextField(
          obscureText: true,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );
        final loginButon = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            // padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
              Navigator.pushNamed(context,'/home');
            },
            child: Text("Login",
                textAlign: TextAlign.center,
                // style: style.copyWith(
                //     color: Colors.white, fontWeight: FontWeight.bold)
                ),
          ),
        );

        return Scaffold(
          body: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.network(
                        "https://scontent.fbkk2-8.fna.fbcdn.net/v/t1.0-9/59965130_10156409570507965_9204739510947020800_n.jpg?_nc_cat=105&_nc_ht=scontent.fbkk2-8.fna&oh=3b82adbc4234162791a0c93219a77d3e&oe=5D535567",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                    FlatButton(
                      child: SizedBox(
                        child: Text(
                          'Register New Account',
                          textAlign: TextAlign.right,
                          style:  TextStyle(color: Colors.green.withOpacity(0.8)),
                        ),
                      ),
                        onPressed: (){
                          print("click register new account");
                          Navigator.pushNamed(context, "/register");
                        },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }