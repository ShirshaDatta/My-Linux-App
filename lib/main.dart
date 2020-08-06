import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main()
{
 runApp(MyApp()) ;
}

String x;
class MyApp extends StatelessWidget {
  web(cmd) async {
    print(cmd);
    var url = "http://192.168.99.101/cgi-bin/$cmd.py";
    var r = await http.get(url);
    print(r.body);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('my input app'),
          ),
          body: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              width: 400,
              height:400,
              color: Colors.amber,
              child: Column(
                children: <Widget>[
                  Card(
                    child: TextField(onChanged: (val){
                      print(val);
                      x=val;
                    },
                      //autofocus: ,
                      cursorColor: Colors.red,
                       
                    ),
                  ),
                  Card(
                    child: FlatButton(
                      onPressed: () {
                        web(x); 
                      },
                      child: Text('click me to submit'),
                      ),
                      
                  )
                    
                  
                ],
              ),
            ),
          ),
      ),
      
    );
  }
}