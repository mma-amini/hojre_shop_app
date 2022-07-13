import 'package:equatable/equatable.dart';

class ProductGroupsRequestDtoUseCase extends Equatable {
  final String shopId;

  const ProductGroupsRequestDtoUseCase({required this.shopId});

  @override
  // TODO: implement props
  List<Object?> get props => [
        shopId,
      ];
}
