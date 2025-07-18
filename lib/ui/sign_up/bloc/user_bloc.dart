import 'package:ecomm_368/data/remote/repository/user_repo.dart';
import 'package:ecomm_368/utils/constants/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecomm_368/ui/sign_up/bloc/user_event.dart';
import 'package:ecomm_368/ui/sign_up/bloc/user_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository userRepo;

  UserBloc({required this.userRepo}) : super(UserInitialState()) {
    on<UserRegisterEvent>((event, emit) async{
      emit(UserLoadingState());
      try {
        dynamic mData = await userRepo.signUpUser(
            name: event.name,
            mobNo: event.mobNo,
            email: event.email,
            pass: event.pass);
        
        if(mData["status"]){
          emit(UserSuccessState());
        } else {
          emit(UserFailureState(errorMsg: mData['message']));
        }
        
      } catch (e) {
        emit(UserFailureState(errorMsg: e.toString()));
      }
    });

    on<UserLoginEvent>((event, emit) async{
      emit(UserLoadingState());

      try{
        dynamic mData = await userRepo.loginUser(email: event.email, pass: event.pass);

        if(mData['status']){
          ///store user token
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(AppConstants.prefUserToken, mData["tokan"]);
          emit(UserSuccessState());
        } else {
          emit(UserFailureState(errorMsg: mData["message"]));
        }

      } catch (e){
        emit(UserFailureState(errorMsg: e.toString()));
      }

    });
  }

}