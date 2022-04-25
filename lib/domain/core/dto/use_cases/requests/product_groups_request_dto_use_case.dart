import 'package:equatable/equatable.dart';

class ProductGroupsRequestDtoUseCase extends Equatable {
  final String ShopId;

  const ProductGroupsRequestDtoUseCase({required this.ShopId});

  @override
  // TODO: implement props
  List<Object?> get props => [
        ShopId,
      ];
}
