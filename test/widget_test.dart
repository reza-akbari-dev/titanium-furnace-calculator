import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:titanium_furnace_calculator/main.dart';

void main() {
  testWidgets('Furnace Calculator screen loads', (WidgetTester tester) async {
    // Launch the application.
    await tester.pumpWidget(const FurnaceCalculatorApp());

    // Verify the screen title.
    expect(find.text('Titanium Furnace Calculator'), findsOneWidget);

    // Verify the initial furnace weight.
    expect(find.text('0.00 kg'), findsOneWidget);

    // Verify material selection.
    expect(find.byType(DropdownButtonFormField<String>), findsOneWidget);

    // Verify the weight input.
    expect(find.byType(TextField), findsOneWidget);

    // Verify the Add Material button.
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
