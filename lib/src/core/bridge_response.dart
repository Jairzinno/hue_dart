class BridgeResponse {
  dynamic key;
  List<dynamic> success = [];
  List<dynamic> errors = [];

  BridgeResponse(dynamic response, [String? key]) {
    if (response is List) {
      for (final resultMap in response) {
        if ((resultMap as Map<String, dynamic>).containsKey('success')) {
          success.add(resultMap['success']);
        } else if (resultMap.containsKey('error')) {
          errors.add(resultMap['error']);
        }
      }
      if (key != null) {
        final resultMap = response.first as Map<String, dynamic>;
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
