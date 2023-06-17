
const String firebaseProductImageUpload='ProductImage';
const String currencySymbol='৳';
const cities = [
  'Dhaka',
  'Chittagong',
  'Rajshahi',
  'Khulna',
  'Barishal',
  'Sylhet',
  'Comilla',
  'Noakhali',
  'Faridpur',
  'Rangpur',
  'Gopalgonj'
];
abstract class orderStatus{
  static const String pending='pending';
  static const String processing='Processing';
  static const String delivered='Delivered';
  static const String cencelled='Cencelled';
  static const String returned='Returned';
}
abstract class paymentMethod{
  static const String cod='Cash on Delivery';
  static const String online='Online';

}

abstract class NotificationType {
  static const String comment = 'New Comment';
  static const String order = 'New Order';
  static const String user = 'New User';
}

//add country coode to below
abstract class countryCode{
  static const String BD='+88';
}

