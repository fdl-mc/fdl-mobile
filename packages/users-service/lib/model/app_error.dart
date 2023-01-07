//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of users_service;

class AppError {
  /// Returns a new [AppError] instance.
  AppError({
    required this.detail,
  });

  /// Error detail message
  String detail;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AppError &&
     other.detail == detail;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (detail.hashCode);

  @override
  String toString() => 'AppError[detail=$detail]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'detail'] = this.detail;
    return json;
  }

  /// Returns a new [AppError] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AppError? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AppError[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AppError[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AppError(
        detail: mapValueOfType<String>(json, r'detail')!,
      );
    }
    return null;
  }

  static List<AppError>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppError>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppError.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AppError> mapFromJson(dynamic json) {
    final map = <String, AppError>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppError.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AppError-objects as value to a dart map
  static Map<String, List<AppError>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AppError>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppError.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'detail',
  };
}

