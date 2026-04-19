class Doctor {
  final String name;
  final String specialization;
  final String prefixType;
  final String? description;

  const Doctor({
    required this.name,
    required this.specialization,
    required this.prefixType,
    this.description,
  });
}
