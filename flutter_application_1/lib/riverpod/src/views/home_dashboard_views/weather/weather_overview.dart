import 'package:flutter/material.dart';
import 'package:flutter_application_1/riverpod/src/routing/app_router.dart';
import 'package:flutter_application_1/riverpod/src/utils/extensions.dart';
import 'package:go_router/go_router.dart';

class WeatherOverviewView extends StatelessWidget {
  const WeatherOverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Quick Links',
          style: context.textTheme.headline2,
        ),
        Expanded(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 353),
            children: const [
              CityWeatherIcon(
                initials: 'LA',
                label: 'Los Angeles',
              ),
              CityWeatherIcon(
                initials: 'SD',
                label: 'San Diego',
              ),
              CityWeatherIcon(
                initials: 'SF',
                label: 'San Francisco',
              ),
              CityWeatherIcon(
                initials: 'NY',
                label: 'New York',
              ),
              CityWeatherIcon(
                initials: 'SEA',
                label: 'Seattle',
              ),
              CityWeatherIcon(
                initials: 'ATX',
                label: 'Austin',
              ),
              CityWeatherIcon(
                initials: 'ERR',
                label: 'Throws Errors',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CityWeatherIcon extends StatelessWidget {
  final String initials;
  final String label;
  const CityWeatherIcon({
    Key? key,
    required this.initials,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: 250,
        child: TextButton(
          onPressed: () => context
              .goNamed(AppRouter.weatherNamed, params: {'cityName': label}),
          style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: AspectRatio(
              aspectRatio: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 24,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          initials,
                          style: context.textTheme.headline1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(label),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
