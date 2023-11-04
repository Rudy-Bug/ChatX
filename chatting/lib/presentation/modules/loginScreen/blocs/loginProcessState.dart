import 'package:chatting/data/models/streamModel/loginProcess.dart';
import 'package:equatable/equatable.dart';

class ProcessLoginState extends Equatable {
  const ProcessLoginState._({this.status = ProcessLoginStatus.login});

  const ProcessLoginState.login() : this._();

  const ProcessLoginState.registering()
      : this._(status: ProcessLoginStatus.registering);

  const ProcessLoginState.forgotPassword()
      : this._(status: ProcessLoginStatus.forgot);

  const ProcessLoginState.renewPass()
      : this._(status: ProcessLoginStatus.renewPass);

  @override
  List<Object?> get props => [status];

  final ProcessLoginStatus status;
}
