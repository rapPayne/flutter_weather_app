import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard(this.forecast, {super.key});
  final Map<String, dynamic> forecast;

  @override
  Widget build(BuildContext context) {
    // Convert the date
    DateFormat inFormat = DateFormat('yyyy-MM-ddThh:mm:ssZZZZ');
    formatAsTimeAndDay(DateTime t) => DateFormat('h:mm a EEEE').format(t);
    var startTime = inFormat.parse(forecast['startTime']);
    var endTime = inFormat.parse(forecast['endTime']);
    var timeString =
        '${formatAsTimeAndDay(startTime)} until ${formatAsTimeAndDay(endTime)}';

    var colorScheme = Theme.of(context).colorScheme;
    print(forecast);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          timeString,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: colorScheme.tertiary),
        ),
        Image.network(forecast['icon']),
        Text("${forecast['temperature']}${forecast['temperatureUnit']}"),
        Text(forecast['shortForecast']),
        Text(
            "Wind: ${forecast['windSpeed']} from the ${forecast['windDirection']}"),
        const Text("Humidity"),
        Text(forecast['detailedForecast']),
      ],
    );
  }
}
