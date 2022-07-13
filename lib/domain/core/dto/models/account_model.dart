import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable()
class VMAccount extends Equatable {
  String? userId;
  String? username;
  String? firstName;
  String? lastName;
  String? shopId;
  String? shopName;
  String? clientSecret;

  VMAccount({this.userId, this.username, this.firstName, this.lastName, this.shopId, this.shopName, this.clientSecret});

  factory VMAccount.fromJson(Map<String, dynamic> json) => _$VMAccountFromJson(json);

  Map<String, dynamic> toJson() => _$VMAccountToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        userId,
        username,
        firstName,
        lastName,
        shopId,
        shopName,
        clientSecret,
      ];
}
