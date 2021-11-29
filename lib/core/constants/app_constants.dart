class ApiConstants {
  static ApiConstants _instance = ApiConstants._init();
  static ApiConstants get instance => _instance;
  ApiConstants._init();

  static const String BASE_URL = "https://task-21.herokuapp.com/";

  //USER
  static const String INDEX = "index";
  static const String STORE = "store";
  static const String SHOW = "show";
}
