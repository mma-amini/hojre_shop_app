import 'package:equatable/equatable.dart';

class GroupOptionsRequestDtoUseCase extends Equatable {
  final String categoryId;

  const GroupOptionsRequestDtoUseCase({required this.categoryId});

  @override
  // TODO: implement props
  List<Object?> get props => [
        categoryId,
      ];
}
