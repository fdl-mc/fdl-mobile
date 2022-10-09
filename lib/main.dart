import 'package:freedomland/app/app.dart';
import 'package:freedomland/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
