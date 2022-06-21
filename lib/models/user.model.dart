import 'dart:convert';

class User {
  final int? id;
  final String? phone;
  final String? roleCode;
  final bool? userLoginAllowed;

  const User({this.id, this.phone, this.roleCode, this.userLoginAllowed});

  factory User.fromMap(Map<String, dynamic> data) => User(
        id: data['id'] as int?,
        phone: data['phone'] as String?,
        roleCode: data['role_code'] as String?,
        userLoginAllowed: data['user_login_allowed'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'phone': phone,
        'role_code': roleCode,
        'user_login_allowed': userLoginAllowed,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [user].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [user] to a JSON string.
  String toJson() => json.encode(toMap());

  User copyWith({
    int? id,
    String? phone,
    String? roleCode,
    bool? userLoginAllowed,
  }) {
    return User(
      id: id ?? this.id,
      phone: phone ?? this.phone,
      roleCode: roleCode ?? this.roleCode,
      userLoginAllowed: userLoginAllowed ?? this.userLoginAllowed,
    );
  }

  List<Object?> get props => [id, phone, roleCode, userLoginAllowed];
}
