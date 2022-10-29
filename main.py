from flask import Flask

app = Flask(__name__)


@app.route("/")
def hello():
    return "<h1 style='color:lightgreen'>Saturday, October 29th</h1>"


if __name__ == "__main__":
    app.run(host='0.0.0.0')
