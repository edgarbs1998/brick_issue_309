import 'package:brick_issue_309/app/app.dart';
import 'package:brick_issue_309/bootstrap.dart';

void main() {
  const restEndpoint = String.fromEnvironment(
    'REST_ENDPOINT',
  );

  bootstrap(() => const App(restEndpoint: restEndpoint));
}
