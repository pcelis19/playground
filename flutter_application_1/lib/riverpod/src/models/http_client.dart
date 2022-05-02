class HttpClient {
  final Map<String, dynamic> headers;

  const HttpClient._(this.headers);

  ///
  factory HttpClient.authenticated({required String userId}) =>
      HttpClient._({'userId': userId});

  ///
  factory HttpClient.unauthenticated() => const HttpClient._({});
}
