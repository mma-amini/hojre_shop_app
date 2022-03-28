import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'confirm_response_dto_use_case.g.dart';

@JsonSerializable()
class ConfirmResponseDtoUseCase extends Equatable {
  final TokenOfConfirmResponseDtoUseCase? Token;

  ConfirmResponseDtoUseCase({this.Token});

  factory ConfirmResponseDtoUseCase.fromJson(Map<String, dynamic> json) => _$ConfirmResponseDtoUseCaseFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmResponseDtoUseCaseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

@JsonSerializable()
class TokenOfConfirmResponseDtoUseCase extends Equatable {
  final String? AccessToken;
  final String? RefreshToken;
  final String? TokenType;
  final int? ExpiresIn;
  final int? ExpiresOn;

  TokenOfConfirmResponseDtoUseCase(
      {this.AccessToken, this.RefreshToken, this.TokenType, this.ExpiresIn, this.ExpiresOn});

  factory TokenOfConfirmResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$TokenOfConfirmResponseDtoUseCaseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenOfConfirmResponseDtoUseCaseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
