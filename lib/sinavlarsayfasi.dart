import 'package:eng_app/sinavdetaysayfasi.dart';
import 'package:eng_app/sinavkayitsayfasi.dart';
import 'package:eng_app/sinavlar.dart';
import 'package:flutter/material.dart';

class sinavlarsayfasi extends StatefulWidget {
  @override
  _sinavlarsayfasiState createState() => _sinavlarsayfasiState();
}

class _sinavlarsayfasiState extends State<sinavlarsayfasi> {

  Future<List<sinavlar>> tumNotlarGoster() async {
    var notlarListesi = <sinavlar>[];
    var n1 = sinavlar(1, "yds", 70, 10, "10 mart 2021");
    var n2 = sinavlar(2, "eilts", 90, 10, "15 mart 2021");
    var n3 = sinavlar(3, "yds", 75, 5, "20 mart 2021");
    notlarListesi.add(n1);
    notlarListesi.add(n2);
    notlarListesi.add(n3);
    return notlarListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Notlar Uygulamasi", style: TextStyle(color: Colors.white, fontSize: 16),),
            FutureBuilder <List<sinavlar>>(
              future: tumNotlarGoster(),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  var notlarListesi = snapshot.data;
                  double puan = 0.0;
                  if(!notlarListesi!.isEmpty) {
                    var sonuncu = notlarListesi.length;
                    puan = (notlarListesi[sonuncu - 1].dogru_sayisi * 1.25).toDouble();
                  }
                  return Text("Sonuncu Sınav Puanı = ${puan} ", style: TextStyle(color: Colors.white, fontSize: 16),);
                } else {
                  return Text("Sonuncu Sınav Puanı = ", style: TextStyle(color: Colors.white, fontSize: 16),);
                }
              }
            ),
          ],
        ),
      ),
      body: FutureBuilder <List<sinavlar>>(
        future: tumNotlarGoster(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            var notlarListesi = snapshot.data;
            return ListView.builder(
              itemCount: notlarListesi!.length,
              itemBuilder: (context,indeks) {
                var not = notlarListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => sinavdetaysayfasi(sinav: not,)));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(not.sinav_adi, style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(not.dogru_sayisi.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(not.yanlis_sayisi.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        Text(not.bilgiler, style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    )
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => sinavkayitsayfasi()));
        },
        tooltip: 'Not Ekle',
        child: Icon(Icons.add),
      ),
    );
  }
}
