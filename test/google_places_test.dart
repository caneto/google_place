import 'package:flutter_test/flutter_test.dart';
import 'package:google_places/google_places.dart';

void main() {
  String apiKey = "Your-Key";
  test('init', () async {
    var googlePlace =
        GooglePlaces(apiKey, proxyUrl: 'cors-anywhere.herokuapp.com');
    expect(googlePlace.apiKEY, apiKey);
    expect(googlePlace.search.apiKEY, apiKey);
    expect(googlePlace.details.apiKEY, apiKey);
    expect(googlePlace.photos.apiKEY, apiKey);
    await googlePlace.photos.get("photoReference", 10, 10);
    expect(googlePlace.autocomplete.apiKEY, apiKey);
    expect(googlePlace.queryAutocomplete.apiKEY, apiKey);
  });
  test('proxies with paths and parameters', () async {
    GooglePlaces googlePlace;
    //try some good proxy urls
    googlePlace = GooglePlaces(apiKey, proxyUrl: 'localhost:6969');
    await googlePlace.autocomplete.get("some place");
    googlePlace = GooglePlaces(apiKey, proxyUrl: 'https://localhost:6969');
    await googlePlace.photos.get("photoReference", 10, 10);
    googlePlace = GooglePlaces(apiKey, proxyUrl: 'https://1.2.3.4/proxy');
    await googlePlace.queryAutocomplete.get("some place");
    googlePlace = GooglePlaces(apiKey,
        proxyUrl: 'https://localhost:6969/proxy/proxy-two/');
    await googlePlace.search.getFindPlace("some place", InputType.TextQuery);
    googlePlace = GooglePlaces(apiKey,
        proxyUrl: 'localhost:6969/proxy/proxy-two?gmapsurl=');
    await googlePlace.autocomplete.get("some place");
    //try a bad hostname
    googlePlace = GooglePlaces(apiKey, proxyUrl: 'localhost:6969******');
    expect(googlePlace.autocomplete.get("some place"), throwsException);
  });
}
