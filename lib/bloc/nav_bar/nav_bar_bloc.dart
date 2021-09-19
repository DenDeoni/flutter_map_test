import 'package:bloc/bloc.dart';
import 'nav_bar_state.dart';

enum NavBarItems { LIST, MAP }

class NavBarBloc extends Bloc<NavBarItems, NavBarState> {
  NavBarBloc(NavBarState initialState) : super(initialState);

  @override
  Stream<NavBarState> mapEventToState(NavBarItems event) async* {
    switch (event) {
      case NavBarItems.LIST:
        yield ShowList();
        break;
      case NavBarItems.MAP:
        yield ShowMap();
        break;
      default:
        yield ShowList();
        break;
    }
  }
}
