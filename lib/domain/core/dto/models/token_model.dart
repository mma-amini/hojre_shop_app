import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class VMToken extends Equatable {
  final String? accessToken;
  final String? refreshToken;
  final String? tokenType;
  final int? expiresIn;
  final int? expiresOn;

  const VMToken({this.accessToken, this.refreshToken, this.tokenType, this.expiresIn, this.expiresOn});

  factory VMToken.fromJson(Map<String, dynamic> json) => _$VMTokenFromJson(json);

  Map<String, dynamic> toJson() => _$VMTokenToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        accessToken,
        accessToken,
        tokenType,
        expiresIn,
        expiresOn,
      ];
}
