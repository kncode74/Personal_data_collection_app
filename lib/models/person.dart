class DataPeople {
  String idcard; //รหัสประจำตัวประชาชน
  String names; //ชื่อนามสกุล
  String nickname; //ชื่อเล่น
  String birthDay;
  String phone;

  String numberHouse; //เลขที่บ้าน
  String tombon; //ตำบล
  String aomphe; //อำเภอ
  String province; //จังหวัด
  String id;

  DataPeople({
    required this.idcard,
    required this.names,
    required this.nickname,
    required this.birthDay,
    required this.phone,
    required this.numberHouse,
    required this.tombon,
    required this.aomphe,
    required this.province,
    required this.id,
  });
}
