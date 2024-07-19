import pandas as pd
from ms import model

def predict(X, model):
    prediction = model.predict(X)[0]
    return prediction

def get_model_response(json_data):
    # Check the type of json_data
    print("Type of json_data:", type(json_data))
    
    # Convert JSON data to DataFrame
    X = pd.DataFrame(json_data)
    
    # Check DataFrame content
    print("DataFrame content:", X)
    
    # Ensure correct prediction
    prediction = predict(X, model)
    
    # Map prediction to label
    if prediction == 1:
        label = "M"
    else:
        label = "B"
    
    return {
        'status': 200,
        'label': label,
        'prediction': int(prediction)
    }
