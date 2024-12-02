import 'dart:async';

import 'package:flutter/foundation.dart';

void debounce({
  required Duration duration,
  required VoidCallback callback,
  Timer? timer,
}) {
  if (timer?.isActive ?? false) {
    timer!.cancel();
  }
  Timer(duration, callback);
}
