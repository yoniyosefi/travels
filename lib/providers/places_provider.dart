import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travels/models/place.dart';

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier() : super(const []);
  void addPlace(Place place) {
    state = [place, ...state];
  }
}

final placesProvider = StateNotifierProvider<PlacesNotifier, List<Place>>(
    (ref) => PlacesNotifier());
