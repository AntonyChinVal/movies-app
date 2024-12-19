import 'package:isar/isar.dart';

abstract class LocalService {
  Future<void> initialize();

  IsarCollection<T> getCollection<T>();

  Future<void> save<T>(T data);

  Future<void> saveAll<T>(List<T> items);

  Future<T?> get<T>(dynamic id);

  Future<List<T>> getAll<T>();

  Future<void> delete<T>(dynamic id);

  Future<void> deleteAll<T>();

  Future<void> update<T>(T data);

  Future<bool> exists<T>(dynamic id);

  Future<void> writeTransactionSync<T>(Function transaction);
}
