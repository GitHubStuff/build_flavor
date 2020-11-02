import 'package:flutter_test/flutter_test.dart';

import 'package:build_flavor/build_flavor.dart';

void main() {
  test('adds one to input values', () {
    Map<String, dynamic> variables = {'Pet': 'fie', 'bff': 'DeeDee'};
    ConfigFlavor(variables: variables, flavor: Flavor.Debug);
    final bff = ConfigFlavor.instance.variable('bff');
    expect(bff, equals('DeeDee'));
  });
}
