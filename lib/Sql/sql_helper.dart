import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart'as sql;
import 'package:sqflite/sql.dart';

class SQLHelper{
  static Future<void> CreateTable(sql.Database database)async{
    await database.execute("""CREATE TABLE article(
        title TEXT,
        description TEXT,
        publishedAt TEXT,
        image TEXT,
        isFavorite INTEGER
      )
      """
    );
  }

  static Future<sql.Database> db()async{
    return sql.openDatabase(
      'news.db',
      version: 1,
      onCreate: (sql.Database db,int version) async{
        print('....CREATING DATABASE');
        await CreateTable(db);
      } ,
    );
  }

  static Future<int> CreateItem(
    String title,
    String description,
    String publishedAt,
    String imageUrl
  ) async {

    final db = await SQLHelper.db();
    final data = {
      'title':title,
      'description':description,
      'publishedAt':publishedAt,
      'image':imageUrl
    };
    final id = await db.insert(
      'article', 
      data,
      conflictAlgorithm: ConflictAlgorithm.rollback
    );

    return id;
  }

  static Future<List<Map<String,dynamic>>> getItems()async{
    final db = await SQLHelper.db();

    return db.query('article',orderBy: 'id');
  }

static Future<void> delete(String title) async {
  final db = await SQLHelper.db();

  try {
    await db.delete(
      'article',
      where: 'title = ?',
      whereArgs: [title],
    );
  } catch (error) {
    debugPrint('Something Went Wrong on deletion $error');
  }
}
static Future<void> toggleFavorite(String title) async {
  final db = await SQLHelper.db();
  await db.rawUpdate('''
    UPDATE articles 
    SET isFavorite = CASE 
                      WHEN isFavorite = 0 THEN 1 
                      ELSE 0 
                    END 
    WHERE title = ? 
  ''', [title]);
}

}