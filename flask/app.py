from flask import Flask


# connect flask to firebase
import firebase_admin
from firebase_admin import credentials, firestore

cred = credentials.Certificate("firebase.json")
firebase_admin.initialize_app(cred)
db = firestore.client()
print("connected to firebase")



app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"



def get_breakfast(uid):
    return "eggs, bacon, and toast"

def get_lunch(uid):
    return "a sandwich"

def get_dinner(uid):
    return "a salad"

routes = {
    "/breakfast": get_breakfast,
    "/lunch": get_lunch,
    "/dinner": get_dinner
}

if __name__ == "__main__":
    app.run(debug=True, port=5005)