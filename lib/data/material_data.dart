import '../models/material.dart';

class MaterialData {
  static const List<Material> materials = [
    Material(name: 'CP', composition: {'Fe': 0.30, 'Ti': 99.0}),

    Material(
      name: 'Ti 12',
      composition: {'Mo': 0.30, 'Fe': 0.30, 'C': 0.08, 'Ni': 0.80, 'Ti': 99.0},
    ),

    Material(
      name: 'Ti 407',
      composition: {'Al': 0.85, 'V': 3.90, 'O': 0.15, 'Ti': 95.0},
    ),

    Material(
      name: '3-2.5',
      composition: {
        'Al': 3.0,
        'V': 2.50,
        'Fe': 0.25,
        'C': 0.08,
        'N': 0.02,
        'O': 0.15,
        'Ti': 94.0,
      },
    ),

    Material(
      name: '5-2.5',
      composition: {
        'Al': 5.0,
        'Sn': 2.50,
        'Fe': 0.50,
        'C': 0.08,
        'N': 0.05,
        'O': 0.20,
        'Ti': 92.0,
      },
    ),

    Material(
      name: '8-1-1',
      composition: {
        'Al': 8.0,
        'Mo': 1.0,
        'V': 1.0,
        'Fe': 0.30,
        'C': 0.08,
        'Ti': 90.0,
      },
    ),

    Material(
      name: '6-4',
      composition: {
        'Al': 6.0,
        'V': 4.0,
        'Fe': 0.30,
        'C': 0.15,
        'N': 0.03,
        'O': 0.13,
        'Ti': 89.0,
      },
    ),

    Material(
      name: '6-2-2-2-2',
      composition: {
        'Al': 6.0,
        'Mo': 2.0,
        'Sn': 2.0,
        'Zr': 2.0,
        'Cr': 2.0,
        'Ti': 86.0,
      },
    ),

    Material(
      name: '6-2-4-2',
      composition: {
        'Al': 6.0,
        'Mo': 2.0,
        'Sn': 2.0,
        'Zr': 4.0,
        'Fe': 0.10,
        'Ti': 86.0,
      },
    ),

    Material(
      name: '6-6-2',
      composition: {
        'Al': 6.0,
        'Sn': 2.0,
        'V': 6.0,
        'Fe': 0.65,
        'C': 0.05,
        'Cu': 0.75,
        'Ti': 85.0,
      },
    ),

    Material(
      name: '10-2-3',
      composition: {'Al': 3.0, 'V': 10.0, 'Fe': 2.0, 'C': 0.05, 'Ti': 85.0},
    ),

    Material(
      name: 'Ti 17',
      composition: {
        'Al': 5.0,
        'Mo': 4.0,
        'Sn': 2.0,
        'Zr': 2.0,
        'Cr': 4.0,
        'Ti': 83.0,
      },
    ),

    Material(
      name: '6-2-4-6',
      composition: {
        'Al': 6.0,
        'Mo': 6.0,
        'Sn': 2.0,
        'Zr': 4.0,
        'Fe': 0.15,
        'Ti': 82.0,
      },
    ),

    Material(
      name: 'Ti 834',
      composition: {
        'Al': 5.80,
        'Mo': 0.50,
        'Si': 0.35,
        'Sn': 4.0,
        'Zr': 3.50,
        'C': 0.06,
        'Nb': 0.70,
        'Ti': 85.0,
      },
    ),

    Material(name: 'Ti 8Mn', composition: {'Mn': 8.0, 'Ti': 92.0}),

    Material(
      name: '4-4-2-0.5',
      composition: {'Al': 4.0, 'Mo': 4.0, 'Si': 0.50, 'Sn': 2.0, 'Ti': 90.0},
    ),

    Material(name: '7-4', composition: {'Al': 7.0, 'Mo': 4.0, 'Ti': 89.0}),

    Material(
      name: '6-7Nb',
      composition: {
        'Al': 6.0,
        'Fe': 0.25,
        'C': 0.08,
        'Nb': 7.0,
        'N': 0.05,
        'O': 0.20,
        'Ti': 86.0,
      },
    ),

    Material(name: 'Iron', composition: {'Fe': 100.0, 'Ti': 0.0}),
  ];
}
