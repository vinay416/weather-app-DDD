import 'package:equatable/equatable.dart';

class LatLong extends Equatable{
  const LatLong({required this.lat, required this.lon});
  final double lat;
  final double lon;
  
  @override
  List<Object?> get props => [lat,lon];
}