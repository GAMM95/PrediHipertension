// ignore_for_file: file_names
import 'dart:async';

import '../../Core/Services/methods_firebase.dart';
import '../Models/datatest.dart';

class TestLogic {
  final MethodsAuth _methodsAuth = MethodsAuth();

  Future<Map<String, String>> construirBody({
    String? nombre,
    required String edad,
    required String genero,
    required String educacion,
    required String imc,
    required String saludMental,
    required String consumoFrutas,
    required String consumoVerduras,
    required String consumoSal,
    required String consumoCigarros,
    required String consumoAlcohol,
    required String consumoAlcCompulsivo,
    required String actividadFisica,
    required String colesterol,
    required String diabetes,
    required String ataqueCardiaco,
    required String diasSaludMental,
  }) async {
    int ageValue = int.tryParse(edad) ?? 0;
    int ageCategory = _convertirEdadACategoria(edad);
    int educacionValue = _convertirEducacionANumero(educacion);
    int cigarrosValue = _convertirCigarrosANumero(consumoCigarros);
    int diabetesValue = _convertirDiabetesANumero(diabetes);
    int saludMentalValue =
        saludMental == 'Sí' ? int.tryParse(diasSaludMental) ?? 0 : 0;

    Map<String, String> body = {
      'Nombre': nombre ?? '',
      'Age': ageCategory.toString(),
      'Sex': genero == 'Femenino' ? '0' : '1',
      'Education': educacionValue.toString(),
      'BMI': imc,
      'MentHlth': saludMentalValue.toString(),
      'Fruits': consumoFrutas == 'No' ? '0' : '1',
      'Veggies': consumoVerduras == 'No' ? '0' : '1',
      'Salt': consumoSal == 'No' ? '0' : '1',
      'Smoker': cigarrosValue.toString(),
      'Alcohol': consumoAlcohol == 'No' ? '0' : '1',
      'CompulAlc': consumoAlcCompulsivo == 'No' ? '0' : '1',
      'PhysActivity': actividadFisica == 'No' ? '0' : '1',
      'HighChol': colesterol == 'No' ? '0' : '1',
      'Diabetes': diabetesValue.toString(),
      'HeartAttack': ataqueCardiaco == 'No' ? '0' : '1',
    };

    // Crear un objeto Datatest con los datos del formulario
    Datatest datatest = Datatest(
      nombre: nombre.toString(),
      edadIngresada: ageValue,
      edadAgrupada: ageCategory,
      sexo: genero == 'Femenino' ? 0 : 1,
      educacion: educacionValue,
      imc: double.tryParse(imc) ?? 0.0,
      saludMental: saludMentalValue,
      consumoFrutas: consumoFrutas == 'No' ? 0 : 1,
      consumoVerduras: consumoVerduras == 'No' ? 0 : 1,
      consumoSal: consumoSal == 'No' ? 0 : 1,
      consumoCigarros: cigarrosValue,
      consumoAlcohol: consumoAlcohol == 'No' ? 0 : 1,
      consumoAlcCompulsivo: consumoAlcCompulsivo == 'No' ? 0 : 1,
      actividadFisica: actividadFisica == 'No' ? 0 : 1,
      colesterol: colesterol == 'No' ? 0 : 1,
      diabetes: diabetesValue,
      ataqueCardiaco: ataqueCardiaco == 'No' ? 0 : 1,
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

  int _convertirEducacionANumero(String educacion) {
    switch (educacion) {
      case 'Nunca asistió o solo educación inicial':
        return 1;
      case 'Primaria completa':
        return 2;
      case 'Secundaria incompleta':
        return 3;
      case 'Secundaria completa':
        return 4;
      case 'Estudios técnicos o universitarios incompletos':
        return 5;
      case 'Universitaria completa':
        return 6;
      default:
        throw ArgumentError('El valor de educación no es válido');
    }
  }

  // int _convertirSaludGeneralANumero(String saludGeneral) {
  //   switch (saludGeneral) {
  //     case 'Excelente':
  //       return 1;
  //     case 'Muy bueno':
  //       return 2;
  //     case 'Bueno':
  //       return 3;
  //     case 'Regular':
  //       return 4;
  //     case 'Deficiente':
  //       return 5;
  //     default:
  //       throw ArgumentError('El valor de salud general no es válido');
  //   }
  // }

  int _convertirCigarrosANumero(String cigarros) {
    switch (cigarros) {
      case 'Fumo a diario':
        return 1;
      case 'Fumo ocasionalmente':
        return 2;
      case 'He dejado de fumar':
        return 3;
      case 'No fumo':
        return 4;
      default:
        throw ArgumentError('El valor de consumo de cigarro no es válido');
    }
  }

  int _convertirDiabetesANumero(String diabetes) {
    switch (diabetes) {
      case 'No tengo diagnóstico de diabetes':
        return 0;
      case 'Tengo diagnóstico de diabetes':
        return 1;
      case 'No sé':
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
    return gender == 0 ? 'Femenino.' : 'Masculino.';
  }

  String getEducationText(int educationValue) {
    switch (educationValue) {
      case 1:
        return 'Solo completé educación inicial.';
      case 2:
        return 'Solo he completado la educación primaria.';
      case 3:
        return 'No he completado la educación secundaria.';
      case 4:
        return 'Solo he logrado completar la educación secundaria.';
      case 5:
        return 'He cursado de 1 a 3 años en la universidad o instituto técnico.';
      case 6:
        return 'He logrado obtener un título universitario.';
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

  String getFruitText(int fruit) {
    return fruit == 0
        ? 'No he consumido frutas al menos una vez al día.'
        : 'Consumo frutas al menos una vez al día.';
  }

  String getVeggiesText(int veggies) {
    return veggies == 0
        ? 'No he consumido verduras al menos una vez al día.'
        : 'Consumo verduras al menos una vez al día.';
  }

  String getSaltText(int salt) {
    return salt == 0
        ? 'Estoy excediendo en el consumo de sal.'
        : 'Estoy controlando o reduciendo el consumo de sal.';
  }

  String getSmokeText(int smoke) {
    switch (smoke) {
      case 1:
        return 'Fumo a diario.';
      case 2:
        return 'Fumo ocasionalmente.';
      case 3:
        return 'He dejado de fumar.';
      case 4:
        return 'No fumo.';
      default:
        return '';
    }
  }

  String getAlcoholText(int alcohol) {
    return alcohol == 0
        ? 'No he consumido bebidas alcoholicas en los últimos 30 días.'
        : 'Sí he consumido bebidas alcohólicas en los últimos 30 días.';
  }

  String getCompulsiveAlcoholText(int compulsive) {
    return compulsive == 0
        ? 'No me considero un bebedor compulsivo.'
        : 'Sí me considero un bebedor compulsivo.';
  }

  String getPhysActivityText(int physActivity) {
    return physActivity == 0
        ? 'No realizo actividad física.'
        : 'Sí realizo de 30 minutos a mas dioarios de actividad física.';
  }

  String getCholesterolText(int chol) {
    return chol == 0
        ? 'No tengo colesterol elevado en la sangre.'
        : 'Tengo colesterol elevado en la sangre.';
  }

  String getDiabetesText(int diabetes) {
    switch (diabetes) {
      case 0:
        return 'No me han diagnosticado diabetes.';
      case 1:
        return 'Me han diagnosticado diabetes.';
      case 2:
        return 'No me he realizado una prueba de diagnóstico de diabetes.';
      default:
        return '';
    }
  }

  String getHeartText(int heart) {
    return heart == 0
        ? 'No he padecido ataques cardiacos.'
        : 'Sí he padecido ataques cardiacos.';
  }
}
