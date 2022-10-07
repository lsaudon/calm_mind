import 'package:calm_mind/app/app.dart';
import 'package:calm_mind/app/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
