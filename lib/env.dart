import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(name: 'Env', path: '.env')
class Env {
  @EnviedField(obfuscate: true)
  static final String base = _Env.base;
}
