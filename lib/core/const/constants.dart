class Constants {
  static const int appVersionNumber = 100;
  static const String appVersion = '1.0.0';
  static const String empty = "";
  static const int zero = 0;
  static const int apiTimeOut = 60000;
  static const int pageSize = 10;

  static String localeEN = "US";
  static String localen = "en";
  static String localeAR = "AR";
  static String localear = "ar";
}

class FirestoreCollections {
  static const String users = 'users';
  static const String tasks = 'tasks';
  static const String workspace = 'workspace';
  // Add more collections as needed
}

class FeatureNames {
  static const String task = 'Task';
  // Add more features as needed
}

class OperationTypes {
  static const String create = 'create';
  static const String update = 'update';
  static const String delete = 'delete';
}
