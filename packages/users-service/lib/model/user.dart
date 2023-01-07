//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of users_service;

class User {
  /// Returns a new [User] instance.
  User({
    required this.admin,
    required this.id,
    required this.nickname,
  });

  bool admin;

  int id;

  String nickname;

  @override
  bool operator ==(Object other) => identical(this, other) || other is User &&
     other.admin == admin &&
     other.id == id &&
     other.nickname == nickname;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (admin.hashCode) +
    (id.hashCode) +
    (nickname.hashCode);

  @override
  String toString() => 'User[admin=$admin, id=$id, nickname=$nickname]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'admin'] = this.admin;
      json[r'id'] = this.id;
      json[r'nickname'] = this.nickname;
    return json;
  }

  /// Returns a new [User] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static User? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "User[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "User[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return User(
        admin: mapValueOfType<bool>(json, r'admin')!,
        id: mapValueOfType<int>(json, r'id')!,
        nickname: mapValueOfType<String>(json, r'nickname')!,
      );
    }
    return null;
  }

  static List<User>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <User>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = User.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, User> mapFromJson(dynamic json) {
    final map = <String, User>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = User.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of User-objects as value to a dart map
  static Map<String, List<User>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<User>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = User.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'admin',
    'id',
    'nickname',
  };
}

