//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of economy_service;

class EconomyState {
  /// Returns a new [EconomyState] instance.
  EconomyState({
    required this.balance,
    required this.banker,
  });

  /// Balance of user
  int balance;

  /// Whether the user has banker permissions
  bool banker;

  @override
  bool operator ==(Object other) => identical(this, other) || other is EconomyState &&
     other.balance == balance &&
     other.banker == banker;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (balance.hashCode) +
    (banker.hashCode);

  @override
  String toString() => 'EconomyState[balance=$balance, banker=$banker]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'balance'] = this.balance;
      json[r'banker'] = this.banker;
    return json;
  }

  /// Returns a new [EconomyState] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EconomyState? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "EconomyState[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "EconomyState[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return EconomyState(
        balance: mapValueOfType<int>(json, r'balance')!,
        banker: mapValueOfType<bool>(json, r'banker')!,
      );
    }
    return null;
  }

  static List<EconomyState>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <EconomyState>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EconomyState.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EconomyState> mapFromJson(dynamic json) {
    final map = <String, EconomyState>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EconomyState.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EconomyState-objects as value to a dart map
  static Map<String, List<EconomyState>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<EconomyState>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EconomyState.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'balance',
    'banker',
  };
}

