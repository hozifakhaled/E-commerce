class CheckoutEntitiey {
  final String email;
  final String state;
  final String price;
  final String city;
  final String street;
  final bool iscash;
  final String postalCode;

  CheckoutEntitiey(this.iscash, 
      {required this.email,
      required this.state,
      required this.price,
      required this.city,
      required this.street,
      required this.postalCode});
}
