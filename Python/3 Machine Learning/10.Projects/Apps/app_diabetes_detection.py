import streamlit as st
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import time as ts
from datetime import time
import joblib

# Remove hamburger menu and footer
# Only we need the  name of the class of menu item and footer
st.markdown("""
<style>
.css-erpbzb.edgvbvh3 
{
    visibility: hidden;
}

.css-cio0dv.egzxvld1
{
    visibility: hidden;
}
</style>
""", unsafe_allow_html=True)

def convert_to_number(res):
    return 1 if res=="Yes" or res=="Male" else 0

def convert_to_array(res):
    array = np.zeros(5)
    labels_ = ["current","ever","former","never","not current"]
    index = labels_.index(res.lower())
    array[index] = 1
    return array 

def result_to_string(val):
    return "Risk of developing diabetes" if val[0] == 1 else "No risk of developing diabetes"
        
def main():
    
    # Customize form 
    # ============================================
    st.markdown("<h1 style='text-align: center;'>Diabetes detection</h1>", unsafe_allow_html=True)
    # ============================================
    with st.form("Form 1"): # after submit it will be cleared #, clear_on_submit=True
        # save in variables
        age = st.slider("Age:", max_value=80, value=25, min_value=0)
        col1, col2, col3 = st.columns(3)      # divided into 3 columns
        gender = convert_to_number(col1.radio("Gender:", options=("Male","Female")))
        hypertension = convert_to_number(col2.radio("Hypertension:", options=("Yes","No")))
        heart_disease = convert_to_number(col3.radio("Heart disease:", options=("Yes","No")))
        col_1, col_2 = st.columns(2)  
        label_smoking = ("not current","ever","former","never","current")
        smoking_history = col_1.selectbox("How often do you smoke?", options=label_smoking)
        bmi = col_2.number_input('Body mass index:',min_value=10.0,max_value=35.0)    
        HbA1C_level = col_1.number_input('Hemoglobin A1c:',min_value=1.0,max_value=14.0)
        blood_glucose_level = col_2.number_input('Blood glucose level:',min_value=80.0,max_value=300.0)

        # save in a variable
        s_state = st.form_submit_button("Predict",type="primary")  #  button to submit
    
        if s_state:
            array_smoking_h = convert_to_array(smoking_history)
            #print(array_smoking_h)
            array_2 = np.array([age,hypertension,heart_disease,bmi,HbA1C_level,blood_glucose_level,gender])
            entrada = np.concatenate((array_2, array_smoking_h))
            
            # Load the model
            model = joblib.load('modelo_entrenado.pkl')
            # predict
            result = model.predict([entrada])
            # show de results
            st.info("Results")
            #print(result) 
            if result[0] == 1:
                st.warning(result_to_string(result))
            else:
                st.success(result_to_string(result))


# execute main function
if __name__ == "__main__":
    main()













