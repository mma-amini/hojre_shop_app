import 'package:equatable/equatable.dart';

class ProductDesignRequestDtoUseCase extends Equatable {
  final String productId;

  const ProductDesignRequestDtoUseCase({required this.productId});

  @override
  // TODO: implement props
  List<Object?> get props => [
        productId,
      ];
}
