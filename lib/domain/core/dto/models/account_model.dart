import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable()
class VMAccount extends Equatable {
  String? UserID;
  String? Username;
  String? FirstName;
  String? LastName;

  VMAccount({this.UserID, this.Username, this.FirstName, this.LastName});

  factory VMAccount.fromJson(Map<String, dynamic> json) => _$VMAccountFromJson(json);

  Map<String, dynamic> toJson() => _$VMAccountToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
