from flask import Flask, request, jsonify
import pickle
import numpy as np

# Carga el modelo correctamente
# model = pickle.load('dataset/hypertension_model.pkl', 'rb')

model_file = 'dataset/hypertension_model.pkl'
with open(model_file, 'rb') as file:
    model = pickle.load(file)
    
app = Flask(__name__)

@app.route('/')
def home():
    return "Hola GAMM"

@app.route('/predict', methods=['POST'])
def predict():
  age = request.form.get('Age')
  sex = request.form.get('Sex')
  bmi = request.form.get('BMI')
  genHlth = request.form.get('GenHlth')
  mentHlth = request.form.get('MentHlth')  
  physHlth = request.form.get('PhysHlth')
  diffWalk = request.form.get('DiffWalk')
  fruits = request.form.get('Fruits')
  veggies = request.form.get('Veggies')
  smoker = request.form.get('Smoker')
  hvyAlcoholConsump = request.form.get('HvyAlcoholConsump')
  physActivity = request.form.get('PhysActivity')
  highChol = request.form.get('HighChol')
  cholCheck = request.form.get('CholCheck')
  diabetes = request.form.get('Diabetes')
  stroke = request.form.get('Stroke')
  heartDiseaseorAttack = request.form.get('HeartDiseaseorAttack')
  
  input_query = np.array([[age, sex, bmi, genHlth, mentHlth, physHlth, diffWalk, fruits, veggies, smoker, hvyAlcoholConsump, physActivity, highChol, cholCheck, diabetes, stroke, heartDiseaseorAttack]])

  result = int(model.predict(input_query)[0])
  
  return jsonify({'hypertension': result})

if __name__ == '__main__':
    app.run(debug=True)
