import 'package:equatable/equatable.dart';

class ShopProductsRequestDtoUseCase extends Equatable {
  final String categoryId;

  const ShopProductsRequestDtoUseCase({required this.categoryId});

  @override
  // TODO: implement props
  List<Object?> get props => [
        categoryId,
      ];
}
