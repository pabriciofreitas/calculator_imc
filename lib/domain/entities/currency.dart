import 'dart:convert';

class Currency {
  final String name;
  final double value;
  Currency({
    required this.name,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
    };
  }

  factory Currency.fromMap(Map<String, dynamic> map) {
    return Currency(
      name: map['name'] ?? '',
      value: map['buy']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Currency.fromJson(String source) =>
      Currency.fromMap(json.decode(source));
}
