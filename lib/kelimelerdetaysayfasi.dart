import 'package:eng_app/Kelimeler.dart';
import 'package:flutter/material.dart';

class kelimelerdetaysayfasi extends StatefulWidget {
  late Kelimeler kelime;
  kelimelerdetaysayfasi({required this.kelime});
  @override
  _kelimelerdetaysayfasiState createState() => _kelimelerdetaysayfasiState();
}

class _kelimelerdetaysayfasiState extends State<kelimelerdetaysayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("kelimelerdetaysayfasi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(widget.kelime.ingilizce, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.pink),),
                Text(widget.kelime.ingilizce, style: TextStyle(fontSize: 40),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
