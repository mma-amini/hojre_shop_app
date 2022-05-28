import 'package:equatable/equatable.dart';

class ProductDesignRequestDtoUseCase extends Equatable {
  final String ProductId;

  const ProductDesignRequestDtoUseCase({required this.ProductId});

  @override
  // TODO: implement props
  List<Object?> get props => [
        ProductId,
      ];
}
