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
        Education = request.args.get('Education')
        BMI = request.args.get('BMI')
        MentHlth = request.args.get('MentHlth')  
        Fruits = request.args.get('Fruits')
        Veggies = request.args.get('Veggies')
        Salt = request.args.get('Salt')
        Smoker = request.args.get('Smoker')
        Alcohol = request.args.get('Alcohol')
        CompulAlc = request.args.get('CompulAlc')
        PhysActivity = request.args.get('PhysActivity')
        HighChol = request.args.get('HighChol')
        Diabetes = request.args.get('Diabetes')
        HeartAttack = request.args.get('HeartAttack')
        
        # Convertir los datos a un formato adecuado para la predicción
        input_query = np.array([[Age, Sex, Education, BMI, MentHlth, Fruits, Veggies, Salt, Smoker, Alcohol, CompulAlc, PhysActivity, HighChol, Diabetes, HeartAttack]])
        
        # Realizar la predicción
        result = model.predict(input_query)[0]
        
        # Devolver el resultado en formato JSON
        return jsonify({'hypertension': str(result)})
    elif request.method == 'POST':
        # Obtener los datos de la solicitud POST
        Age = request.form.get('Age')
        Sex = request.form.get('Sex')
        Education = request.form.get('Education')
        BMI = request.form.get('BMI')
        MentHlth = request.form.get('MentHlth')  
        Fruits = request.form.get('Fruits')
        Veggies = request.form.get('Veggies')
        Salt = request.form.get('Salt')
        Smoker = request.form.get('Smoker')
        Alcohol = request.form.get('Alcohol')
        CompulAlc = request.form.get('CompulAlc')
        PhysActivity = request.form.get('PhysActivity')
        HighChol = request.form.get('HighChol')
        Diabetes = request.form.get('Diabetes')
        HeartAttack = request.form.get('HeartAttack')
        
        # Convertir los datos a un formato adecuado para la predicción
        input_query = np.array([[Age, Sex, Education, BMI, MentHlth, Fruits, Veggies, Salt, Smoker, Alcohol, CompulAlc, PhysActivity, HighChol, Diabetes, HeartAttack]])

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