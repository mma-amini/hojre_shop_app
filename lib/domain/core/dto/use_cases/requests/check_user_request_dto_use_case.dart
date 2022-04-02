import 'package:equatable/equatable.dart';

class CheckUserRequestDtoUseCase extends Equatable {
  final String phoneNumber;
  const CheckUserRequestDtoUseCase({required this.phoneNumber});

  @override
  // TODO: implement props
  List<Object?> get props => [
        phoneNumber,
      ];
}
