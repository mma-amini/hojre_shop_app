import 'package:equatable/equatable.dart';

class ProductGroupsRequestDtoUseCase extends Equatable {
  final String ShopID;

  const ProductGroupsRequestDtoUseCase({required this.ShopID});

  @override
  // TODO: implement props
  List<Object?> get props => [
        ShopID,
      ];
}
