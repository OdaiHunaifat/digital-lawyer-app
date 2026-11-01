import 'package:flutter/material.dart';

void main() {
  runApp(const DigitalLawyerApp());
}

const navy = Color(0xFF142D4E);
const gold = Color(0xFFC5A45D);

class DigitalLawyerApp extends StatelessWidget {
  const DigitalLawyerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DIGITAL LAWYER',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: navy,
        scaffoldBackgroundColor: const Color(0xFFF5F6F8),
        fontFamily: 'Arial',
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: navy,
          foregroundColor: Colors.white,
          title: const Text(
            'DIGITAL LAWYER',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'مرحباً بك في أجندة المحامي الرقمية',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: navy,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'إدارة أعمالك القانونية من مكان واحد',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.15,
                  children: [
                    serviceCard(
                      context,
                      'القضايا',
                      Icons.folder_open,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CasesPage(),
                          ),
                        );
                      },
                    ),
                    serviceCard(
                      context,
                      'الموكلون',
                      Icons.people,
                      () => comingSoon(context),
                    ),
                    serviceCard(
                      context,
                      'الأجندة القضائية',
                      Icons.calendar_month,
                      () => comingSoon(context),
                    ),
                    serviceCard(
                      context,
                      'المدد القانونية',
                      Icons.timer,
                      () => comingSoon(context),
                    ),
                    serviceCard(
                      context,
                      'الأتعاب والمدفوعات',
                      Icons.account_balance_wallet,
                      () => comingSoon(context),
                    ),
                    serviceCard(
                      context,
                      'المكتبة القانونية',
                      Icons.menu_book,
                      () => comingSoon(context),
                    ),
                    serviceCard(
                      context,
                      'صياغة اللوائح',
                      Icons.description,
                      () => comingSoon(context),
                    ),
                    serviceCard(
                      context,
                      'المساعد الذكي',
                      Icons.smart_toy,
                      () => comingSoon(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget serviceCard(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: gold.withOpacity(0.5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 35, color: navy),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: navy,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void comingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('سيتم تطوير هذه الخدمة قريباً')),
    );
  }
}

class CasesPage extends StatefulWidget {
  const CasesPage({super.key});

  @override
  State<CasesPage> createState() => _CasesPageState();
}

class _CasesPageState extends State<CasesPage> {
  final List<Map<String, String>> cases = [];

  void addCase() {
    final numberController = TextEditingController();
    final clientController = TextEditingController();
    final courtController = TextEditingController();
    final subjectController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('إضافة قضية جديدة'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  field(numberController, 'رقم القضية'),
                  field(clientController, 'اسم الموكل'),
                  field(courtController, 'المحكمة'),
                  field(subjectController, 'موضوع القضية'),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: const Text('إلغاء'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (numberController.text.trim().isEmpty ||
                      clientController.text.trim().isEmpty) {
                    return;
                  }

                  setState(() {
                    cases.add({
                      'number': numberController.text.trim(),
                      'client': clientController.text.trim(),
                      'court': courtController.text.trim(),
                      'subject': subjectController.text.trim(),
                    });
                  });

                  Navigator.pop(dialogContext);
                },
                child: const Text('حفظ القضية'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget field(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إدارة القضايا'),
          backgroundColor: navy,
          foregroundColor: Colors.white,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: addCase,
          backgroundColor: navy,
          foregroundColor: Colors.white,
          icon: const Icon(Icons.add),
          label: const Text('إضافة قضية'),
        ),
        body: cases.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.folder_open, size: 65, color: gold),
                    SizedBox(height: 15),
                    Text(
                      'لا توجد قضايا حتى الآن',
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'اضغط على إضافة قضية للبدء',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: cases.length,
                itemBuilder: (context, index) {
                  final item = cases[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: navy,
                        child: Icon(Icons.folder, color: Colors.white),
                      ),
                      title: Text(
                        'قضية رقم ${item['number']}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'الموكل: ${item['client']}\n'
                        'المحكمة: ${item['court']}\n'
                        'الموضوع: ${item['subject']}',
                      ),
                      isThreeLine: true,
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            cases.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
