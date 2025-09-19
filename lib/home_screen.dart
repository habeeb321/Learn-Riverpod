import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Provider for basic read-only value.
    final providerData = ref.watch(readOnly);

    // StateProvider for basic mutable value like int, string, bool.
    final stateProvider = ref.watch(basicMutableState);
    final stateProviderController = ref.read(basicMutableState.notifier);

    // FutureProvider for API calls like async data handling.
    final futureProvider = ref.watch(asyncDataState);

    // StateNotifierProvider for complex logic and customised controllers.
    final stateNotifierProvider = ref.watch(counterNotifierProvider);
    final stateNotifierController = ref.read(counterNotifierProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Provider for basic read-only value.
              Text(providerData),

              // StateProvider for basid mutable value like int, string, bool.
              Column(
                children: [
                  Text(stateProvider.toString()),
                  ElevatedButton(
                    onPressed: () => stateProviderController.state++,
                    child: Text('Increment'),
                  ),
                ],
              ),

              // FutureProvider for API calls like async data handling.
              futureProvider.when(
                data: (data) => Text(data),
                error: (error, stackTrace) => Text('Error: $error'),
                loading: () => CircularProgressIndicator(),
              ),

              // StateNotifierProvider for complex logic and customised controllers.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => stateNotifierController.decrement(),
                    child: Text('Decrement'),
                  ),
                  Text(stateNotifierProvider.toString()),
                  ElevatedButton(
                    onPressed: () => stateNotifierController.increment(),
                    child: Text('Increment'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
