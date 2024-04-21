import 'package:flutter/material.dart';
import 'package:sonic_auth/AudioSoAuth.dart';
import 'package:sonic_auth/totp.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text(
          'Welcome',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 10,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TotpAuthentication(),
                    ),
                  );
                },
                splashColor: Colors.lightBlueAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // Icon(
                      //   Icons.apartment,
                      //   size: 50.0,
                      // ),
                      Text(
                        "Time Based One Time Authentication (TOTP)",
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontSize: 17.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 10,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AudioSoAuth(),
                    ),
                  );
                },
                splashColor: Colors.lightBlueAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // Icon(
                      //   Icons.apartment,
                      //   size: 50.0,
                      // ),
                      Text(
                        "Sonic Authentication",
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontSize: 17.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}