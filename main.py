from flask import Flask

app = Flask(__name__)


@app.route("/")
def hello():
    return "<h1 style='color:blue'>Monday, October 24th - still adjustable.</h1>"


if __name__ == "__main__":
    app.run(host='0.0.0.0')
