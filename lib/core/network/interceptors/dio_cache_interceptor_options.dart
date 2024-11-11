import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

final dioCacheOptions = CacheOptions(
  store: MemCacheStore(),
  policy: CachePolicy.request,
  hitCacheOnErrorExcept: const [401, 403],
  maxStale: const Duration(days: 1),
  priority: CachePriority.high,
  keyBuilder: CacheOptions.defaultCacheKeyBuilder,
  allowPostMethod: false,
);
