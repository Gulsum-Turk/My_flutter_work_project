import 'package:flutter/src/widgets/editable_text.dart';
import "package:sqflite/sqflite.dart" as sql;
import 'package:flutter/foundation.dart';

class DatabaseHelper {
  static Future<void> tablolar(sql.Database database) async {
    await database.execute("""CREATE TABLE market1(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        urun_ismi TEXT,
        urun_fiyat TEXT,
    )""");
    await database.execute("""CREATE TABLE market2(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        urun_ismi TEXT,
        urun_fiyat TEXT,
    )""");
    await database.execute("""CREATE TABLE market3(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        urun_ismi TEXT,
        urun_fiyat TEXT,
    )""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('indirimler.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await tablolar(database);
    });
  }

  // veri tabanı öğelerini sorgulama
  static Future<List<Map<String, dynamic>>> getir1() async {
    // bağlantı yapar
    final db = await DatabaseHelper.db();
    // db.query ile veri tabanını sorgular
    // items tablosunu id ye göre sorgular
    return db.query('market1', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getir2() async {
    // bağlantı yapar
    final db = await DatabaseHelper.db();
    // db.query ile veri tabanını sorgular
    // items tablosunu id ye göre sorgular
    return db.query('market2', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getir3() async {
    // bağlantı yapar
    final db = await DatabaseHelper.db();
    // db.query ile veri tabanını sorgular
    // items tablosunu id ye göre sorgular
    return db.query('market3', orderBy: "id");
  }

// öğe ekleme
  static Future<int> ekleme1(String? urun_ismi, String urun_fiyat,) async {
    final db = await DatabaseHelper.db();
    final data = {'urun_ismi': urun_ismi, 'urun_fiyat': urun_fiyat};
    final id = await db.insert('market1', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> ekleme2(String? urun_ismi, String urun_fiyat) async {
    final db = await DatabaseHelper.db();
    final data = {'urun_ismi': urun_ismi, 'urun_fiyat': urun_fiyat};
    final id = await db.insert('market2', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> ekleme3(String? urun_ismi, String urun_fiyat) async {
    final db = await DatabaseHelper.db();
    final data = {'urun_ismi': urun_ismi, 'urun_fiyat': urun_fiyat};
    final id = await db.insert('market3', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // silme
  static Future<void> silme1(int id) async {
    final db = await DatabaseHelper.db();
    // burada try-catch bloğu kullanılmıştır.
    // bu blok hata oluşması durumunda bunu yakalar ve debug consol a yazdırır.
    try {
      await db.delete("market1", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  static Future<void> silme2(int id) async {
    final db = await DatabaseHelper.db();
    // burada try-catch bloğu kullanılmıştır.
    // bu blok hata oluşması durumunda bunu yakalar ve debug consol a yazdırır.
    try {
      await db.delete("market2", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  static Future<void> silme3(int id) async {
    final db = await DatabaseHelper.db();
    // burada try-catch bloğu kullanılmıştır.
    // bu blok hata oluşması durumunda bunu yakalar ve debug consol a yazdırır.
    try {
      await db.delete("market3", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
