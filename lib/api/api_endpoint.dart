class ApiEndpoint {
  //user
  static const String LOGIN = 'user';
  static const String REGISTER = 'user';

  //task
  static const String TASK = 'task';
  static const String TASK_NEW = 'task';
  static String TASK_DETAIL(String id) => 'task/$id';
  static String TASK_UPDATE(String id) => 'task/$id';
  static String TASK_DELETE(String id) => 'task/$id';
}
