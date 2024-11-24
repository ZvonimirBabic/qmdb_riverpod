import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<String>((ref) async {
  return await fetchData();
});

Future<String> fetchData() async {
  await Duration(seconds: 2);
  return 'fetchData';
}
