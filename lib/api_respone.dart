class ApiRespone<T> {
  T data;
  bool error;
  String errorMassage;

  ApiRespone({this.data,this.errorMassage,this.error = false});
}
