import 'dart:math';

import 'package:flutter_application_1/riverpod/src/mock_utils/mock_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String userId,
    required String firstName,
    required String lastName,
    required bool isVerified,
  }) = _UserModel;

  static UserModel dummyValues([bool? isVerified]) => UserModel(
        userId: 'no user id',
        firstName: 'no first name',
        lastName: 'no last name',
        isVerified: isVerified ?? false,
      );
  static UserModel mockValue({bool? isVerified}) => UserModel(
        userId: '21345',
        firstName: 'Pedro',
        lastName: 'Celis',
        isVerified: isVerified ?? random.nextBool(),
      );
}
