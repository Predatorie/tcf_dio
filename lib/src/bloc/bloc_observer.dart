import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print('onEvent $event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stacktrace) {
    print('onError $error');
    super.onError(cubit, error, stacktrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('onTransition $transition');
    super.onTransition(bloc, transition);
  }
}
