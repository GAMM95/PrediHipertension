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
  
  input_query = np.array([[Age, Sex, BMI, GenHlth, MentHlth, PhysHlth, DiffWalk, Fruits, Veggies, Smoker, HvyAlcoholConsump, PhysActivity, HighChol, CholCheck, Diabetes, Stroke, HeartDiseaseorAttack]])

  result = model.predict(input_query)[0]
  
  return jsonify({'hypertension': str(result)})

if __name__ == '__main__':
    app.run(debug=True)
