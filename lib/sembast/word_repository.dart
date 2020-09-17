import 'package:flutter_app_word/sembast/model.dart';

abstract class CakeRepository {

  Future<int> insertCake(Word cake);

  Future updateCake(Word cake);

  Future deleteCake(int cakeId);

  Future<List<Word>> getAllCakes();
}