
import 'package:chatting/data/mock/mockChatBoxUser.dart';
import 'package:chatting/core/themes/constantColor.dart';
import 'package:chatting/domain/entities/modalChatBoxUser.dart';
import 'package:chatting/domain/entities/user.dart';
import 'package:chatting/presentation/modules/homeScreen/blocs/homeScreenBloc.dart';
import 'package:chatting/presentation/modules/homeScreen/blocs/homeScreenEvent.dart';
import 'package:chatting/presentation/modules/homeScreen/blocs/homeScreenState.dart';
import 'package:chatting/presentation/modules/homeScreen/widgets/modalChatBox.dart';
import 'package:chatting/presentation/modules/homeScreen/widgets/simplyInforPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class HomeScreenMock extends StatefulWidget {
  const HomeScreenMock({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreenMock> {
  final listModel = MocChatBoxUser.mockChatBoxUser;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // HomeScreenBloc.convertStoragetoModel() ;
    return BlocProvider(
        create: (context) {
          return HomeScreenBloc();
        },
        child: HomeScreenPage());
  }
}

class HomeScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<HomeScreenBloc>().add(LoadingData()); // load data
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.blueLight_01,
          child: const Icon(
            Icons.search,
            size: 28,
            color: AppColors.white,
          ),
          onPressed: () {},
        ),
        backgroundColor: AppColors.blueLight_01, // Màu mạc địh
        body: Stack(
          children: [
            Container(
                height: MediaQuery.sizeOf(context).height ,
                width: MediaQuery.sizeOf(context).width ,
                color: AppColors.whiteGrey_01,
                child: Image.asset(
                  'assets/img/background_home.jpg',
                  fit: BoxFit.fill,
                )),
            Column(

              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 70,
                ),
                  SimplyInformationWidget() ,  
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
                    builder: (context, state) {
                      return state.status.isInProgress
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(55),
                                    topRight: Radius.circular(55)),
                              ),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: state.userRelevant?.length,
                                itemBuilder: (context, index) {
                                  User user = state.userRelevant![index];
                                  ModalUserChatBox model = ModalUserChatBox(
                                      imageUrl: user.image,
                                      textBundle:
                                          "Ê đi ăn bún bò không fen? $index",
                                      time: "8:30",
                                      userName: user.name,
                                      isYoursText: false);
                                  return ModelChatBox(
                                    userModel: model,
                                  );
                                },
                              ));
                    },
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
