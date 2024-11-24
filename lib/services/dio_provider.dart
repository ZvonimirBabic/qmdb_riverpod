import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qmdb/design/constants/app_constants.dart';
import 'package:qmdb/utils/util_constants/qmdb_urls.dart';

import 'alice_provider.dart';

final dioProvider = Provider<Dio>(
  (ref) {
    return Dio(
      BaseOptions(
        connectTimeout: const Duration(milliseconds: kDebugMode ? 30000 : 5000),
        baseUrl: QMDBUrls.baseUrl,
      ),
    )
      ..interceptors.add(
        ref.watch(aliceProvider).getDioInterceptor(),
      )
      ..interceptors.add(
        ref.watch(authInterceptorProvider),
      )
      ..interceptors.add(
        ref.watch(dioCacheInterceptorProvider).value!,
      );
  },
);

final dioCacheInterceptorProvider =
    FutureProvider<DioCacheInterceptor>((ref) async {
  var cacheDir = await getTemporaryDirectory();
  var cacheStore = HiveCacheStore(
    cacheDir.path,
    hiveBoxName: QMDBAppConstants.hiveCacheBox,
  );
  return DioCacheInterceptor(
    options: CacheOptions(
      store: cacheStore,
      maxStale: const Duration(days: 1),
    ),
  );
});

final authInterceptorProvider = Provider<AuthInterceptor>(
  (ref) => AuthInterceptor(
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOGQ3Zjc2OTQ3OTA0YTAxMTI4NmRjNzMyYzU1MjM0ZSIsInN1YiI6IjYwMzM3ODBiMTEzODZjMDAzZjk0ZmM2YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XYuIrLxvowrkevwKx-KhOiOGZ2Tn-R8tEksXq842kX4'),
);

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this.bearerToken);
  final String bearerToken;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// Get token from storage!!!!!
    options.headers.addAll({
      "Authorization": bearerToken,
    });
    super.onRequest(options, handler);
  }
}
