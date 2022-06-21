class User {
  int? user_id;
  String? user_type;
  String email;
  String password;
  String name;
  String surname;

  User({
    this.user_id,
    this.user_type = "patient",
    required this.email,
    required this.password,
    required this.name,
    required this.surname,
  });

  Map<String, dynamic> toMap() => {
    'type': user_type,
    'email': email,
    'password': password,
    'name': name,
    'surname': surname
  };

  factory User.fromMapForRegister(Map map) {
    return User(
      email: map['email'],
      password: map['password'],
      name: map['name'],
      surname: map['surname']
    );
  }

  factory User.fromMapForLogin(Map map) {
    print('map in the basicUser model class: $map');
    print('type of shop_id: ${map['shop_id'].runtimeType}');
    return User(
      user_id: int.parse(map['user_id']),
      email: map['email'],
      password: '',
      name: map['name'],
      surname: map['surname']
    );
  }

  @override
  String toString() {
    return "name: $name, surname: $surname, user_type: $user_type, email: $email, password: $password";
  }
}
