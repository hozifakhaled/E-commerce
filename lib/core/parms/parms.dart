class Sinupparams {
  final String email;
  final String password;

  Sinupparams({required this.email, required this.password});
}

class CategoryParams {
  final String id;
  final String category;

  CategoryParams( {required this.category,
    required this.id,
  });
}

class SoldParams {
  final String id;
  final int remaining;
  final int sold;
  SoldParams( {
    required this.id, required this. remaining, required this. sold,
  });
}

class ProfileParams {
  final String id;

  ProfileParams({
    required this.id,
  });
}
