import 'package:alice/alice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final aliceProvider = Provider<Alice>(
  (ref) => Alice(showNotification: true),
);
