import 'package:flutter_app_word/sembast/model.dart';
import 'package:flutter_app_word/sembast/word_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';


class SembastCakeRepository extends CakeRepository {
  final Database _database = GetIt.I.get();
  final StoreRef _store = intMapStoreFactory.store("cake_store");

  @override
  Future<int> insertCake(Word cake) async {
    return await _store.add(_database, cake.toMap());
  }

  @override
  Future updateCake(Word cake) async {
    await _store.record(cake.id).update(_database, cake.toMap());
  }

  @override
  Future deleteCake(int cakeId) async{
    await _store.record(cakeId).delete(_database);
  }

  @override
  Future<List<Word>> getAllCakes() async {
    final snapshots = await _store.find(_database);
    print(snapshots);
    return snapshots
        .map((snapshot) => Word.fromMap(snapshot.key, snapshot.value))
        .toList(growable: false);
  }
}
