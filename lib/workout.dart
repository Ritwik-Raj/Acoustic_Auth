import "package:flutter/material.dart";
import './submit.dart';

class Workout extends StatefulWidget {
  @override
  _WorkoutState createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  late String name, email, rep, pmg, smg;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Create Account'),
            centerTitle: true,
          ),
          body: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Scaffold(
                body: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(hintText: 'Name'),
                      style: TextStyle(color: Colors.black),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    TextField(
                      decoration:
                      InputDecoration(hintText: 'Email'),
                      style: TextStyle(color: Colors.black),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    ElevatedButton(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        //String name, sets, rep, pmg, smg;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Submit(
                              name: name,
                              email: email,
                              key: null,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}