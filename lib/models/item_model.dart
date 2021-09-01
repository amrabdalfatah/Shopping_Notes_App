class Items {
  final int id;
  final int idList;
  final String name;
  final String quantity;
  final String note;

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
