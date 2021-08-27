import 'package:eng_app/kelimelersayfasi.dart';
import 'package:eng_app/sinavlarsayfasi.dart';
import 'package:eng_app/testsayfasi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text("Kelime Araştır"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => kelimelersayfasi()));
                },
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text("Test Yap"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => testsayfasi()));
                },
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text("Sınav Gör & Kaydet"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => sinavlarsayfasi()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
