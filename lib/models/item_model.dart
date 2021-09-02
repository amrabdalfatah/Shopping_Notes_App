class Items {
  int id;
  int idList;
  String name;
  String quantity;
  String note;

  Items({
    required this.id,
    required this.idList,
    required this.name,
    required this.quantity,
    required this.note,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idList': idList,
      'name': name,
      'quantity': quantity,
      'note': note,
    };
  }
}
