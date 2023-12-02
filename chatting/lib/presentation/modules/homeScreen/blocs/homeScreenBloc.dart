import 'package:chatting/data/provider/convertToJson.dart';
import 'package:chatting/domain/entities/user.dart';
import 'package:chatting/presentation/modules/homeScreen/blocs/homeScreenEvent.dart';
import 'package:chatting/presentation/modules/homeScreen/blocs/homeScreenState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  late final List<User> listUser;
  late final User user;
  HomeScreenBloc() : super(HomeScreenState()) {
    on<LoadingData>(onLoadingPage);
  }
  Future<void> onLoadingPage(
      LoadingData event, Emitter<HomeScreenState> emit) async {
    if (state.user == null) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      ConvertToJson jsonConvertering = ConvertToJson();
      final storage = await jsonConvertering.convertStoragetoModel();
      this.listUser = storage['listUserRelevant'];
      this.user = storage['user'];
      print("ADDD" + this.user.toString()) ; 
      await Future.delayed(Duration(seconds: 1), () {});
       emit(state.copyWith(
        user: this.user ,
        userRelevant: this.listUser ,
        status: FormzSubmissionStatus.success)) ; 
    }
  }

  void onChatBoxUserTap(
      OnChatBoxUserTap event, Emitter<HomeScreenState> emit) {}

  void onSearchUser(OnSearchUser event, Emitter<HomeScreenState> emit) {}

  void onSettingClick(OnSettingClick event, Emitter<HomeScreenState> emit) {}
}
