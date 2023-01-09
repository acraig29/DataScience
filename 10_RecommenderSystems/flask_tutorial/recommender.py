"""
Contains various recommondation implementations
all algorithms return a list of movieids
"""

import pandas as pd
import numpy as np
from utils import lookup_movieId, match_movie_title
from sklearn.decomposition import NMF
movies = pd.read_csv("C:/Users/lisbo/flask_tutorial/data/movies.csv", index_col=0)
from scipy.sparse import csr_matrix


def recommend_random(movies, user_rating, k=5):
    """
    return k random unseen movies for user 
    """
    user = pd.DataFrame(user_rating, index=[0])
    user_t = user.T.reset_index()
    user_movie_entries = list(user_t["index"])
    movie_titles = list(movies["title"])
    intended_movies = [match_movie_title(title, movie_titles) for title in user_movie_entries]
    
    # convert these movies to intended movies and convert them into movie ids
    recommend = movies.copy()
    recommend = recommend.reset_index()
    recommend = recommend.set_index("title")
    recommend.drop(intended_movies, inplace=True)
    random_movies = np.random.choice(list(recommend.index), replace=False, size=k)
    return random_movies  



def recommend_with_NMF(movies, ratings, user_input, k=5):
    """
    NMF Recommender
    INPUT
    OUTPUT
    - a list of movieIds
    """
    user = pd.DataFrame(user_input, index=["rating"])
    user = user.transpose().reset_index()
    user = user.rename(columns={'index': 'title'})
    user_movies = movies.loc[movies['title'].isin(user['title'])]

    # initialization - impute missing values  
    R = ratings.pivot(index='userId',columns='movieId',values='rating')
    R.fillna(0, inplace=True)

    # transform user vector into hidden feature space
    user_vec = pd.DataFrame(np.zeros(R.shape[1]), columns=['user_rating'], index=R.columns)
    user_vec['user_rating'].loc[list(user_movies.index)] = list(user['rating']) 
    # Define model
    model = NMF(n_components=55, init='nndsvd', max_iter=1000, tol=0.01, verbose=2)
    model.fit(R)
    # inverse transformation
    scores = model.inverse_transform(model.transform(user_vec.transpose()))

    # build a dataframe
    scores = pd.Series(scores[0],index=R.columns)

    # remove from the list the movies that have been watched
    scores.drop(list(user_movies.index), inplace=True)
    recommendations = scores.sort_values(ascending=False).head(k)
    return movies['title'].loc[recommendations.index]

def recommend_with_user_similarity(user_item_matrix, user_rating, k=5):
    pass