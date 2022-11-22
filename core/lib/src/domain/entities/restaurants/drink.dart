import 'package:equatable/equatable.dart';

class Drink extends Equatable {
  final String name;

  const Drink({required this.name});

  @override
  List<Object?> get props => [name];
}
