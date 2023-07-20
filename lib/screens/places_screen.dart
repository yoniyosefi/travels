import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travels/providers/places_provider.dart';
import 'package:travels/screens/add_place_screen.dart';
import 'package:travels/widgets/places_list.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var places = ref.watch(placesProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Places'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const AddPlaceScreen();
                    },
                  ));
                },
                icon: const Icon(Icons.add)),
          ],
        ),
        body: PlacesList(
          places: places,
        ));
  }
}
