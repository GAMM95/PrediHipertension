import 'dart:async';

import 'package:predihipertension/Domain/Entities/datatest.dart';
import 'package:predihipertension/Core/Services/methods_firebase.dart';

class TestLogic {
  final MethodsAuth _methodsAuth = MethodsAuth();

  Future<Map<String, String>> construirBody({
    required String edad,
    required String genero,
    required String imc,
    required String saludGeneral,
    required String saludMental,
    required String saludFisica,
    required String dificultadCaminar,
    required String consumoFrutas,
    required String consumoVerduras,
    required String consumoCigarros,
    required String consumoAlcohol,
    required String actividadFisica,
    required String colesterol,
    required String chequeoColesterol,
    required String acv,
    required String diabetes,
    required String enfermedadCardiaca,
  }) async {
    int ageValue = int.tryParse(edad) ?? 0;
    int ageCategory = _convertirEdadACategoria(edad);
    int healthValue = _convertirSaludGeneralANumero(saludGeneral);
    int diabetesValue = _convertirDiabetesANumero(diabetes);

    Map<String, String> body = {
      'Age': ageCategory.toString(),
      'Sex': genero == 'Masculino' ? '0' : '1',
      'BMI': imc,
      'GenHlth': healthValue.toString(),
      'MentHlth': saludMental,
      'PhysHlth': saludFisica,
      'DiffWalk': dificultadCaminar == 'No' ? '0' : '1',
      'Fruits': consumoFrutas == 'No' ? '0' : '1',
      'Veggies': consumoVerduras == 'No' ? '0' : '1',
      'Smoker': consumoCigarros == 'No' ? '0' : '1',
      'HvyAlcoholConsump': consumoAlcohol == 'No' ? '0' : '1',
      'PhysActivity': actividadFisica == 'No' ? '0' : '1',
      'HighChol': colesterol == 'No' ? '0' : '1',
      'CholCheck': chequeoColesterol == 'No' ? '0' : '1',
      'Diabetes': diabetesValue.toString(),
      'Stroke': acv == 'No' ? '0' : '1',
      'HeartDiseaseorAttack': enfermedadCardiaca == 'No' ? '0' : '1',
    };

    // Crear un objeto Datatest con los datos del formulario
    Datatest datatest = Datatest(
      edadIngresada: ageValue,
      edadAgrupada: ageCategory,
      sexo: genero == 'Masculino' ? 0 : 1,
      imc: double.tryParse(imc) ?? 0.0,
      saludGeneral: healthValue,
      saludFisica: int.parse(saludFisica),
      saludMental: int.parse(saludMental),
      dificultadCaminar: dificultadCaminar == 'No' ? 0 : 1,
      consumoFrutas: consumoFrutas == 'No' ? 0 : 1,
      consumoVerduras: consumoVerduras == 'No' ? 0 : 1,
      consumoCigarros: consumoCigarros == 'No' ? 0 : 1,
      consumoAlcohol: consumoAlcohol == 'No' ? 0 : 1,
      actividadFisica: actividadFisica == 'No' ? 0 : 1,
      colesterol: colesterol == 'No' ? 0 : 1,
      chequeoColesterol: chequeoColesterol == 'No' ? 0 : 1,
      acv: acv == 'No' ? 0 : 1,
      diabetes: diabetesValue,
      enfermedadCardiaca: enfermedadCardiaca == 'No' ? 0 : 1,
    );
    await _methodsAuth.guardarTest(datatest: datatest);

    return body;
  }

  int _convertirEdadACategoria(String edad) {
    int ageValue = int.parse(edad);
    if (ageValue >= 18 && ageValue <= 24) {
      return 1;
    } else if (ageValue >= 25 && ageValue <= 29) {
      return 2;
    } else if (ageValue >= 30 && ageValue <= 34) {
      return 3;
    } else if (ageValue >= 35 && ageValue <= 39) {
      return 4;
    } else if (ageValue >= 40 && ageValue <= 44) {
      return 5;
    } else if (ageValue >= 45 && ageValue <= 49) {
      return 6;
    } else if (ageValue >= 50 && ageValue <= 54) {
      return 7;
    } else if (ageValue >= 55 && ageValue <= 59) {
      return 8;
    } else if (ageValue >= 60 && ageValue <= 64) {
      return 9;
    } else if (ageValue >= 65 && ageValue <= 69) {
      return 10;
    } else if (ageValue >= 70 && ageValue <= 74) {
      return 11;
    } else if (ageValue >= 75 && ageValue <= 79) {
      return 12;
    } else if (ageValue >= 80 && ageValue < 100) {
      return 13;
    } else {
      throw ArgumentError('La edad debe ser un valor válido');
    }
  }

  int _convertirSaludGeneralANumero(String saludGeneral) {
    switch (saludGeneral) {
      case 'Excelente':
        return 1;
      case 'Muy bueno':
        return 2;
      case 'Bueno':
        return 3;
      case 'Regular':
        return 4;
      case 'Deficiente':
        return 5;
      default:
        throw ArgumentError('El valor de salud general no es válido');
    }
  }

  int _convertirDiabetesANumero(String diabetes) {
    switch (diabetes) {
      case 'Sin diabetes':
        return 0;
      case 'Prediabetes':
        return 1;
      case 'Diabetes':
        return 2;
      default:
        throw ArgumentError('El valor de diabetes no es válido');
    }
  }

  String getAge(int ageCategory) {
    switch (ageCategory) {
      case 1:
        return '18-24';
      case 2:
        return '25-29';
      case 3:
        return '30-34';
      case 4:
        return '35-39';
      case 5:
        return '40-44';
      case 6:
        return '45-49';
      case 7:
        return '50-54';
      case 8:
        return '55-59';
      case 9:
        return '60-64';
      case 10:
        return '65-69';
      case 11:
        return '70-74';
      case 12:
        return '75-79';
      case 13:
        return '80 o más';
      default:
        return '';
    }
  }

  String getGenderText(int gender) {
    return gender == 0 ? 'Masculino' : 'Femenino';
  }

  String getEducationText(int educationValue) {
    switch (educationValue) {
      case 1:
        return 'Nunca asistió o solo jardín';
      case 2:
        return 'Primaria completa';
      case 3:
        return 'Secundaria incompleta';
      case 4:
        return 'Secundaria completa';
      case 5:
        return 'Educación técnica';
      case 6:
        return 'Universitaria';
      default:
        return '';
    }
  }

  String getIncomeText(int incomeValue) {
    switch (incomeValue) {
      case 1:
        return 'Menos de S/ 10,000';
      case 2:
        return 'Menos de S/ 15,000';
      case 3:
        return 'Menos de S/ 20,000';
      case 4:
        return 'Menos de S/ 25,000';
      case 5:
        return 'Menos de S/ 35,000';
      case 6:
        return 'Menos de S/ 50,000';
      case 7:
        return 'Menos de S/ 55,000';
      case 8:
        return 'Mas de S/ 75,000';
      default:
        return '';
    }
  }

  String getGeneralHealth(int healthValue) {
    switch (healthValue) {
      case 1:
        return 'Excelente';
      case 2:
        return 'Muy bueno';
      case 3:
        return 'Bueno';
      case 4:
        return 'Regular';
      case 5:
        return 'Deficiente';
      default:
        return '';
    }
  }

  String getDiffWalkText(int diffWalk) {
    return diffWalk == 0 ? 'No' : 'Sí';
  }

  String getFruitText(int fruit) {
    return fruit == 0 ? 'No' : 'Sí';
  }

  String getVeggiesText(int veggies) {
    return veggies == 0 ? 'No' : 'Sí';
  }

  String getSmokeText(int smoke) {
    return smoke == 0 ? 'No' : 'Sí';
  }

  String getAlcoholText(int alcohol) {
    return alcohol == 0 ? 'No' : 'Sí';
  }

  String getPhysActivityText(int physActivity) {
    return physActivity == 0 ? 'No' : 'Sí';
  }

  String getCholesterolText(int chol) {
    return chol == 0 ? 'No' : 'Sí';
  }

  String getCheckCholText(int checkChol) {
    return checkChol == 0 ? 'No' : 'Sí';
  }

  String getDiabetesText(int diabetes) {
    switch (diabetes) {
      case 0:
        return 'Sin diabetes';
      case 1:
        return 'Prediabetes';
      case 2:
        return 'Diabetes';
      default:
        return '';
    }
  }

  String getAcvText(int acv) {
    return acv == 0 ? 'No' : 'Sí';
  }

  String getHeartText(int heart) {
    return heart == 0 ? 'No' : 'Sí';
  }
}
