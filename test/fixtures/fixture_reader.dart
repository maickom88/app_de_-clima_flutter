import 'dart:io';

String fixtureFile() =>
    File('test/fixtures/weather_city.json').readAsStringSync();

String fixtureString() => """ {
    "coord": {
        "lon": -39.12,
        "lat": -8.07
    },
    "weather": [{
        "id": 800,
        "main": "Clear",
        "description": "céu limpo",
        "icon": "01d"
    }],
    "base": "stations",
    "main": {
        "temp": 28.32,
        "feels_like": 23.78,
        "temp_min": 28.32,
        "temp_max": 28.32,
        "pressure": 1014,
        "humidity": 36,
        "sea_level": 1014,
        "grnd_level": 967
    },
    "visibility": 10000,
    "wind": {
        "speed": 7.28,
        "deg": 128
    },
    "clouds": {
        "all": 0
    },
    "dt": 1599484431,
    "sys": {
        "country": "BR",
        "sunrise": 1599467670,
        "sunset": 1599510875
    },
    "timezone": -10800,
    "id": 3389860,
    "name": "Salgueiro",
    "cod": 200
} """;
