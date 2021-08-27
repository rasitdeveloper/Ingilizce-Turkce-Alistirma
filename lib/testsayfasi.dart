import 'dart:collection';

import 'package:eng_app/Kelimeler.dart';
import 'package:eng_app/Kelimelerdao.dart';
import 'package:eng_app/sonucsayfasi.dart';
import 'package:flutter/material.dart';

class testsayfasi extends StatefulWidget {
  @override
  _testsayfasiState createState() => _testsayfasiState();
}

class _testsayfasiState extends State<testsayfasi> {

  var sorular = <Kelimeler>[];
  var yanlisSecenekler = <Kelimeler>[];
  late Kelimeler dogruSoru;
  var tumSecenekler = HashSet<Kelimeler>();

  int soruSayac = 0;
  int dogruSayac = 0;
  int yanlisSayac = 0;

  String soruyazi = "";
  String buttonAyazi = "";
  String buttonByazi = "";
  String buttonCyazi = "";
  String buttonDyazi = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sorulariAl();

  }

  Future<void> sorulariAl() async {
    sorular = await Kelimelerdao().rastgele5Getir();
    soruYukle();
  }

  Future<void> soruYukle() async {
    dogruSoru = sorular[soruSayac];
    soruyazi = dogruSoru.ingilizce;
    yanlisSecenekler = await Kelimelerdao().rastgele3YanlisGetir(dogruSoru.kelime_id);
    tumSecenekler.clear();
    tumSecenekler.add(dogruSoru);
    tumSecenekler.add(yanlisSecenekler[0]);
    tumSecenekler.add(yanlisSecenekler[1]);
    tumSecenekler.add(yanlisSecenekler[2]);

    buttonAyazi = tumSecenekler.elementAt(0).turkce;
    buttonByazi = tumSecenekler.elementAt(1).turkce;
    buttonCyazi = tumSecenekler.elementAt(2).turkce;
    buttonDyazi = tumSecenekler.elementAt(3).turkce;

    setState(() {

    });


  }


  void soruSayacKontrol() {
    soruSayac = soruSayac + 1;
    if(soruSayac != 5) {
      soruYukle();
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => sonucsayfasi(dogruSayisi: dogruSayac,)));
    }
  }

  void dogruKontrol(String buttonYazi) {
    if(dogruSoru.turkce == buttonYazi) {
      dogruSayac = dogruSayac + 1;
    } else {
      yanlisSayac = yanlisSayac + 1;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("testsayfasi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Dogru : $dogruSayac", style: TextStyle(fontSize: 18),),
                Text("Yanlış : $yanlisSayac", style: TextStyle(fontSize: 18),),
              ],
            ),
            soruSayac != 5 ? Text("${soruSayac + 1}. Soru", style: TextStyle(fontSize: 30),) :
            Text("5.Soru", style: TextStyle(fontSize: 30),),
            Text(soruyazi, style: TextStyle(fontSize: 42),),
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                child: Text(buttonAyazi),
                onPressed: () {
                  dogruKontrol(buttonAyazi);
                  soruSayacKontrol();
                },
              ),
            ),
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                child: Text(buttonByazi),
                onPressed: () {
                  dogruKontrol(buttonByazi);
                  soruSayacKontrol();
                },
              ),
            ),
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                child: Text(buttonCyazi),
                onPressed: () {
                  dogruKontrol(buttonCyazi);
                  soruSayacKontrol();
                },
              ),
            ),
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                child: Text(buttonDyazi),
                onPressed: () {
                  dogruKontrol(buttonDyazi);
                  soruSayacKontrol();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
