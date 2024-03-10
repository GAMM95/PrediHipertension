import 'package:predihipertension/Models/datatest.dart';
impobrt 'package:predihipertension/Services/methods_auth.dart';

class TestLogic {
  final MethodsAuth _methodsAuth = MethodsAuth();

  Future<void> guardarTest({
    required String edad,
    required String genero,
    required String educacion,
    required String ingresos,
    required String imc,
    required String saludGeneral,
    required String saludFisica,
    required String saludMental,
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
    try {
      /// Logica para el atributo edad
      int ageValue = int.tryParse(edad) ?? 0;
      int ageCategory;
      if (ageValue >= 18 && ageValue <= 24) {
        ageCategory = 1;
      } else if (ageValue >= 25 && ageValue <= 29) {
        ageCategory = 2;
      } else if (ageValue >= 30 && ageValue <= 34) {
        ageCategory = 3;
      } else if (ageValue >= 35 && ageValue <= 39) {
        ageCategory = 4;
      } else if (ageValue >= 40 && ageValue <= 44) {
        ageCategory = 5;
      } else if (ageValue >= 45 && ageValue <= 49) {
        ageCategory = 6;
      } else if (ageValue >= 50 && ageValue <= 54) {
        ageCategory = 7;
      } else if (ageValue >= 55 && ageValue <= 59) {
        ageCategory = 8;
      } else if (ageValue >= 60 && ageValue <= 64) {
        ageCategory = 9;
      } else if (ageValue >= 65 && ageValue <= 69) {
        ageCategory = 10;
      } else if (ageValue >= 70 && ageValue <= 74) {
        ageCategory = 11;
      } else if (ageValue >= 75 && ageValue <= 79) {
        ageCategory = 12;
      } else if (ageValue >= 80 && ageValue < 100) {
        ageCategory = 13;
      } else {
        ageCategory = 0;
      }

      /// Logica para el atributo educacion
      int educationValue;
      switch (educacion) {
        case 'Nunca asistió o solo jardín':
          educationValue = 1;
          break;
        case 'Primaria completa':
          educationValue = 2;
          break;
        case 'Secundaria incompleta':
          educationValue = 3;
          break;
        case 'Secundaria completa':
          educationValue = 4;
          break;
        case 'Educación técnica':
          educationValue = 5;
          break;
        case 'Universitaria':
          educationValue = 6;
          break;
        default:
          educationValue = 0;
          break;
      }

      /// Logica para el atributo ingresos
      int incomeValue;
      switch (ingresos) {
        case 'Menos de S/ 10,000':
          incomeValue = 1;
          break;
        case 'Menos de S/ 15,000':
          incomeValue = 2;
          break;
        case 'Menos de S/ 20,000':
          incomeValue = 3;
          break;
        case 'Menos de S/ 25,000':
          incomeValue = 4;
          break;
        case 'Menos de S/ 35,000':
          incomeValue = 5;
          break;
        case 'Menos de S/ 50,000':
          incomeValue = 6;
          break;
        case 'Menos de S/ 75,000':
          incomeValue = 7;
          break;
        case 'Mas de S/ 75,000':
          incomeValue = 8;
          break;
        default:
          incomeValue = 0;
          break;
      }

      /// Lógica para salud general
      int healthValue;
      switch (saludGeneral) {
        case 'Excelente':
          healthValue = 1;
          break;
        case 'Muy bueno':
          healthValue = 2;
          break;
        case 'Bueno':
          healthValue = 3;
          break;
        case 'Regular':
          healthValue = 4;
          break;
        case 'Deficiente':
          healthValue = 5;
          break;
        default:
          healthValue = 0;
          break;
      }

      /// Logica para salud Fisica
      int saludFisicaValue = int.tryParse(saludFisica) ?? 0;

      /// Logica para salud Mental
      int saludMentalValue = int.tryParse(saludMental) ?? 0;

      /// Logica para diabetes
      int diabetesValue;
      switch (diabetes) {
        case 'Sin diabetes':
          diabetesValue = 0;
          break;
        case 'Prediabetes':
          diabetesValue = 1;
          break;
        case 'Diabetes':
          diabetesValue = 2;
          break;
        default:
          diabetesValue = 3;
          break;
      }
      // Crear un objeto Datatest con los datos del formulario
      Datatest datatest = Datatest(
        edadIngresada: ageValue,
        edadAgrupada: ageCategory,
        sexo: genero == 'Masculino' ? 0 : 1,
        educacion: educationValue,
        ingreso: incomeValue,
        imc: double.tryParse(imc) ?? 0.0,
        saludGeneral: healthValue,
        saludFisica: saludFisicaValue,
        saludMental: saludMentalValue,
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

      // Guardar datos del test en Firestore
      await _methodsAuth.guardarTest(datatest: datatest);
    } catch (error) {
      // return algo;
      rethrow;
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
