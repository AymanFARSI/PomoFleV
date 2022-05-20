// SOMETHING

int computeSeconds(DateTime temp) {
  return temp.minute * 60 + temp.second;
}

DateTime getDateTime({String minutes = '00', String seconds = '00'}) {
  return DateTime.parse('2020-01-01T00:$minutes:$seconds');
}

String getMinutes(DateTime temp) {
  return temp.minute.toString();
}

String getSeconds(DateTime temp) {
  return temp.second.toString();
}