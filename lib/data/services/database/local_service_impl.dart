import 'package:app/data/services/database/collections/movie_collection.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:app/domain/services/database/local_service.dart';

class LocalServiceImpl implements LocalService {
  late final Isar _isar;

  @override
  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [MovieCollectionSchema],
      directory: dir.path,
    );
  }

  @override
  IsarCollection<T> getCollection<T>() {
    return _isar.collection<T>();
  }

  @override
  Future<void> save<T>(T data) async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().put(data);
    });
  }

  @override
  Future<void> saveAll<T>(List<T> items) async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().putAll(items);
    });
  }

  @override
  Future<T?> get<T>(dynamic id) async {
    return await _isar.collection<T>().get(id);
  }

  @override
  Future<List<T>> getAll<T>() async {
    return await _isar.collection<T>().where().findAll();
  }

  @override
  Future<void> delete<T>(dynamic id) async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().delete(id);
    });
  }

  @override
  Future<void> deleteAll<T>() async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().clear();
    });
  }

  @override
  Future<void> update<T>(T data) async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().put(data);
    });
  }

  @override
  Future<bool> exists<T>(dynamic id) async {
    final result = await _isar.collection<T>().get(id);
    return result != null;
  }

  @override
  Future<void> writeTransactionSync<T>(Function transaction) async {
    await _isar.writeTxnSync(() async {
      await transaction();
    });
  }
}
