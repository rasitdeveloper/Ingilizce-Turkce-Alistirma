import 'package:eng_app/VeritabaniYardimcisi.dart';

import 'Kelimeler.dart';

class Kelimelerdao {

  Future<List<Kelimeler>> rastgele5Getir() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kelimeler ORDER BY RANDOM() LIMIT 5");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kelimeler(satir["kelime_id"], satir["ingilizce"], satir["turkce"]);
    });
  }

  Future<List<Kelimeler>> rastgele3YanlisGetir(int kelime_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kelimeler WHERE kelime_id != $kelime_id ORDER BY RANDOM() LIMIT 3");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kelimeler(satir["kelime_id"], satir["ingilizce"], satir["turkce"]);
    });
  }


}