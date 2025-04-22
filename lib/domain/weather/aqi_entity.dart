import 'package:equatable/equatable.dart';


// Possible index: 1, 2, 3, 4, 5. Where 1 = Good, 2 = Fair, 3 = Moderate, 4 = Poor, 5 = Very Poor.
class AqiEntity extends Equatable {
  const AqiEntity({required this.components, required this.index});
  final int index;
  final Map<String, dynamic> components;

  double get pm2_5 => components["pm2_5"] ?? 0.0;

  @override
  List<Object?> get props => [index, components];
}
