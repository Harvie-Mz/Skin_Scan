# from model import predict
from flask import Flask, request
import random
import string
import base64
import io
from PIL import Image



#model imports

import tensorflow as tf
import numpy as np
import os
from PIL import Image
from flask_ngrok import run_with_ngrok

import random
import string
import base64
import tensorflow_hub as hub


def predict(img):

    # import img
    # img =Image.open('1.jpg')

    # Read an image from a file into a numpy array
    img = np.array(img)
    # # Convert to float32
    img = tf.cast(img, tf.float32)
    # # Resize to 224x224 (size the model is expecting)
    img = tf.image.resize(img, [224, 224])
    # # Expand img dimensions from (224, 224, 3) to (1, 224, 224, 3) for set_tensor method call
    img = np.expand_dims(img, axis=0)

    export_path = './tf_models/1691968447'
    reloaded = tf.keras.models.load_model(export_path, custom_objects={
                                          'KerasLayer': hub.KerasLayer})

    # Prediction

    val = reloaded.predict(img)
    global prediction
    if val == 0:
        prediction = 'Eczema'
    else:
        prediction = 'Vitiligo'
    print(prediction)
    d = {}
    d['output'] = prediction
    return d





app = Flask(__name__)


@app.route('/', methods=['GET','POST'])
def hello_world():
        global data,Image_data,result
        if request.method == 'POST':
         data = request.get_json(force=True)
         Image_data = data['image']
         Image_data = base64.b64decode(Image_data)
         Image_data = Image.open(io.BytesIO(Image_data))

        result = predict(Image_data)
       
        return result


if __name__ == '__main__':
#     app.run()
    app.run(port=443, host='0.0.0.0')

