import 'package:eng_app/sinavlar.dart';
import 'package:eng_app/sinavlarsayfasi.dart';
import 'package:flutter/material.dart';

class sinavdetaysayfasi extends StatefulWidget {
  sinavlar sinav;
  sinavdetaysayfasi({required this.sinav});
  @override
  _sinavdetaysayfasiState createState() => _sinavdetaysayfasiState();
}

class _sinavdetaysayfasiState extends State<sinavdetaysayfasi> {

  var tfdersAdi = TextEditingController();
  var tfdogrusayisi = TextEditingController();
  var tfyanlissayisi = TextEditingController();
  var tfbilgiler = TextEditingController();

  Future<void> sil(int not_id) async{
    print("$not_id silindi");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => sinavlarsayfasi()));
  }

  Future<void> guncelle(int not_id, String ders_adi, int dogru_sayisi, int yanlis_sayisi, String bilgiler) async{
    print("$ders_adi - $dogru_sayisi - $yanlis_sayisi - $bilgiler guncellendi");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => sinavlarsayfasi()));
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var not = widget.sinav;
    tfdersAdi.text = not.sinav_adi;
    tfdogrusayisi.text = not.dogru_sayisi.toString();
    tfyanlissayisi.text = not.yanlis_sayisi.toString();
    tfbilgiler.text = not.bilgiler;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sinavdetaysayfasi"),
        actions: [
          TextButton(
            child: Text("Sil", style: TextStyle(color: Colors.white),),
            onPressed: () {
              sil(widget.sinav.not_id);
            },
          ),
          TextButton(
            child: Text("Guncelle", style: TextStyle(color: Colors.white),),
            onPressed: () {
              guncelle(widget.sinav.not_id, tfdersAdi.text, int.parse(tfdogrusayisi.text), int.parse(tfyanlissayisi.text), tfbilgiler.text);
            },
          ),
        ],
      ),
      body: Center(
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
    );
  }
}
