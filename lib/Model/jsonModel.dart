class JsonModel{
  String? hospitalName;
  String? hospitalAddress;
  double? rating;
  String? number;
  
  JsonModel({
    this.hospitalName,
    this.hospitalAddress,
    this.rating,
    this.number
  });


  JsonModel.fromJson(Map<String,dynamic> json){
    hospitalName = json['hospital_name'];
    hospitalAddress = json['hospital_address'];
    rating = json['rating'];
    number = json['phone_number'];
  }
}