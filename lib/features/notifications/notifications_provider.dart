import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationsProvider extends FamilyAsyncNotifier<void, BuildContext> {
  @override
  FutureOr<void> build(BuildContext arg) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

final notificationsProvider = AsyncNotifierProvider.family(
  () => NotificationsProvider(),
);
