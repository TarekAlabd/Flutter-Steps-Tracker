import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  Future<String?> get({required String key});
  Future<bool?> checkIfAppLocaleSetKey({required String isAppLocaleSetKey});
  Future<bool> put({
    required String key,
    required String value,
  });
  Future clear({required String key});
  Future<bool?> has({required String key});
}

@Singleton(as: CacheHelper)
class CacheHelperImpl extends CacheHelper {
  final SharedPreferences _sharedPreferences;

  CacheHelperImpl(this._sharedPreferences);

  @override
  Future clear({required String key}) async {
    final bool f = await _basicErrorHandling(() async {
      return _sharedPreferences.remove(key);
    });
    return f;
  }

  @override
  Future<String?> get({required String key}) async {
    final f = await _basicErrorHandling(() async {
      final hasKey = await has(key: key);
      if (hasKey != null && hasKey) {
        return _sharedPreferences.getString(key)!;
      }
      return null;
    });
    return f;
  }

  @override
  Future<bool?> checkIfAppLocaleSetKey(
      {required String isAppLocaleSetKey}) async {
    final isAppLocaleSet = await _basicErrorHandling(() async {
      final hasKey = await has(key: isAppLocaleSetKey);
      if (hasKey != null && hasKey) {
        return _sharedPreferences.getString(isAppLocaleSetKey)!;
      }
      return null;
    });
    return isAppLocaleSet == "true" ? true : false;
  }

  @override
  Future<bool> put({required String key, required String value}) async {
    final isSucceed = await _sharedPreferences.setString(key, value);
    return isSucceed;
  }

  @override
  Future<bool?> has({required String key}) async {
    final contains = _sharedPreferences.containsKey(key);
    return contains;
  }
}

extension on CacheHelper {
  Future<T> _basicErrorHandling<T>(Future<T> Function() onSuccess) async {
    try {
      final f = await onSuccess();
      return f;
    } catch (e) {
      rethrow;
      // throw ClientException.cacheError(message: e.toString());
    }
  }
}
