import 'package:eng_app/sinavlarsayfasi.dart';
import 'package:flutter/material.dart';

class sinavkayitsayfasi extends StatefulWidget {
  @override
  _sinavkayitsayfasiState createState() => _sinavkayitsayfasiState();
}

class _sinavkayitsayfasiState extends State<sinavkayitsayfasi> {

  var tfdersAdi = TextEditingController();
  var tfdogrusayisi = TextEditingController();
  var tfyanlissayisi = TextEditingController();
  var tfbilgiler = TextEditingController();

  Future<void> kayit(String ders_adi, int dogru_sayisi, int yanlis_sayisi, String bilgiler) async{
    print("$ders_adi - $dogru_sayisi - $yanlis_sayisi - $bilgiler kayit edildi");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => sinavlarsayfasi()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("sinavkayitsayfasi"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: tfdersAdi,
                  decoration: InputDecoration(hintText: "Ders Adi"),
                ),
                TextField(
                  controller: tfdogrusayisi,
                  decoration: InputDecoration(hintText: "Dogru Sayisi"),
                ),
                TextField(
                  controller: tfyanlissayisi,
                  decoration: InputDecoration(hintText: "Yanlis Sayisi"),
                ),
                TextField(
                  controller: tfbilgiler,
                  decoration: InputDecoration(hintText: "Bilgiler"),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          kayit(tfdersAdi.text, int.parse(tfdogrusayisi.text), int.parse(tfyanlissayisi.text), tfbilgiler.text);
        },
        tooltip: 'Not Kayıt',
        icon: Icon(Icons.save),
        label: Text("Kaydet"),
      ),
    );
  }
}
