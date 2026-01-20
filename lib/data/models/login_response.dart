class LoginResponse {
  final bool success;
  final int statusCode;
  final String message;
  final LoginData? data;

  LoginResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 200,
      message: json['message'] ?? '',
      data: json['data'] != null ? LoginData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'statusCode': statusCode,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class LoginData {
  final String accessToken;
  final String refreshToken;
  final String expiresIn;
  final String refreshExpiresIn;
  final String role;
  final UserProfile user;

  LoginData({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.refreshExpiresIn,
    required this.role,
    required this.user,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      expiresIn: json['expiresIn'] ?? '',
      refreshExpiresIn: json['refreshExpiresIn'] ?? '',
      role: json['role'] ?? '',
      user: UserProfile.fromJson(json['user'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'expiresIn': expiresIn,
      'refreshExpiresIn': refreshExpiresIn,
      'role': role,
      'user': user.toJson(),
    };
  }

  DateTime get accessTokenExpiry {
    // Parse expiresIn (e.g., "1440h" = 1440 hours)
    try {
      final hours = int.parse(expiresIn.replaceAll('h', ''));
      return DateTime.now().add(Duration(hours: hours));
    } catch (e) {
      // Default to 24 hours if parsing fails
      return DateTime.now().add(const Duration(hours: 24));
    }
  }

  DateTime get refreshTokenExpiry {
    // Parse refreshExpiresIn (e.g., "70d" = 70 days)
    try {
      final days = int.parse(refreshExpiresIn.replaceAll('d', ''));
      return DateTime.now().add(Duration(days: days));
    } catch (e) {
      // Default to 30 days if parsing fails
      return DateTime.now().add(const Duration(days: 30));
    }
  }
}

class UserProfile {
  final String id;
  final String email;
  final String role;
  final String status;
  final bool emailVerified;
  final bool isEmailVerified;
  final bool isPhoneVerified;
  final bool isQuestionnaireSubmitted;
  final bool isDeleted;
  final String? deletionRequestedAt;
  final String? scheduledDeletionDate;
  final bool deletionCancelled;
  final String? deletionReason;
  final bool twoFactorEnabled;
  final String? name;
  final String? profileImage;
  final String? phone;

  UserProfile({
    required this.id,
    required this.email,
    required this.role,
    required this.status,
    required this.emailVerified,
    required this.isEmailVerified,
    required this.isPhoneVerified,
    required this.isQuestionnaireSubmitted,
    required this.isDeleted,
    this.deletionRequestedAt,
    this.scheduledDeletionDate,
    required this.deletionCancelled,
    this.deletionReason,
    required this.twoFactorEnabled,
    this.name,
    this.profileImage,
    this.phone,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      status: json['status'] ?? '',
      emailVerified: json['emailVerified'] ?? false,
      isEmailVerified: json['isEmailVerified'] ?? false,
      isPhoneVerified: json['isPhoneVerified'] ?? false,
      isQuestionnaireSubmitted: json['isQuestionnaireSubmitted'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
      deletionRequestedAt: json['deletionRequestedAt'],
      scheduledDeletionDate: json['scheduledDeletionDate'],
      deletionCancelled: json['deletionCancelled'] ?? false,
      deletionReason: json['deletionReason'],
      twoFactorEnabled: json['twoFactorEnabled'] ?? false,
      name: json['name'],
      profileImage: json['profileImage'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'role': role,
      'status': status,
      'emailVerified': emailVerified,
      'isEmailVerified': isEmailVerified,
      'isPhoneVerified': isPhoneVerified,
      'isQuestionnaireSubmitted': isQuestionnaireSubmitted,
      'isDeleted': isDeleted,
      'deletionRequestedAt': deletionRequestedAt,
      'scheduledDeletionDate': scheduledDeletionDate,
      'deletionCancelled': deletionCancelled,
      'deletionReason': deletionReason,
      'twoFactorEnabled': twoFactorEnabled,
      'name': name,
      'profileImage': profileImage,
      'phone': phone,
    };
  }

  UserProfile copyWith({
    String? id,
    String? email,
    String? role,
    String? status,
    bool? emailVerified,
    bool? isEmailVerified,
    bool? isPhoneVerified,
    bool? isQuestionnaireSubmitted,
    bool? isDeleted,
    String? deletionRequestedAt,
    String? scheduledDeletionDate,
    bool? deletionCancelled,
    String? deletionReason,
    bool? twoFactorEnabled,
    String? name,
    String? profileImage,
    String? phone,
  }) {
    return UserProfile(
      id: id ?? this.id,
      email: email ?? this.email,
      role: role ?? this.role,
      status: status ?? this.status,
      emailVerified: emailVerified ?? this.emailVerified,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
      isQuestionnaireSubmitted:
          isQuestionnaireSubmitted ?? this.isQuestionnaireSubmitted,
      isDeleted: isDeleted ?? this.isDeleted,
      deletionRequestedAt: deletionRequestedAt ?? this.deletionRequestedAt,
      scheduledDeletionDate:
          scheduledDeletionDate ?? this.scheduledDeletionDate,
      deletionCancelled: deletionCancelled ?? this.deletionCancelled,
      deletionReason: deletionReason ?? this.deletionReason,
      twoFactorEnabled: twoFactorEnabled ?? this.twoFactorEnabled,
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
      phone: phone ?? this.phone,
    );
  }
}
