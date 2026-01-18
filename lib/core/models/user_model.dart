import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String uid;
  final String email;
  final String? phoneNumber;
  final String? displayName;
  final String? photoUrl;
  final bool isKycCompleted;
  final String? activePlanId;
  final DateTime? planExpiry;
  final String role; // 'user', 'admin'

  const UserModel({
    required this.uid,
    required this.email,
    this.phoneNumber,
    this.displayName,
    this.photoUrl,
    this.isKycCompleted = false,
    this.activePlanId,
    this.planExpiry,
    this.role = 'user',
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'phoneNumber': phoneNumber,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'isKycCompleted': isKycCompleted,
      'activePlanId': activePlanId,
      'planExpiry': planExpiry?.toIso8601String(),
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'],
      displayName: map['displayName'],
      photoUrl: map['photoUrl'],
      isKycCompleted: map['isKycCompleted'] ?? false,
      activePlanId: map['activePlanId'],
      planExpiry: map['planExpiry'] != null ? DateTime.parse(map['planExpiry']) : null,
      role: map['role'] ?? 'user',
    );
  }

  @override
  List<Object?> get props => [uid, email, phoneNumber, displayName, photoUrl, isKycCompleted, activePlanId, planExpiry, role];
}
