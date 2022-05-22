import 'package:pomoflev/variables/variables.dart';

double computeCircleProgress() {
  if (isBreak.value && currentRound.value == roundsValue.value) {
    return computeSeconds(currentTime.value) /
        computeSeconds(longBreakValue.value);
  } else if (isBreak.value && currentRound.value != roundsValue.value) {
    return computeSeconds(currentTime.value) /
        computeSeconds(shortBreakValue.value);
  } else {
    return computeSeconds(currentTime.value) /
        computeSeconds(focusValue.value);
  }
}

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
