import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  SharedPreferences? _storage;
  final Map<String, BehaviorSubject<String>> _store =
      <String, BehaviorSubject<String>>{};

  Future<void> initStorage() async {
    _storage = await SharedPreferences.getInstance();
    return;
  }

  void _initItem(String key) {
    if (_store[key] == null) {
      _store[key] = BehaviorSubject<String>();
    }

    final String val = getItem(key);
    if (val != null) {
      _store[key]?.add(val);
    }
  }

  String getItem(String key) {
    final String val = (_storage?.getString(key) ?? '');
    return val;
  }

  Future<bool> setItem(String key, String value) {
    _initItem(key);
    _store[key]?.add(value);

    return _storage!.setString(key, value);
  }
}
