import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Map<String, GlobalKey> _sectionKeys = {
    'Home': GlobalKey(),
    'Education': GlobalKey(),
    'Certification': GlobalKey(),
    'Activities': GlobalKey(),
    'Experience': GlobalKey(),
    'Skills': GlobalKey(),
    'Contact': GlobalKey(),
  };

  String _selectedNavItem =
      'Home'; // Define the selected navigation item variable

  void _scrollToSection(String section) {
    final keyContext = _sectionKeys[section]!.currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
        backgroundColor: const Color(0xFFEF9A9A),
        elevation: 0.0, // Remove shadow effect
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(
              96.0), // Set preferred height for the navigation bar
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildNavItem('Home'),
                      buildNavItem('Education'),
                      buildNavItem('Certification'),
                      buildNavItem('Activities'),
                    ],
                  ),
                ),
                const SizedBox(height: 8), // Add spacing between rows
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    // Wrap the Row with Center widget
                    child: Row(
                      children: [
                        buildNavItem('Experience'),
                        buildNavItem('Skills'),
                        buildNavItem('Contact'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Evenly space the sections
          children: [
            _buildHomeSection(),
            _buildEducationSection(),
            _buildCertificationSection(),
            _buildActivitiesSection(),
            _buildExperienceSection(),
            _buildTechnicalSkillsSection(),
            _buildContactSection(),
            const SizedBox(
                height: 20), // Added some space at the end of the body
          ],
        ),
      ),
    );
  }

Widget _buildHomeSection() {
  return Container(
    key: _sectionKeys['Home'],
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: const Color(0xFFFFCDD2),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start, // Align the text to the top
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/qndska.png'), // Adjust the path to your image asset
            ),
          ],
        ),
        SizedBox(height: 40), // Add spacing between image and text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "👋 Hello! I'm Fongnam",
              style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 164, 138, 214),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "I'm interested in web developer, software engineering, and UX/UI designing",
              style: TextStyle(
                fontSize: 11,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "•  🌱 I’m studying in the Faculty of ICT at Mahidol University",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "•  💡 I'm currently learning Flutter and Next.js",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10), // Add spacing between text and the next content
            Text(
              "•  🍀 Check out my experience for some interesting projects!",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


  Widget _buildEducationSection() {
  return Container(
    key: _sectionKeys['Education'],
    padding: const EdgeInsets.all(16.0),
    color: Colors.pink[50], // Change background color to pink
    child: Center(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Education',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ), // Change text color to pink
              ),
              const SizedBox(height: 20), // Added space below the "Education" text
              _buildEducationItem(
                imageAsset: 'assets/rayongwit.png',
                institution: 'Rayongwit School',
                degree: '•  Science-math\n',
                dateRange: '  2014 - 2020',
              ),
              const SizedBox(height: 10), // Added space between education items
              _buildEducationItem(
                imageAsset: 'assets/Mahidol_U.png',
                institution: 'Mahidol University',
                degree: 'Bachelor of Science in Information Technology\n •  Software Engineering\n',
                dateRange: '2021 - 2025 (expected)',
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

  Widget _buildEducationItem(
  {required String imageAsset, required String institution, required String degree, required String dateRange}) {
  return Row(
    children: [
      CircleAvatar(
        radius: 60,
        backgroundImage: AssetImage(imageAsset),
      ),
      SizedBox(width: 20),
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              institution,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              degree,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              dateRange,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    ],
  );
}

  Widget _buildCertificationSection() {
  return Container(
    key: _sectionKeys['Certification'],
    padding: const EdgeInsets.all(16.0),
    color: const Color(0xFFFFEBEE),
    child: Center(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Certification',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
              ),
              SizedBox(height: 20),
              Text(
                'Hackathon: Mu My Mind App Challenge\n',
                style: TextStyle (fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'November 4-6, 2023\n\n'
                '• 1st Place Winner\n\n'
                'The competition revolves around coming up with creative ideas and designing a user-friendly interface (UX/UI) for a mobile app. The goal is to improve the mental well-being of teenagers through this app.\n',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}


  Widget _buildActivitiesSection() {
    return Container(
      key: _sectionKeys['Activities'],
      padding: const EdgeInsets.all(16.0),
      color: const Color(0xFFFFEBEE),
      child: Center(
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Activities',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
                ),
                SizedBox(height: 20),
                Text(
                  'MUICT Welcome Freshman 2022 staff\n',
                  style: TextStyle (fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '•  Be responsible for overseeing various activities and taking care of freshmen.\n',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'MU Ruknong 2022 staff\n',
                   style: TextStyle (fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '•  Be responsible for designing and overseeing games for Mahidol junior year students, ensuring smooth execution.\n',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceSection() {
  return Container(
    key: _sectionKeys['Experience'],
    padding: const EdgeInsets.all(16.0),
    color: const Color(0xFFFFEBEE),
    child: Center(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Experience',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
              ),
              SizedBox(height: 20),
              Text(
                'Lab Assistance, ICT Mahidol University\n',
                 style: TextStyle (fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'January 2024 - Present\n\n'
                '•  Provided guidance and support to students requiring assistance with their programming lab assignments, utilizing expertise in HTML, CSS, JavaScript, and ReactJS.\n',
                ),
                Text(
                'Web programming project, Full stack development\n',
                style: TextStyle (fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                'February 2023 - May 2023\n\n'
                '•  Creating an online Thai Railway website involves using HTML, CSS, and JavaScript for the user interface. Node.js and Express are employed for powerful web services on the back end. Data management is handled with an SQL database for storing and retrieving information about the railway system.\n',
                style: TextStyle(fontSize: 16),
                ),
                Text(
                'Elasticsearch, Haikyuu search system\n',
                style: TextStyle (fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                'September 2023 - December 2023\n\n'
                '•  Developed a search system for Haikyuu characters using Flask and Elasticsearch entails crafting a user-friendly interface.\n',
                style: TextStyle(fontSize: 16),
                ),
                Text(
                'Database management project, Thai Airways\n',
                style: TextStyle (fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                'August 2022 - December 2022\n'
                '•  Developed a database solution with a focus on enhancing organizational efficiency using MySQL, and integrated sample queries specific to Thai Airways to demonstrate its functionality.\n',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

  Widget _buildTechnicalSkillsSection() {
  return Container(
    key: _sectionKeys['Skills'],
    padding: const EdgeInsets.all(16.0),
    color: const Color(0xFFFFEBEE),
    child: Center(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Skills',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.code),
                title: Text(
                  'Programming Languages: C, C++, Python, Java, Dart',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                leading: Icon(Icons.web),
                title: Text(
                  'Web Development: HTML, CSS, JavaScript, ReactJS, Node.js, Flutter, Next.js',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                leading: Icon(Icons.storage),
                title: Text(
                  'Database Management: MySQL',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                leading: Icon(Icons.devices_other),
                title: Text(
                  'Others: Git, Docker',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

  Widget _buildContactSection() {
  return Center(
    child: Container(
      key: _sectionKeys['Contact'],
      padding: const EdgeInsets.all(8.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Contact',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.phone,
                    size: 18,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '083-075-3204',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Icon(
                Icons.email,
                size: 18,
                color: Colors.black,
              ),
              const SizedBox(width: 5),
              InkWell(
                onTap: () async {
                  final Uri _emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'sasasuang_pat@hotmail.com',
                  );
                  final String _emailLaunchUriString = _emailLaunchUri.toString();
                  if (await canLaunch(_emailLaunchUriString)) {
                    await launch(_emailLaunchUriString);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not launch email')));
                  }
                },
                child: Text(
                  'sasasuang_pat@hotmail.com',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(height: 10), // Added SizedBox for spacing
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center the LinkedIn icon
            children: [
              Icon(
                Icons.link,
                size: 18,
                color: Colors.black,
              ),
              SizedBox(width: 5), // Add spacing between icon and text
              Text(
                'linkedin.com/in/sasasuang-pattanakitjaroenchai/',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

  Widget buildNavItem(String text) {
    return TextButton(
      onPressed: () {
        _scrollToSection(text);
        setState(() {
          _selectedNavItem = text;
        });
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return _selectedNavItem == text ? Colors.pink : Colors.black;
          },
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return Colors.transparent;
          },
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
              horizontal: 20.0), // Add horizontal padding to the buttons
        ),
      ),
      child: Text(text),
    );
  }
}
