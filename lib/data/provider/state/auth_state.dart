import 'package:equatable/equatable.dart';
import 'package:landlord/data/model/user_model.dart';

// ignore: must_be_immutable
class AuthState extends Equatable {
  late bool isLoading;
  late UserModel userModel;

  init() {
    isLoading = false;
  }

  @override
  List<Object?> get props => [isLoading, userModel];
}
