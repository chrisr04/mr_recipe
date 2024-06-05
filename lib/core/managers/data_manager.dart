import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:mr_recipe/ui/common/common.dart';

class DataManager {
  final _data = <Map<String, dynamic>>[];
  final _watcher = StreamController<List<Map<String, dynamic>>>.broadcast();

  Stream<List<Map<String, dynamic>>> getWatcher() => _watcher.stream;

  Future<List<Map<String, dynamic>>> getData() async {
    if (_data.isNotEmpty) return _data;
    final json = await rootBundle.loadString(MrAssets.recipesJson);
    _data.addAll(List<Map<String, dynamic>>.from(jsonDecode(json)));
    return _data;
  }

  void create(Map<String, dynamic> value) {
    _data.add(value);
    _watcher.add(_data);
  }

  void update(int index, Map<String, dynamic> value) {
    _data[index] = value;
    _watcher.add(_data);
  }

  void delete(int index) {
    _data.removeAt(index);
    _watcher.add(_data);
  }

  Future<void> close() => _watcher.close();
}
