class Post {
  int _userId;
  int _id;
  String _title;
  String _body;

  Post(this._userId, this._id, this._title, this._body);

  String get body => _body;
  set body(String value) {
    _body = value;
  }

  String get title => _title;
  set title(String value) {
    _title = value;
  }

  int get userId => _userId;
  set userId(int value) {
    _userId = value;
  }

  int get id => _id;
  set id(int value) {
    _id = value;
  }
  
  //Usando shared preferences para persistir dados
  //var  prefs = await SharedPreferences.getInstance();
  //prefs.setString("tokenjwt", mapResponse["token"]);

  //var prefs = await SharedPreferences.getInstance();
  //String token = (prefs.getString("tokenjwt") ?? "")

  //var header = {
   // "Content-Type": "application/json",
   // "Autorization": "Bearer $token"
  //};
  
  
  
}
