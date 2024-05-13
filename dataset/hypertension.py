from flask import Flask, request, jsonify, send_from_directory
import pickle
import numpy as np
import os

# Ruta al archivo del modelo entrenado
model_file = 'D:/PrediHipertension/dataset/hypertension_model.pkl'

# Cargar el modelo desde el archivo
with open(model_file, 'rb') as file:
    model = pickle.load(file)

# Inicializar la aplicación Flask
app = Flask(__name__)

# Ruta para servir el icono favicon.ico desde el directorio assets
@app.route('/favicon.ico')
def favicon():
    return send_from_directory(os.path.join(app.root_path, 'assets'), 'favicon.ico', mimetype='image/vnd.microsoft.icon')

# Ruta de inicio
@app.route('/')
def home():
    return "Hola GAMM. Estas haciendo prueba de la API"

# Ruta para realizar la predicción
@app.route('/predict', methods=['GET', 'POST'])
def predict():
    if request.method == 'GET':
        # Procesar los parámetros de la cadena de consulta
        # Obtener los datos de la solicitud GET
        Age = request.args.get('Age')
        Sex = request.args.get('Sex')
        BMI = request.args.get('BMI')
        GenHlth = request.args.get('GenHlth')
        MentHlth = request.args.get('MentHlth')  
        PhysHlth = request.args.get('PhysHlth')
        DiffWalk = request.args.get('DiffWalk')
        Fruits = request.args.get('Fruits')
        Veggies = request.args.get('Veggies')
        Smoker = request.args.get('Smoker')
        HvyAlcoholConsump = request.args.get('HvyAlcoholConsump')
        PhysActivity = request.args.get('PhysActivity')
        HighChol = request.args.get('HighChol')
        CholCheck = request.args.get('CholCheck')
        Diabetes = request.args.get('Diabetes')
        Stroke = request.args.get('Stroke')
        HeartDiseaseorAttack = request.args.get('HeartDiseaseorAttack')
        
        # Convertir los datos a un formato adecuado para la predicción
        input_query = np.array([[Age, Sex, BMI, GenHlth, MentHlth, PhysHlth, DiffWalk, Fruits, Veggies, Smoker, HvyAlcoholConsump, PhysActivity, HighChol, CholCheck, Diabetes, Stroke, HeartDiseaseorAttack]])
        
        # Realizar la predicción
        result = model.predict(input_query)[0]
        
        # Devolver el resultado en formato JSON
        return jsonify({'hypertension': str(result)})
    elif request.method == 'POST':
        # Obtener los datos de la solicitud POST
        Age = request.form.get('Age')
        Sex = request.form.get('Sex')
        BMI = request.form.get('BMI')
        GenHlth = request.form.get('GenHlth')
        MentHlth = request.form.get('MentHlth')  
        PhysHlth = request.form.get('PhysHlth')
        DiffWalk = request.form.get('DiffWalk')
        Fruits = request.form.get('Fruits')
        Veggies = request.form.get('Veggies')
        Smoker = request.form.get('Smoker')
        HvyAlcoholConsump = request.form.get('HvyAlcoholConsump')
        PhysActivity = request.form.get('PhysActivity')
        HighChol = request.form.get('HighChol')
        CholCheck = request.form.get('CholCheck')
        Diabetes = request.form.get('Diabetes')
        Stroke = request.form.get('Stroke')
        HeartDiseaseorAttack = request.form.get('HeartDiseaseorAttack')
        
        # Convertir los datos a un formato adecuado para la predicción
        input_query = np.array([[Age, Sex, BMI, GenHlth, MentHlth, PhysHlth, DiffWalk, Fruits, Veggies, Smoker, HvyAlcoholConsump, PhysActivity, HighChol, CholCheck, Diabetes, Stroke, HeartDiseaseorAttack]])

        # Realizar la predicción
        result = model.predict(input_query)[0]
        
        # Devolver el resultado en formato JSON
        return jsonify({'hypertension': str(result)})
    else:
        # Método no permitido
        return 'Method Not Allowed', 405

if __name__ == '__main__':
    # Ejecutar la aplicación Flask
    app.run(host="0.0.0.0",port=5000, debug=True)
    ## app.run(debug=True)
    ## app.run(debug=True, port=os.getenv("PORT", default=5000))