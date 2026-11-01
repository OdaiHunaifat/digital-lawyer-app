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
title: 'Digital Lawyer App',
theme: ThemeData(
useMaterial3: true,
colorSchemeSeed: const Color(0xFF17365D),
fontFamily: 'Arial',
),
home: const HomePage(),
);
}
}

class HomePage extends StatelessWidget {
const HomePage({super.key});

@override
Widget build(BuildContext context) {
return Directionality(
textDirection: TextDirection.rtl,
child: Scaffold(
backgroundColor: const Color(0xFFF4F6FA),
appBar: AppBar(
backgroundColor: const Color(0xFF17365D),
foregroundColor: Colors.white,
title: const Text(
'Digital Lawyer',
style: TextStyle(fontWeight: FontWeight.bold),
),
centerTitle: true,
),
body: SingleChildScrollView(
padding: const EdgeInsets.all(16),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Container(
width: double.infinity,
padding: const EdgeInsets.all(22),
decoration: BoxDecoration(
color: const Color(0xFF17365D),
borderRadius: BorderRadius.circular(18),
),
child: const Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'مرحباً بك في المحامي الرقمي',
style: TextStyle(
color: Colors.white,
fontSize: 21,
fontWeight: FontWeight.bold,
),
),
SizedBox(height: 10),
Text(
'منصتك الذكية لإدارة أعمالك القانونية',
style: TextStyle(
color: Colors.white70,
fontSize: 14,
),
),
],
),
),
const SizedBox(height: 25),
const Text(
'الخدمات القانونية',
style: TextStyle(
fontSize: 20,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 15),
GridView.count(
crossAxisCount: 2,
shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
crossAxisSpacing: 12,
mainAxisSpacing: 12,
childAspectRatio: 1.15,
children: const [
ServiceCard(
icon: Icons.folder_open,
title: 'إدارة القضايا',
),
ServiceCard(
icon: Icons.people,
title: 'الموكلون',
),
ServiceCard(
icon: Icons.calendar_month,
title: 'الأجندة القضائية',
),
ServiceCard(
icon: Icons.timer,
title: 'المدد القانونية',
),
ServiceCard(
icon: Icons.account_balance_wallet,
title: 'الأتعاب المالية',
),
ServiceCard(
icon: Icons.menu_book,
title: 'المكتبة القانونية',
),
ServiceCard(
icon: Icons.description,
title: 'صياغة اللوائح',
),
ServiceCard(
icon: Icons.smart_toy,
title: 'المساعد القانوني الذكي',
),
],
),
],
),
),
),
);
}
}

class ServiceCard extends StatelessWidget {
final IconData icon;
final String title;

const ServiceCard({
super.key,
required this.icon,
required this.title,
});

@override
Widget build(BuildContext context) {
return Card(
elevation: 2,
color: Colors.white,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(16),
),
child: InkWell(
borderRadius: BorderRadius.circular(16),
onTap: () {},
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
icon,
size: 36,
color: const Color(0xFF17365D),
),
const SizedBox(height: 12),
Padding(
padding: const EdgeInsets.symmetric(horizontal: 5),
child: Text(
title,
textAlign: TextAlign.center,
style: const TextStyle(
fontSize: 14,
fontWeight: FontWeight.bold,
),
),
),
],
),
),
);
}
}
