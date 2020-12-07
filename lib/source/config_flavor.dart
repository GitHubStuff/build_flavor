import 'package:flutter/cupertino.dart';
import 'package:app_exception/appexception.dart';
import 'package:enum_to_string/enum_to_string.dart';

enum Flavor {
  Debug,
  Release,
  Profile,
  Test,
}

extension FlavorString on Flavor {
  String get display {
    switch (this) {
      case Flavor.Debug:
        return '🐞 Debug';
      case Flavor.Release:
        return '🏁 Release';
      case Flavor.Profile:
        return '🧾 Profile';
      case Flavor.Test:
        return '🤞 Test';
      default:
        final name = EnumToString.convertToString(this);
        throw CantLoadVariable('Cannot find falvor $name', 404404);
    }
  }
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
    final message = _instance.flavor.display;
    debugPrint('-------------------------------------------');
    debugPrint('Running Flavor $message');
    debugPrint('-------------------------------------------');
    return _instance;
  }

  dynamic variable(String name) {
    dynamic result = _instance._variables[name];
    if (result == null) throw CantLoadVariable('Missing "$name"', 404404);
    return result;
  }
}
