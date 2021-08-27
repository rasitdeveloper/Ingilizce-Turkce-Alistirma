import 'package:flutter/material.dart';

import 'Kelimeler.dart';
import 'kelimelerdetaysayfasi.dart';
import 'kelimelerdetaysayfasidao.dart';

class kelimelersayfasi extends StatefulWidget {
  @override
  _kelimelersayfasiState createState() => _kelimelersayfasiState();
}

class _kelimelersayfasiState extends State<kelimelersayfasi> {

  bool aramaYapiliyormu = false;
  String aramaKelimesi = "";


  Future<List<Kelimeler>> tumKelimeleriGoster() async {
    var kelimelerListesi = await kelimelerdetaysayfasidao().tumKelimeler();
    return kelimelerListesi;
  }

  Future<List<Kelimeler>> aramaYap(String aramaKelimesi) async {
    var kelimelerListesi = await kelimelerdetaysayfasidao().kelimeAra(aramaKelimesi);
    return kelimelerListesi;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyormu ?
            TextField(
              decoration: InputDecoration(hintText: "Arama için bir şey yazın"),
              onChanged: (aramaSonucu) {
                print("Arama sonucu = $aramaSonucu");
                setState(() {
                  aramaKelimesi = aramaSonucu;
                });
              },
            )
            : Text("kelimelersayfasi"),
        actions: [
          aramaYapiliyormu ?
          IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            setState(() {
              aramaYapiliyormu = false;
              aramaKelimesi = "";
            });
          },
          )
          : IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                aramaYapiliyormu = true;
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Kelimeler>>(
        future: aramaYapiliyormu ? aramaYap(aramaKelimesi) : tumKelimeleriGoster(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            var kelimelerListesi = snapshot.data;
            return ListView.builder(
              itemCount: kelimelerListesi!.length,
              itemBuilder: (context, indeks) {
                var kelime = kelimelerListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => kelimelerdetaysayfasi(kelime: kelime,)));
                  },
                  child: SizedBox(
                    height: 50,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(kelime.ingilizce, style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(kelime.turkce),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),

    );
  }
}
