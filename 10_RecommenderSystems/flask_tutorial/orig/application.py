from flask import Flask
from simple_recommender import get_recommendations

app = Flask(__name__)

@app.route('/')
def index():

    return """<h1>Hello, World!</h1>
              <p>This is a <br>line break</p>
              <a href="https://www.lyrics.com">Go to the lyrics site!</a>
              <br>
              <a href="/recommender">Get movie recommendations!</a>
           """


@app.route('/recommender')
def recommender():

    top3 = get_recommendations()
    return f'{top3}'




if __name__ == "__main__":
    app.run(debug=True, port=5000)


