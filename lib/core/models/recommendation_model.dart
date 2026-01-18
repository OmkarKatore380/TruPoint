import 'package:equatable/equatable.dart';

class RecommendationModel extends Equatable {
  final String id;
  final String symbol;
  final String type; // 'Stocks', 'F&O'
  final String horizon; // 'Intraday', 'Short Term', 'Long Term'
  final double entryPrice;
  final double? targetPrice;
  final double? stopLoss;
  final String action; // 'BUY', 'SELL'
  final String rationale; // Text or PDF link
  final DateTime createdAt;
  final bool isLive;
  final String? result; // 'Target Hit', 'SL Hit', 'Closed'

  const RecommendationModel({
    required this.id,
    required this.symbol,
    required this.type,
    required this.horizon,
    required this.entryPrice,
    this.targetPrice,
    this.stopLoss,
    required this.action,
    required this.rationale,
    required this.createdAt,
    this.isLive = true,
    this.result,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'symbol': symbol,
      'type': type,
      'horizon': horizon,
      'entryPrice': entryPrice,
      'targetPrice': targetPrice,
      'stopLoss': stopLoss,
      'action': action,
      'rationale': rationale,
      'createdAt': createdAt.toIso8601String(),
      'isLive': isLive,
      'result': result,
    };
  }

  factory RecommendationModel.fromMap(Map<String, dynamic> map) {
    return RecommendationModel(
      id: map['id'] ?? '',
      symbol: map['symbol'] ?? '',
      type: map['type'] ?? '',
      horizon: map['horizon'] ?? '',
      entryPrice: (map['entryPrice'] ?? 0.0).toDouble(),
      targetPrice: (map['targetPrice'] ?? 0.0).toDouble(),
      stopLoss: (map['stopLoss'] ?? 0.0).toDouble(),
      action: map['action'] ?? '',
      rationale: map['rationale'] ?? '',
      createdAt: DateTime.parse(map['createdAt']),
      isLive: map['isLive'] ?? true,
      result: map['result'],
    );
  }

  @override
  List<Object?> get props => [id, symbol, type, horizon, entryPrice, targetPrice, stopLoss, action, rationale, createdAt, isLive, result];
}
