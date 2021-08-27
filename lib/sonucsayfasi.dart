import 'package:flutter/material.dart';

class sonucsayfasi extends StatefulWidget {
  late int dogruSayisi;
  sonucsayfasi({required this.dogruSayisi});

  @override
  _sonucsayfasiState createState() => _sonucsayfasiState();
}

class _sonucsayfasiState extends State<sonucsayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sonucsayfasi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${widget.dogruSayisi} DOĞRU ${5-widget.dogruSayisi} YANLIŞ", style: TextStyle(fontSize: 18),),
            Text("% ${widget.dogruSayisi * 20} BAŞARI", style: TextStyle(fontSize: 30, color: Colors.pink),),
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                child: Text("Anasayfa"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
