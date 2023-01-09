import time
import pymongo
import logging
import pandas as pd
from sqlalchemy import create_engine
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer
time.sleep(10)

mongo_client = pymongo.MongoClient(host="mongodb", port=27017)
postgres_client = create_engine('postgresql://postgres:postgres@postgresdb:5432/sentiments', echo=True)

def extract():
    db = mongo_client.twitter
    entries = []
   

    for tweet in db.tweets.find():
        entries.append(tweet["text"])
    
    return entries
'''    
 ###extract media content from tweet   
def extract2():
    db = mongo_client.twitter
    entries2 = []
    for tweet in db.med_tweets2.find():
        entries2.append(tweet["text"])

    return entries2
'''

def transform(entries):
    sentiments = []
    for entry in entries:
        s = SentimentIntensityAnalyzer()
        score = s.polarity_scores(entry)["compound"]
        sentiments.append({"tweet": entry,
                           "score": score})
    return sentiments



def load(sentiments):
    postgres_client.execute(
        """
        CREATE TABLE IF NOT EXISTS tweets (
            text VARCHAR(1000),
            sentiment NUMERIC(1,4)
        );
        """
    )
    for sentiment in sentiments:
        query = "INSERT INTO tweets VALUES (%s, %s);"
        postgres_client.execute(query, (sentiment["tweet"], sentiment["score"]))


load(transform(extract()))