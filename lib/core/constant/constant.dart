import 'package:flutter/material.dart';

List<String> retryAlternatives = [
  "သင့်အဖြေ မှားယွင်းနေပါသည်"
  /*  "Oops, give it another shot!",
  "Not quite right, another attempt!",
  "Keep trying, you've got this!",
  "Almost there, one more go!",
  "Oops, that's not it. Give another shot!",
  "No worries, another try!",
  "Give it another go!",
  "Close, but not quite. One more attempt!",
  "You're on the right track, give another shot!",
  "Don't give up, try once more!",
  "Missed it by a bit, another go!",
  "Retry for success!",
  "Second chance—go ahead!",
  "Another attempt, please!",
  "You're so close, go for it again!",
  "Let's give it another shot!",
  "Another try, another chance!",
  "Retry and conquer!",
  "You can do it! Go again.",
  "Mistakes happen, try once more!",
  "Go again to master it!" */
];

List<String> successAlternatives = [
  "သင့်အဖြေ မှန်ကန်ပါသည်"
  /* "Great job! Keep it up",
  "Well done! Keep going",
  "Excellent! Onward",
  "Awesome! Move forward",
  "Correct! Next step",
  "Perfect! Keep progressing",
  "Right on! Keep advancing",
  "You got it! Keep moving",
  "Bravo! Keep on",
  "Nicely done! Continue on",
  "That's right! Press forward",
  "Spot on! Keep it rolling",
  "Nailed it! Keep pushing",
  "You're correct! Proceed",
  "Good going! Keep it up",
  "Fantastic! Keep playing",
  "Way to go! Keep going",
  "Bingo! Keep advancing",
  "Precisely! Keep going strong",
  "That's it! Keep it flowing", */
];

List<String> completeQuizTitleAlternatives = [
  'Congratulations!',
  'Well Done!',
  'Quiz Completed!',
  'Mission Accomplished!',
  'Quiz Master!'
];
List<String> completeQuizDescriptionAlternatives = [
  'You have successfully completed the entire quiz, answering all the questions and showcasing your knowledge. Your dedication and effort have paid off!',
  'By answering all the questions in this quiz, you\'ve demonstrated your expertise and commitment to learning. Your achievement is commendable!',
  'You\'ve journeyed through all the questions, displaying your understanding and proficiency in the subject matter. You\'ve reached the end with flying colors!',
  'Your determination and knowledge shine as you conquer every question in the quiz. You\'ve completed the mission with excellence!',
  'Through your consistent effort and accurate responses, you\'ve proven your mastery of the quiz content. Your accomplishment is truly impressive!'
];

const selectRactangle = "Select-Rectangle";
const selectCircle = "Select-Circle";

const baseUrl = "https://mm-to-thai-idac.onrender.com/api";
const auth = "/auth";
const login = "/auth/login";
const register = "/auth/register";
const level = "/levels";
const classscope = "/classscopes";
const lesson = "/lessons";
const content = "/contents";
const question = "/questions";
const List<Color> colors = [
  Color(0XFFFF5364),
  Color(0XFF2EB118),
  Color(0XFF1843B1),
  Color(0XFFB15818),
];

const String falseMp3 = "audio/false.mp3";
const String trueMp3 = "audio/true.mp3";
