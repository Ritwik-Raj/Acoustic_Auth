import "package:flutter/material.dart";
import "package:sonic_auth/navigation.dart";

class Submit extends StatelessWidget {
  final String name, email;

  const Submit({
    Key? key,
    this.name = "",
    this.email = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Confirm Credentials'),
        centerTitle: true,
      ),
      body: Container(
        height: 400,
        child: Card(
          margin: EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Name :',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Email :',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Navigation()));
                    },
                    child: const Text('Continue',
                        style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}