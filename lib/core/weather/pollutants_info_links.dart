class PollutantsInfoLinks {
  final mapLinks = {
    "co": "https://en.wikipedia.org/wiki/Carbon_monoxide",
    "no": "https://en.wikipedia.org/wiki/Nitric_oxide",
    "no2": "https://en.wikipedia.org/wiki/Nitrogen_dioxide",
    "03": "https://en.wikipedia.org/wiki/Ozone",
    "so2": "https://en.wikipedia.org/wiki/Sulfur_dioxide",
    "pm2_5": "https://en.wikipedia.org/wiki/Particulates",
    "pm10":
        "https://en.wikipedia.org/wiki/Particulates#Size,_shape,_and_solubility_matter",

    "nh3": "https://en.wikipedia.org/wiki/Ammonia",
  };

  String? getURL(String component){
    return mapLinks[component];
  }
}
