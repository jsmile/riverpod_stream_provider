import 'package:ansicolor/ansicolor.dart';

AnsiPen info = AnsiPen()..black(bold: true);
// ..rgb(r: 0.95, g: 0.95, b: 0.95, bg: true);
AnsiPen success = AnsiPen()..xterm(003, bg: false); // 쑥색
AnsiPen warn = AnsiPen()..magenta(bold: true);
AnsiPen error = AnsiPen()..red(bold: true);
// AnsiPen success = AnsiPen()..xterm(006, bg: false);   // 청록색
// AnsiPen success = AnsiPen()..green(bold: true);       // 초록색
// ..rgb(r: 0.95, g: 0.95, b: 0.95, bg: true);
