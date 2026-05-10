from flask import Flask, make_response, request

app = Flask(__name__)

@app.route("/")
def index():
    username = request.cookies.get('username', None)
    if username is None:
        return "Welcome! You are not logged in.\n"
    else:
        return f"Welcome {username}!\n"

@app.route('/user/<username>')
def show_user(username):
    resp = make_response(f"You are logged in as {username}\n")
    resp.set_cookie('username', username)
    return resp
