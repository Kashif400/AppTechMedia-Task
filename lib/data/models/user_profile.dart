class UserProfile {
  final String? id;
  final String? email;
  final String? name;
  final String? profileImage;
  final String? phone;
  final String? role;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserProfile({
    this.id,
    this.email,
    this.name,
    this.profileImage,
    this.phone,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id']?.toString() ?? json['_id']?.toString(),
      email: json['email'],
      name: json['name'] ?? json['username'],
      profileImage:
          json['profileImage'] ?? json['profile_image'] ?? json['avatar'],
      phone: json['phone'] ?? json['phoneNumber'],
      role: json['role'],
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'profileImage': profileImage,
      'phone': phone,
      'role': role,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  UserProfile copyWith({
    String? id,
    String? email,
    String? name,
    String? profileImage,
    String? phone,
    String? role,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserProfile(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'UserProfile(id: $id, email: $email, name: $name, role: $role)';
  }
}
