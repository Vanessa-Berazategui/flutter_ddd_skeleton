import 'dart:convert';

import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/demo/infrastructure/dtos/demo_dto.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/infrastructure/error/exceptions.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Values stored in phone's memory.
const cachedDemo = 'CACHED_DEMO';

abstract class DemoLocalDataSource {
  Future<void> cacheDemo(DemoDto demoDto);
  Future<DemoDto> getCachedDemo();
  Future<void> clearCacheDemo();
}

@LazySingleton(as: DemoLocalDataSource)
class DemoLocalDataSourceImpl implements DemoLocalDataSource {
  @override
  Future<void> cacheDemo(DemoDto userDto) async {
    final cache = await SharedPreferences.getInstance();

    await cache.setString(
      cachedDemo,
      json.encode(userDto.toJson()),
    );
  }

  @override
  Future<DemoDto> getCachedDemo() async {
    final cache = await SharedPreferences.getInstance();

    final jsonString = cache.getString(cachedDemo);

    if (jsonString != null) {
      return DemoDto.fromJson(json.decode(jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> clearCacheDemo() async {
    final cache = await SharedPreferences.getInstance();

    await cache.remove(cachedDemo);
  }
}
