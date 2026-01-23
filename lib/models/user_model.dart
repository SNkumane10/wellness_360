// lib/models/user_model.dart

class UserModel {
  final String uid;
  final String email;
  final String? displayName;
  final String? phoneNumber;
  final DateTime createdAt;
  final DateTime? lastLogin;
  final bool hasCompletedAssessment;
  final String? recommendedProgram;

  UserModel({
    required this.uid,
    required this.email,
    this.displayName,
    this.phoneNumber,
    required this.createdAt,
    this.lastLogin,
    this.hasCompletedAssessment = false,
    this.recommendedProgram,
  });

  // Convert to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt.toIso8601String(),
      'lastLogin': lastLogin?.toIso8601String(),
      'hasCompletedAssessment': hasCompletedAssessment,
      'recommendedProgram': recommendedProgram,
    };
  }

  // Create from Firestore document
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      displayName: map['displayName'],
      phoneNumber: map['phoneNumber'],
      createdAt: DateTime.parse(map['createdAt']),
      lastLogin: map['lastLogin'] != null ? DateTime.parse(map['lastLogin']) : null,
      hasCompletedAssessment: map['hasCompletedAssessment'] ?? false,
      recommendedProgram: map['recommendedProgram'],
    );
  }

  // Copy with method for updates
  UserModel copyWith({
    String? uid,
    String? email,
    String? displayName,
    String? phoneNumber,
    DateTime? createdAt,
    DateTime? lastLogin,
    bool? hasCompletedAssessment,
    String? recommendedProgram,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createdAt: createdAt ?? this.createdAt,
      lastLogin: lastLogin ?? this.lastLogin,
      hasCompletedAssessment: hasCompletedAssessment ?? this.hasCompletedAssessment,
      recommendedProgram: recommendedProgram ?? this.recommendedProgram,
    );
  }
}