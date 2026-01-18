import 'package:equatable/equatable.dart';

class PackageModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final int durationDays;
  final List<String> features;
  final bool isWhiteLabel; // Whether this package is for a white-label partner

  const PackageModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.durationDays,
    required this.features,
    this.isWhiteLabel = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'durationDays': durationDays,
      'features': features,
      'isWhiteLabel': isWhiteLabel,
    };
  }

  factory PackageModel.fromMap(Map<String, dynamic> map) {
    return PackageModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
      durationDays: map['durationDays'] ?? 0,
      features: List<String>.from(map['features'] ?? []),
      isWhiteLabel: map['isWhiteLabel'] ?? false,
    );
  }

  @override
  List<Object?> get props => [id, name, description, price, durationDays, features, isWhiteLabel];
}
