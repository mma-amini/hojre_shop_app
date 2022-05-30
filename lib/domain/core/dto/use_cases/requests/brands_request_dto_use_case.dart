import 'package:equatable/equatable.dart';

class BrandsRequestDtoUseCase extends Equatable {
  final String keyword;

  const BrandsRequestDtoUseCase({required this.keyword});

  @override
  // TODO: implement props
  List<Object?> get props => [
        keyword,
      ];
}
