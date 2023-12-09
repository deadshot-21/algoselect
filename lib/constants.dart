import 'dart:ui';

var kHeader = const Color(0xff004840);
var kText = const Color(0xffffffff);
var kButton = const Color(0xfff25830);
const String imagePath = 'assets/images/';

const List answers = [
  ["High", "Low"],
  ["Fast", "Moderate", "Slow"],
  ["Easy", "Moderate", "Hard"],
  [
    "Military Communications",
    "Online Banking",
    "Secure Communications",
    "Personal Projects",
    "Financial Institutions",
    "Software Development",
    "Sensitive Data Encryption",
    "File and Folder Encryption",
    "Cloud Storage",
    "Network Protocols",
    "Password Hashing",
    "File Encryption",
    "Disk Encryption",
    "Email Encryption",
    "Secure Shell"
  ],
  ["High", "Moderate"],
  ["High", "Moderate"],
  [56, 112, 128, 168, 192, 256, "adaptive"],
  [128, 64],
  [
    "Brute-force Attack",
    "Differential Attack",
    "Related-key Attack",
    "Sweet32 Attack",
    "Meet-in-the-Middle Attack",
    "Truncated Differential Cryptanalysis",
    "Impossible Differential Attack",
    "Side-channel Attack",
    "Second-order Differential Attack",
    "Weak Key Attack",
    "Known-plaintext Attack"
  ]
];

const List questions = [
  'What level of security do you require? Are there any known vulnerabilities you need to avoid?',
  'How quickly do you need the algorithm to encrypt and decrypt data? Is speed a crucial factor for your use case?',
  'Do you have the resources and expertise to implement complex algorithms, or do you need something that is easy to implement?',
  'What is your specific use case? Some algorithms are better suited for certain applications than others.',
  'Do you need an algorithm that can be adapted for different uses and applications, or do you have a specific use case in mind?',
  'Will the amount of data you need to encrypt increase over time? If so, how well does the algorithm scale with increasing data size?',
  'How secure do you need the encryption to be? Larger keys generally provide more security, but they can also slow down the algorithm.',
  'What is the size of the data blocks that you will be working with? Does your data naturally fit into a certain block size?',
  'Are there specific types of attacks you are concerned about? Different algorithms have different vulnerabilities.'
];

String baseUrl = "https://algoselect-api.onrender.com/";

List responses = [];

Map empirical_time = {
  'AES': '491 Bytes/sec',
  'DES': '835 Bytes/sec',
  '3DES': '292 Bytes/sec',
  'IDEA': '-',
  'TWOFISH': '-',
  'BLOWFISH': '1036 Bytes/sec',
};

Map links = {
  'AES': 'https://github.com/SergeyBel/AES',
  'DES': 'https://github.com/fffaraz/cppDES',
  '3DES': 'https://github.com/fffaraz/cppDES',
  'IDEA':
      'https://github.com/bgreenlee/PassKeeper/blob/master/CRYPTLIB/IDEA/IDEA.C',
  'TWOFISH': 'https://github.com/rageworx/libtwofish',
  'BLOWFISH': 'https://github.com/ddokkaebi/Blowfish',
};

int numberOfQuestions = 0;
