import 'package:equatable/equatable.dart';

class LoginRequestDtoUseCase extends Equatable {
  final String phoneNumber;
  final String Code;
  final String ClientSecret;
  const LoginRequestDtoUseCase({required this.phoneNumber, required this.Code, required this.ClientSecret});

  @override
  // TODO: implement props
  List<Object?> get props => [
        phoneNumber,
        Code,
      ];
}
