import 'package:flutter_test/flutter_test.dart';

import 'package:titanium_furnace_calculator/data/material_data.dart';
import 'package:titanium_furnace_calculator/services/calculator_service.dart';

void main() {
  test('Calculate furnace composition', () {
    final materials = MaterialData.materials;

    final ti64 = materials.firstWhere((m) => m.name == '6-4');

    final ti325 = materials.firstWhere((m) => m.name == '3-2.5');

    final ti17 = materials.firstWhere((m) => m.name == 'Ti 17');

    final furnaceMaterials = [
      FurnaceMaterial(material: ti64, weight: 1000),
      FurnaceMaterial(material: ti325, weight: 200),
      FurnaceMaterial(material: ti17, weight: 150),
    ];

    final totalWeight = CalculatorService.calculateTotalWeight(
      furnaceMaterials,
    );

    final result = CalculatorService.calculateComposition(furnaceMaterials);

    expect(totalWeight, 1350.0);

    expect(result['Al']!, closeTo(5.444444, 0.00001));

    expect(result['V']!, closeTo(3.333333, 0.00001));

    expect(result['Mo']!, closeTo(0.444444, 0.00001));

    expect(result['Ti']!, closeTo(89.074074, 0.00001));
  });
}
