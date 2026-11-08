import 'package:flutter/material.dart';

import '../data/material_data.dart';
import '../services/calculator_service.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _weightController = TextEditingController();

  late String _selectedGrade;

  final List<FurnaceMaterial> _furnaceMaterials = [];

  @override
  void initState() {
    super.initState();
    _selectedGrade = MaterialData.materials.first.name;
  }

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  void _addMaterial() {
    final input = _weightController.text.trim().replaceAll(',', '.');

    final weight = double.tryParse(input);

    if (weight == null || !weight.isFinite || weight <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid positive weight.')),
      );
      return;
    }

    final material = MaterialData.materials.firstWhere(
      (item) => item.name == _selectedGrade,
    );

    setState(() {
      _furnaceMaterials.add(
        FurnaceMaterial(material: material, weight: weight),
      );
    });

    _weightController.clear();
  }

  void _removeMaterial(int index) {
    setState(() {
      _furnaceMaterials.removeAt(index);
    });
  }

  void _clearMaterials() {
    setState(() {
      _furnaceMaterials.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalWeight =
        _furnaceMaterials.isEmpty
            ? 0.0
            : CalculatorService.calculateTotalWeight(_furnaceMaterials);

    final composition = CalculatorService.calculateComposition(
      _furnaceMaterials,
    );

    final elements =
        composition.entries.toList()..sort((a, b) => a.key.compareTo(b.key));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Titanium Furnace Calculator'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Company logo
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Image.asset(
                'assets/images/company_logo.png',
                height: 85,
                fit: BoxFit.contain,
              ),
            ),

            // Total furnace weight

            // Total furnace weight
            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      'Total Furnace Weight',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${totalWeight.toStringAsFixed(2)} kg',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Add Material',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            // Material selection
            DropdownButtonFormField<String>(
              value: _selectedGrade,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Material Grade',
                border: OutlineInputBorder(),
              ),
              items:
                  MaterialData.materials.map((material) {
                    return DropdownMenuItem<String>(
                      value: material.name,
                      child: Text(material.name),
                    );
                  }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedGrade = value;
                  });
                }
              },
            ),

            const SizedBox(height: 16),

            // Weight input
            TextField(
              controller: _weightController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Weight',
                suffixText: 'kg',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _addMaterial(),
            ),

            const SizedBox(height: 16),

            ElevatedButton.icon(
              onPressed: _addMaterial,
              icon: const Icon(Icons.add),
              label: const Text('Add Material'),
            ),

            const SizedBox(height: 24),

            // Selected materials
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Furnace Materials',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                if (_furnaceMaterials.isNotEmpty)
                  TextButton(
                    onPressed: _clearMaterials,
                    child: const Text('Clear All'),
                  ),
              ],
            ),

            if (_furnaceMaterials.isEmpty)
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text('No materials added yet.'),
              ),

            ..._furnaceMaterials.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;

              return Card(
                child: ListTile(
                  title: Text(item.material.name),
                  subtitle: Text('${item.weight.toStringAsFixed(2)} kg'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () => _removeMaterial(index),
                  ),
                ),
              );
            }),

            const SizedBox(height: 24),

            // Composition results
            const Text(
              'Chemical Composition',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            if (_furnaceMaterials.isEmpty)
              const Text('Add materials to see the results.')
            else
              Card(
                child: Column(
                  children:
                      elements.map((element) {
                        return ListTile(
                          dense: true,
                          title: Text(element.key),
                          trailing: Text(
                            '${element.value.toStringAsFixed(3)}%',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                ),
              ),

            const SizedBox(height: 16),

            const Text(
              'Theoretical composition based on '
              'reference material percentages. '
              'Not a laboratory measurement.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
