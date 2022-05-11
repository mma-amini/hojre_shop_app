import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable()
class VMAccount extends Equatable {
  String? UserId;
  String? Username;
  String? FirstName;
  String? LastName;
  String? ShopId;
  String? ShopName;

  VMAccount({this.UserId, this.Username, this.FirstName, this.LastName, this.ShopId, this.ShopName});

  factory VMAccount.fromJson(Map<String, dynamic> json) => _$VMAccountFromJson(json);

  Map<String, dynamic> toJson() => _$VMAccountToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        UserId,
        Username,
        FirstName,
        LastName,
        ShopId,
        ShopName,
      ];
}
