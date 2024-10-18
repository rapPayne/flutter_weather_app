import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/wind_info.dart';

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
    // Setting up theme info
    ThemeData theme = Theme.of(context);
    var tt = theme.textTheme;
    var colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border.all(width: 4.0),
          color: colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            timeString,
            style: tt.bodyLarge?.copyWith(color: colorScheme.primary),
          ),
          Row(
            children: [
              Expanded(
                flex: 50,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  child: Image.network(
                    forecast['icon'],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                flex: 50,
                child: Column(
                  children: [
                    Text(
                        "${forecast['temperature']}${forecast['temperatureUnit']}",
                        style: tt.bodyLarge?.copyWith(fontSize: 60.0)),
                    Text(forecast['shortForecast'], style: tt.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
          Text(forecast['detailedForecast']),
          WindInfo(
            speed: forecast['windSpeed'],
            direction: forecast['windDirection'],
          ),
        ],
      ),
    );
  }
}
