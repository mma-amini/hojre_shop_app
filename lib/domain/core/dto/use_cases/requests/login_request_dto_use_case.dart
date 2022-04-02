import 'package:equatable/equatable.dart';

class LoginRequestDtoUseCase extends Equatable {
  final String phoneNumber;
  final String Code;
  const LoginRequestDtoUseCase({required this.phoneNumber, required this.Code});

  @override
  // TODO: implement props
  List<Object?> get props => [
        phoneNumber,
        Code,
      ];
}
