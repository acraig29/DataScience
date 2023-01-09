from recommender import *
from utils import *
from flask import Flask,render_template,request
from recommender import recommend_random, recommend_with_NMF
from utils import movies, ratings
import pickle
import sklearn



#with open('./nmf_recommender.pkl', 'rb') as file:
    #model = pickle.load(file)

#QUERY = {12: 4, 92: 5, 177: 4, 196: 5, 891: 4, 1128: 5, 1258: 5, 1320: 4}


app = Flask(__name__)

@app.route('/')
def hello():
    return render_template('index.html',name = 'Alan JS Craig',movies=movies['title'].to_list())

@app.route('/recommendation')
def recommendation():
    user_titles = request.args.getlist("title")
    user_ratings = request.args.getlist("rating")
    user_input = dict(zip(user_titles, user_ratings))
    recs = recommend_with_NMF(movies, ratings, user_input, k=5)
    return render_template('recommendation.html', recs=recs)

if __name__=='__main__': 
    app.run(debug=True)