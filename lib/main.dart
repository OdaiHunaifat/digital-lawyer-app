import 'package:flutter/material.dart';

void main() {
  runApp(const DigitalLawyerApp());
}

class DigitalLawyerApp extends StatelessWidget {
  const DigitalLawyerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Lawyer',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorSchemeSeed: const Color(0xFF17365D),
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isArabic = true;

  final Color navy = const Color(0xFF142D4E);
  final Color gold = const Color(0xFFC5A45D);

  String t(String ar, String en) => isArabic ? ar : en;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F6F8),
        appBar: AppBar(
          backgroundColor: navy,
          foregroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'DIGITAL LAWYER',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontSize: 19,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  isArabic = !isArabic;
                });
              },
              child: Text(
                isArabic ? 'EN' : 'عربي',
                style: TextStyle(
                  color: gold,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                welcomeCard(),
                const SizedBox(height: 24),

                sectionTitle(t('لوحة التحكم', 'Dashboard')),
                const SizedBox(height: 14),

                LayoutBuilder(
                  builder: (context, constraints) {
                    int columns =
                        constraints.maxWidth > 600 ? 4 : 2;

                    return GridView.count(
                      crossAxisCount: columns,
                      shrinkWrap: true,
                      physics:
                          const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.5,
                      children: [
                        statCard(
                          t('القضايا النشطة', 'Active Cases'),
                          '0',
                          Icons.folder_open,
                        ),
                        statCard(
                          t('الموكلون', 'Clients'),
                          '0',
                          Icons.people,
                        ),
                        statCard(
                          t('جلسات اليوم', "Today's Hearings"),
                          '0',
                          Icons.calendar_month,
                        ),
                        statCard(
                          t('المدد القادمة', 'Upcoming Deadlines'),
                          '0',
                          Icons.timer,
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 25),

                sectionTitle(t('الخدمات القانونية', 'Legal Services')),
                const SizedBox(height: 14),

                LayoutBuilder(
                  builder: (context, constraints) {
                    int columns =
                        constraints.maxWidth > 600 ? 4 : 2;

                    final services = [
                      [Icons.folder, t('إدارة القضايا', 'Cases')],
                      [Icons.people, t('إدارة الموكلين', 'Clients')],
                      [Icons.event, t('الأجندة القضائية', 'Calendar')],
                      [Icons.timer, t('المدد القانونية', 'Deadlines')],
                      [
                        Icons.account_balance_wallet,
                        t('الأتعاب المالية', 'Legal Fees')
                      ],
                      [
                        Icons.menu_book,
                        t('المكتبة القانونية', 'Law Library')
                      ],
                      [
                        Icons.description,
                        t('صياغة اللوائح', 'Legal Drafting')
                      ],
                      [
                        Icons.smart_toy,
                        t('المساعد الذكي', 'AI Assistant')
                      ],
                    ];

                    return GridView.builder(
                      shrinkWrap: true,
                      physics:
                          const NeverScrollableScrollPhysics(),
                      itemCount: services.length,
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.15,
                      ),
                      itemBuilder: (context, index) {
                        return serviceCard(
                          services[index][0] as IconData,
                          services[index][1] as String,
                        );
                      },
                    );
                  },
                ),

                const SizedBox(height: 25),

                sectionTitle(
                  t('آخر التحديثات', 'Recent Activity'),
                ),

                const SizedBox(height: 12),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    t(
                      'لا توجد تحديثات حتى الآن',
                      'No recent activity',
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                Center(
                  child: Text(
                    'DIGITAL LAWYER © 2026',
                    style: TextStyle(
                      color: navy,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget welcomeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(23),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [navy, const Color(0xFF294C70)],
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.balance,
            color: gold,
            size: 38,
          ),
          const SizedBox(height: 15),
          Text(
            t('مرحباً بك في المحامي الرقمي',
                'Welcome to Digital Lawyer'),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 9),
          Text(
            t(
              'مكتبك القانوني الذكي في مكان واحد',
              'Your smart legal office in one place',
            ),
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: navy,
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget statCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: gold, size: 27),
          const SizedBox(height: 7),
          Text(
            value,
            style: TextStyle(
              color: navy,
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
          const SizedBox(height: 4),
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }

  Widget serviceCard(IconData icon, String title) {
    return Card(
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                t('سيتم تطوير هذه الخدمة قريباً',
                    'This service is coming soon'),
              ),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: navy, size: 35),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: navy,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
