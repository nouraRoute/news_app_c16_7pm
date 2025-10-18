class NetworkConsts {
  static const String baseUrl = 'https://newsapi.org';
  static const String apiKey = '4f6b7ee3563d42b59f8308c2ff1dfb0e';
  static const String sourcesEndPoint =
      '/v2/top-headlines/sources'; //apikey,category
  static const String newsEndPoint = '/v2/everything'; //apikey,sourcesId
}
