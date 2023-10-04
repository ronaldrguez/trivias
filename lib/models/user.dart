import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Freezed(toJson: true)
class User with _$User {

  const factory User({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'password') String? password,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static get generateId {
    const uuid = Uuid();
    return uuid.v4();
  }
}