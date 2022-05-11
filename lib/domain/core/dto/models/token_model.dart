import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class VMToken extends Equatable {
  final String? AccessToken;
  final String? RefreshToken;
  final String? TokenType;
  final int? ExpiresIn;
  final int? ExpiresOn;

  VMToken({this.AccessToken, this.RefreshToken, this.TokenType, this.ExpiresIn, this.ExpiresOn});

  factory VMToken.fromJson(Map<String, dynamic> json) => _$VMTokenFromJson(json);

  Map<String, dynamic> toJson() => _$VMTokenToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        AccessToken,
        AccessToken,
        TokenType,
        ExpiresIn,
        ExpiresOn,
      ];
}
