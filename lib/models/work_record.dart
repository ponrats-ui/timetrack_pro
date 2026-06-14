class WorkRecord {
  final String id;
  final String date;
  final String checkIn;
  final String checkOut;
  final double otHours;
  final double travelCost;
  final String? note;

  const WorkRecord({
    required this.id,
    required this.date,
    required this.checkIn,
    required this.checkOut,
    required this.otHours,
    required this.travelCost,
    this.note,
  });
}
