import 'package:flutter/cupertino.dart';
import 'package:app_exception/appexception.dart';

enum Flavor {
  Debug,
  Release,
  Profile,
  Test,
}

class CantLoadVariable extends AppException {
  CantLoadVariable([String message, int code]) : super(message, 'Cannot find variable', code);
}

class ConfigFlavor {
  static ConfigFlavor _instance;
  static ConfigFlavor get instance => _instance;

  final Flavor flavor;
  final Map<String, dynamic> _variables;

  ConfigFlavor._internal(this.flavor, this._variables);

  factory ConfigFlavor({@required flavor, @required Map<String, dynamic> variables}) {
    _instance ??= ConfigFlavor._internal(flavor, variables);
    return _instance;
  }

  dynamic variable(String name) {
    dynamic result = _instance._variables[name];
    assert(result != null, 'Cannot find "$name"');
    if (result == null) throw CantLoadVariable('Missing "$name"', 404);
    return result;
  }
}
