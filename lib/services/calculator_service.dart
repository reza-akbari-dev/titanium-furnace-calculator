import '../models/material.dart';

// Represents a material added to the furnace.
class FurnaceMaterial {
  final Material material;
  final double weight;

  const FurnaceMaterial({required this.material, required this.weight});
}

class CalculatorService {
  // Calculate total furnace weight.
  static double calculateTotalWeight(List<FurnaceMaterial> materials) {
    double total = 0.0;

    for (final item in materials) {
      if (!item.weight.isFinite || item.weight <= 0) {
        throw ArgumentError(
          'Material weight must be a positive finite number.',
        );
      }

      total += item.weight;
    }

    return total;
  }

  // Calculate final chemical composition.
  static Map<String, double> calculateComposition(
    List<FurnaceMaterial> materials,
  ) {
    final Map<String, double> result = {};

    if (materials.isEmpty) {
      return result;
    }

    final double totalWeight = calculateTotalWeight(materials);

    if (!totalWeight.isFinite || totalWeight <= 0) {
      throw ArgumentError('Invalid total furnace weight.');
    }

    for (final item in materials) {
      for (final element in item.material.composition.entries) {
        final double contribution = item.weight * element.value / totalWeight;

        result[element.key] = (result[element.key] ?? 0.0) + contribution;
      }
    }

    return result;
  }
}
