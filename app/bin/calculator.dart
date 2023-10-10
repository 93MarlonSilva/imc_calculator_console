import 'package:app/main.dart' as calc;

void main() {
  calc.inicio();
  while (!calc.validRetorno) {
    calc.end();
  }
}
