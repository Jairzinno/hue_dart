class Rule {
  /// Human readable name of the rule.
  String name;

  String lastTriggered;

  String creationTime;

  int timesTriggered;

  String owner;

  String status;

  List<Condition> conditions;

  List<Action> actions;
}

class Condition {
  String address;
  String operator;
  String value;
}

class Action {
  String address;
  String method;
  String body;
}
