import 'dart:io';

import 'package:brick_issue_309/app/app.dart';
import 'package:brick_issue_309/bootstrap.dart';

void main() {
  final restEndpoint = String.fromEnvironment(
    'REST_ENDPOINT',
    defaultValue: virtualHostname(),
  );

  bootstrap(() => App(restEndpoint: restEndpoint));
}

String virtualHostname() {
  const port = '8080';
  const version = 'v0.1';

  if (Platform.isAndroid) {
    return 'http://10.0.2.2:$port/$version';
  } else {
    return 'http://127.0.0.1:$port/$version';
  }
}
