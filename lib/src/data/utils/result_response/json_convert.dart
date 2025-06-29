class JsonConvert {
  static T? fromJson<T>(Map<String, dynamic>? json) {
    if (json == null) return null;

    switch (T) {
      /// TODO: Handle other responses here
      /*case HomepageLayoutResponse:
        return HomepageLayoutResponse.fromJson(json) as T;*/
    }

    return null;
  }
}
