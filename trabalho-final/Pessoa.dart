class Pessoa {
  double peso, altura;
  int idade;
  String sexo;
  double fa;

  Pessoa(this.peso, this.altura, this.idade, this.sexo, this.fa);

  double imc() => peso / (altura * altura);

  double tmb() {
    if (sexo == 'masculino') {
      if (idade > 60) {
        return 13.5 * peso + 487;
      }

      if (idade >= 30) {
        return 8.6 * peso + 879;
      }

      if (idade >= 18) {
        return 15.3 * peso + 679;
      }

      if (idade >= 10) {
        return 17.3 * peso + 746;
      }

      throw Exception('Idade não enquadra nos critérios');
    } else {
      if (idade > 60) {
        return 10.5 * peso + 596;
      }

      if (idade >= 30) {
        return 8.7 * peso + 829;
      }

      if (idade >= 18) {
        return 14.7 * peso + 496;
      }

      if (idade >= 10) {
        return 12.2 * peso + 746;
      }

      throw Exception('Idade não enquadra nos critérios');
    }
  }

  String situacao() {
    var imc = this.imc();

    if (imc > 40) {
      return 'Obeso Mórbido';
    }

    if (imc > 30) {
      return 'Obeso';
    }

    if (imc > 25) {
      return 'Sobre peso';
    }

    if (imc > 20) {
      return 'Peso normal';
    }

    return 'Abaixo do peso';
  }

  double? pesoIdeal() {
    double imc_desejado = this.sexo == 'masculino' ? 22 : 21;

    if (idade >= 65) {
      return imc() * 50 / 100 * (altura * altura);
    }

    if (idade >= 18) {
      return imc_desejado * (altura * altura);
    }

    if (idade >= 3 && idade <= 10) {
      return idade * 2 + 9;
    }

    throw Exception('Idade não enquadra nos critérios');
  }

  double necessidadeEnergetica() {
    return tmb() * fa;
  }
}
