
const String addressFieldAddressLine1='addressLine1';
const String addressFieldAddressLine2='addressLine2';
const String addressFieldCity='city';
const String addressFieldZipcode='zipcode';

class AddressModel{
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? zipcode;

  AddressModel({
    required this.addressLine1,
    this.addressLine2,
    required this.city,
    required this.zipcode
  });

  Map<String,dynamic>toMap(){
    return <String,dynamic>{
      addressFieldAddressLine1:addressLine1,
      addressFieldAddressLine2:addressLine2,
      addressFieldCity:city,
      addressFieldZipcode:zipcode,
    };
  }

  factory AddressModel.fromMap(Map<String,dynamic>map)=>AddressModel(
      addressLine1: map[addressFieldAddressLine1],
      addressLine2:map[addressFieldAddressLine2],
      city: map[addressFieldCity],
      zipcode: map[addressFieldZipcode],
  );
}