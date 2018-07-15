class BridgeResponse {
  dynamic key;
  List<String> success = [];
  List<String> errors = [];

  BridgeResponse(dynamic response, [String key]) {
    if (response is List) {
      for (Map<String, dynamic> resultMap in response) {
        if (resultMap.containsKey('success')) {
          success.add(resultMap['success']);
        } else if (resultMap.containsKey('error')) {
          errors.add(resultMap['error']);
        }
      }
      if (key != null) {
        Map<String, dynamic> resultMap = response.first;
        if (resultMap.containsKey('success')) {
          this.key = resultMap['success'][key];
        }
      }
    }
  }

  @override
  String toString() {
    return 'Key: $key. Success: $success. Error: $errors';
  }
}
