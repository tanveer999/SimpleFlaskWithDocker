from flask import Flask, jsonify
from flask_cors import CORS, cross_origin

app = Flask(__name__)
# CORS(app)  # Enable CORS for all origins
# Allow CORS only for specific domains
CORS(app, resources={r"/*": {"origins": ["example.com", "example1.com"]}})

# Sample data
tasks = [
    {"id": 1, "title": "Task 1", "completed": False},
    {"id": 2, "title": "Task 2", "completed": True},
]

# Endpoint to fetch tasks (no CORS handling yet)
@app.route('/tasks/', methods=['GET'])
@cross_origin()
def get_tasks():

    response = jsonify(tasks)
    # Enable Access-Control-Allow-Origin
    # response.headers.add("Access-Control-Allow-Origin", "example.com")
    return response

# Endpoint to add a new task (no CORS handling yet)
@app.route('/tasks', methods=['POST'])
def add_task():
    new_task = {"id": len(tasks) + 1, "title": "New Task", "completed": False}
    tasks.append(new_task)
    return jsonify(new_task), 201

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=80)