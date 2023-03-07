library google_places;

import 'package:google_places/src/autocomplete/autocomplete.dart';
import 'package:google_places/src/details/details.dart';
import 'package:google_places/src/photos/photos.dart';
import 'package:google_places/src/query_autocomplete/query_autocomplete.dart';
import 'package:google_places/src/search/search.dart';

export 'package:google_places/src/autocomplete/autocomplete_prediction.dart';
export 'package:google_places/src/autocomplete/autocomplete_response.dart';
export 'package:google_places/src/details/details_response.dart';
export 'package:google_places/src/details/details_result.dart';
export 'package:google_places/src/models/address_component.dart';
export 'package:google_places/src/models/bounds.dart';
export 'package:google_places/src/models/close.dart';
export 'package:google_places/src/models/component.dart';
export 'package:google_places/src/models/debug_log.dart';
export 'package:google_places/src/models/geometry.dart';
export 'package:google_places/src/models/input_type.dart';
export 'package:google_places/src/models/lat_lon.dart';
export 'package:google_places/src/models/location.dart';
export 'package:google_places/src/models/locationbias.dart';
export 'package:google_places/src/models/main_text_matched_substring.dart';
export 'package:google_places/src/models/matched_substring.dart';
export 'package:google_places/src/models/northeast.dart';
export 'package:google_places/src/models/open.dart';
export 'package:google_places/src/models/opening_hours.dart';
export 'package:google_places/src/models/period.dart';
export 'package:google_places/src/models/photo.dart';
export 'package:google_places/src/models/plus_code.dart';
export 'package:google_places/src/models/rank-by.dart';
export 'package:google_places/src/models/review.dart';
export 'package:google_places/src/models/southwest.dart';
export 'package:google_places/src/models/structured_formatting.dart';
export 'package:google_places/src/models/term.dart';
export 'package:google_places/src/models/viewport.dart';
export 'package:google_places/src/search/find_place_response.dart';
export 'package:google_places/src/search/near_by_search_response.dart';
export 'package:google_places/src/search/search_candidate.dart';
export 'package:google_places/src/search/search_result.dart';
export 'package:google_places/src/search/text_search_response.dart';

/// The Places API is a service that returns information about places.
/// Places are defined within this API as establishments, geographic locations, or prominent points of interest.
class GooglePlaces {
  /// [apiKEY] Your application's API key. This key identifies your application.
  final String apiKEY;

  /// [search] returns a list of places based on a user's location or search string.
  late Search search;

  /// [details] returns more detailed information about a specific place, including user reviews.
  late Details details;

  /// [photos] provides access to the millions of place-related photos stored in Google's Place database.
  late Photos photos;

  /// [autocomplete] automatically fills in the name and/or address of a place as users type.
  late Autocomplete autocomplete;

  /// [queryAutocomplete] provides a query prediction service for text-based geographic searches, returning suggested queries as users type.
  late QueryAutocomplete queryAutocomplete;

  /// [timeout] timeout for http call.
  static Duration timeout = Duration(milliseconds: 1500);

  /// Optional headers to pass on each request
  final Map<String, String> headers;

  /// Optional proxy url to web request
  /// Can be formatted as [https:// || http://]host[:<port>][/<path>][?<url-param-name>=]
  /// http proxies are supported, but are not recommended for production use.
  final String? proxyUrl;

  GooglePlaces(
    this.apiKEY, {
    this.headers = const {},
    this.proxyUrl,
  }) {
    this.search = Search(apiKEY, headers, proxyUrl);
    this.details = Details(apiKEY, headers, proxyUrl);
    this.photos = Photos(apiKEY, headers, proxyUrl);
    this.autocomplete = Autocomplete(apiKEY, headers, proxyUrl);
    this.queryAutocomplete = QueryAutocomplete(apiKEY, headers, proxyUrl);
  }
}
