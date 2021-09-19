import 'package:dactyl_test_app/models/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dactyl_test_app/bloc/restaurant_detail/rest_detail_event.dart';
import 'package:dactyl_test_app/bloc/restaurant_detail/rest_detail_state.dart';
import 'package:dactyl_test_app/providers/rest_detail_data_provider.dart';

class RestDetailBloc extends Bloc<RestDetailEvent, MainState> {
  final RestDetailDataProvider detailDataProvider;
  late RestaurantDetailModel detail;
  late String id;
  late String name;
  late String address;
  late int cost;

  RestDetailBloc(this.detailDataProvider, {required this.id}) : super(LoadingRestDetailState()) {
    _loadData();
  }

  Future _loadData() async {
    final data = await detailDataProvider.getData();
    add(DataLoadedEvent(
      id,
      data,
    ));
    //detail = data;
    id = data.restaurant.id;
    name = data.restaurant.name;
    address = data.restaurant.location.address;
    cost = data.restaurant.averageCostForTwo;
  }

  @override
  Stream<MainState> mapEventToState(RestDetailEvent event) async* {
    if (event is DataLoadedEvent) {
      yield state.copyWith(
          restDetail:
              RestaurantDetailModel(id: id, name: name, address: address, averageCostForTwo: cost));
    }
  }
}
