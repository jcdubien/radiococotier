import 'dart:ui';

import 'package:flutter/material.dart';

const String kRssUrl = 'https://www.radiococotier.fr/feed/?nocache123';
const String kYoutubeUrl = 'https://www.youtube.com/feeds/videos.xml?channel_id=UCLsLEhM8OksZp1b7aZsqPSQ';
Uri kUri = Uri.parse(kRssUrl);


const kPrimaryColor = Color(0XFFB3B2B7);
const kCategoryColor = Color(0XFF1A1A1A);
const kVideosColor = Color(0XFF7F41FA);
const kRecruitColor = Color(0XFFFF4841);
const kContactColor = Color(0XFF52AD77);
const kDigitalisColor = Color(0XFF1AA5FF);
const TextStyle kDrawerMenuStyle = TextStyle(color: Colors.white,fontSize: 24.0,fontWeight: FontWeight.bold);