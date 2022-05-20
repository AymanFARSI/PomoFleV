import 'package:fluent_ui/fluent_ui.dart';
import 'package:pomoflev/widgets/common/clock_screen.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScaffoldPage(
      header: PageHeader(
        title: Center(
          child: Text('Timer'),
        ),
      ),
      content: ClockWidget(),
    );
  }
}
