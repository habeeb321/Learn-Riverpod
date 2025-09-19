import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providerData = ref.watch(readOnly);
    final stateProvider = ref.watch(basicMutableState);
    final stateProviderController = ref.read(basicMutableState.notifier);
    final futureProvider = ref.watch(asyncDataState);
    final stateNotifierProvider = ref.watch(counterNotifierProvider);
    final stateNotifierController = ref.read(counterNotifierProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(providerData),
              Column(
                children: [
                  Text(stateProvider.toString()),
                  ElevatedButton(
                    onPressed: () => stateProviderController.state++,
                    child: Text('Increment'),
                  ),
                ],
              ),
              futureProvider.when(
                data: (data) => Text(data),
                error: (error, stackTrace) => Text('Error: $error'),
                loading: () => CircularProgressIndicator(),
              ),
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
