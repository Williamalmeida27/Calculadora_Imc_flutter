class ImcRepository {
  String retornoImc(double peso, double altura) {
    var imc = calcularImc(peso, altura);
    var tabelaImc = '';

    switch (imc) {
      case < 16:
        tabelaImc = "Magreza grave";
        break;
      case >= 16 && < 17:
        tabelaImc = "Magreza moderada";
        break;
      case >= 17 && < 18.5:
        tabelaImc = "Magreza leve";
        break;
      case >= 18.5 && < 25:
        tabelaImc = "Saudável";
        break;
      case >= 25 && < 30:
        tabelaImc = "Sobrepeso";
        break;
      case >= 30 && < 35:
        tabelaImc = "Obesidade grau I";
        break;
      case >= 35 && < 40:
        tabelaImc = "Obesidade grau II (severa)";
        break;
      case >= 40:
        tabelaImc = "Obesidade grau III (mórbida)";
        break;
      default:
        return "Nenhum valor retornado";
    }
    return tabelaImc;
  }

  double calcularImc(double peso, double altura) {
    double imcCalculado = peso / (altura * 2);
    String imcCalculadoDecimal = imcCalculado.toStringAsFixed(2);
    return double.parse(imcCalculadoDecimal);
  }
}
