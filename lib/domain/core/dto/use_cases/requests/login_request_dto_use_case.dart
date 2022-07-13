import 'package:equatable/equatable.dart';

class LoginRequestDtoUseCase extends Equatable {
  final String phoneNumber;
  final String code;
  final String clientSecret;

  const LoginRequestDtoUseCase({required this.phoneNumber, required this.code, required this.clientSecret});

  @override
  // TODO: implement props
  List<Object?> get props => [
        phoneNumber,
        code,
        clientSecret,
      ];
}
