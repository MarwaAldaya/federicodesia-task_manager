import 'package:bloc_arch/features/splash/presentation/blocs/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial());

  void startTimer() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(SplashState.success());
  }
}
