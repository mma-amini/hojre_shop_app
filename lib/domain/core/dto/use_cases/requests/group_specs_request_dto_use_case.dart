import 'package:equatable/equatable.dart';

class GroupSpecsRequestDtoUseCase extends Equatable {
  final String categoryId;

  const GroupSpecsRequestDtoUseCase({required this.categoryId});

  @override
  // TODO: implement props
  List<Object?> get props => [
        categoryId,
      ];
}
