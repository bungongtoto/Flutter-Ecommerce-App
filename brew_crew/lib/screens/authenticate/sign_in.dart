import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';


class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({super.key,required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading  = false;

  // text fields

  String email = '';
  String password = '';
  String error = '';
  
  @override
  Widget build(BuildContext context) {
    return loading ?const Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title:const Text('Sign in to Brew Crew'),
        actions: <Widget>[
          TextButton.icon(
            icon: const Icon(Icons.person),
            label: const Text('Register'),
            onPressed: (){
              widget.toggleView();
            },
          ),

        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator:(val) => val!.isEmpty ? 'Enter an email' : null ,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              const SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator:(val) => val!.length < 6 ? 'Enter a password 6+ chars long' : null ,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              const SizedBox(height: 20.0,),
              ElevatedButton(
                onPressed: () async {
                 if (_formkey.currentState!.validate()){
                  setState(() {
                    loading = true;
                  });
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null){
                      setState(() {
                        error = 'could sign with those credentials';
                        loading = false;
                      });
                    }
                  }
                }, 
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color?>(Colors.pink[400]),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 12.0,),
              Text(
                error,
                style: const TextStyle(color: Colors.red,fontSize: 14.0 ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}