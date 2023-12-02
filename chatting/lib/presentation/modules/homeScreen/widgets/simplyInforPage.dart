import 'package:chatting/core/themes/constantColor.dart';
import 'package:chatting/data/models/streamModel/homeStream.dart';
import 'package:chatting/domain/entities/user.dart';
import 'package:chatting/presentation/modules/homeScreen/blocs/homeScreenBloc.dart';
import 'package:chatting/presentation/modules/homeScreen/blocs/homeScreenEvent.dart';
import 'package:chatting/presentation/modules/homeScreen/blocs/homeScreenState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SimplyInformationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      height: MediaQuery.of(context).size.width / 10 * 2.4,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: BlocBuilder<HomeScreenBloc,HomeScreenState>(builder: (context, state) {
        return state.status.isInProgress ? Center(child: CircularProgressIndicator(),) :   Row(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            padding: EdgeInsets.all(2),
            child: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/img/avatar/avatar0${state.user!.image}.jpg'),
              // AssetImage('assets/img/avatar/avatar0${user.image}.jpg'),
              radius: 35.0,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Container()),
              Text(
                "Minh Hiếu",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              // SizedBox(height: 3,) ,
              // ("id:${user.code_id}"
              Text("iđ:0000", style: TextStyle(fontSize: 16)),
              Expanded(child: Container()),
            ],
          ),
          Expanded(child: Container()),
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                shape: BoxShape.rectangle,
                color: AppColors.blueLight_02),
            child: Icon(
              Icons.settings,
              size: 28,
              color: AppColors.white,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 22, 0),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                shape: BoxShape.rectangle,
                color: AppColors.blueLight_02),
            child: const Icon(
              Icons.notifications,
              size: 28,
              color: AppColors.white,
            ),
          ),
        ],
      ); 
      },)
    );
 
  }
  
}
