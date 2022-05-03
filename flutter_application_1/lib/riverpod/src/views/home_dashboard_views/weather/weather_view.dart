import 'package:flutter/material.dart';
import 'package:flutter_application_1/riverpod/src/models/weather.dart';
import 'package:flutter_application_1/riverpod/src/providers/repo_providers.dart';
import 'package:flutter_application_1/riverpod/src/utils/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherView extends ConsumerWidget {
  final FutureProvider<Weather> futureProvider;
  WeatherView({
    Key? key,
    required String cityName,
  })  : futureProvider = FutureProvider(
          (ref) => ref.read(weatherRepoProvider).getWeatherOfCity(cityName),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final futureState = ref.watch(futureProvider);
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: TextButton(
            child: const Text('Go Back'),
            onPressed: Navigator.of(context).pop,
          ),
        ),
        Expanded(
          child: futureState.when(
            data: (data) => _WeatherData(weather: data),
            error: (error, stackTrace) =>
                _WeatherError(error: error, stackTrace: stackTrace),
            loading: () => const _WeatherLoading(),
          ),
        ),
      ],
    );
  }
}

class _WeatherData extends StatelessWidget {
  final Weather weather;
  const _WeatherData({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${weather.celciusToString}°',
              style: context.textTheme.headline1,
            ),
            const SizedBox(height: 8),
            Text(weather.cityName)
          ],
        ),
      ),
    );
  }
}

class _WeatherLoading extends StatelessWidget {
  const _WeatherLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _WeatherError extends StatelessWidget {
  final Object error;
  final StackTrace? stackTrace;
  const _WeatherError({
    Key? key,
    required this.error,
    required this.stackTrace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(error.toString()),
        const SizedBox(height: 8),
        TextButton(
          child: const Text('More Details'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Details'),
                content:
                    SingleChildScrollView(child: Text(stackTrace.toString())),
                actions: [
                  TextButton(
                    onPressed: Navigator.of(context).pop,
                    child: const Text('Close'),
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
