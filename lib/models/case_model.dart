class LegalCase {
      final int? id;
        final String caseNumber;      // رقم القضية / الدعوى
          final String courtName;       // اسم المحكمة (مثال: محكمة صلح عمان، قصر العدل)
            final String clientName;      // اسم الموكل
              final DateTime hearingDate;   // تاريخ موعد الجلسة
                final String? postponementReason; // سبب تأجيل الجلسة
                  final String? notes;          // ملاحظات إضافية

                    LegalCase({
                        this.id,
                            required this.caseNumber,
                                required this.courtName,
                                    required this.clientName,
                                        required this.hearingDate,
                                            this.postponementReason,
                                                this.notes,
                                                  });

                                                    Map<String, dynamic> toMap() {
                                                        return {
                                                              'id': id,
                                                                    'caseNumber': caseNumber,
                                                                          'courtName': courtName,
                                                                                'clientName': clientName,
                                                                                      'hearingDate': hearingDate.toIso8601String(),
                                                                                            'postponementReason': postponementReason,
                                                                                                  'notes': notes,
                                                                                                      };
                                                                                                        }

                                                                                                          factory LegalCase.fromMap(Map<String, dynamic> map) {
                                                                                                              return LegalCase(
                                                                                                                    id: map['id'],
                                                                                                                          caseNumber: map['caseNumber'],
                                                                                                                                courtName: map['courtName'],
                                                                                                                                      clientName: map['clientName'],
                                                                                                                                            hearingDate: DateTime.parse(map['hearingDate']),
                                                                                                                                                  postponementReason: map['postponementReason'],
                                                                                                                                                        notes: map['notes'],
                                                                                                                                                            );
                                                                                                                                                              }
                                                                                                                                                              }
                                                                                                                                                              
}