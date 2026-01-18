import 'package:equatable/equatable.dart';

class SubscriptionModel extends Equatable {
  final String id;
  final String userId;
  final String packageId;
  final DateTime startDate;
  final DateTime endDate;
  final String status; // 'active', 'expired', 'cancelled'
  final String paymentId;

  const SubscriptionModel({
    required this.id,
    required this.userId,
    required this.packageId,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.paymentId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'packageId': packageId,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'status': status,
      'paymentId': paymentId,
    };
  }

  factory SubscriptionModel.fromMap(Map<String, dynamic> map) {
    return SubscriptionModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      packageId: map['packageId'] ?? '',
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      status: map['status'] ?? '',
      paymentId: map['paymentId'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, userId, packageId, startDate, endDate, status, paymentId];
}
