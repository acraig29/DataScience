import tweepy
import logging
import credentials
import os
import pymongo
import pandas as pd

client_mongo = pymongo.MongoClient(host="mongodb", port=27017)
db = client_mongo.twitter
# BEARER_TOKEN = os.getenv("BEARER_TOKEN")
BEARER_TOKEN = credentials.BEARER_TOKEN
client = tweepy.Client(
    bearer_token=BEARER_TOKEN,
    wait_on_rate_limit=True,
)

response = client.get_user(
    username='campbellclaret',
    user_fields=['created_at', 'description', 'location',
                 'public_metrics', 'profile_image_url', 'geo']
)
user = response.data



#########################
# Get a user's timeline #
#########################
# cursor = tweepy.Paginator(
#     method=client.get_users_tweets,
#     id=user.id,
#     exclude=['replies', 'retweets'],
#     tweet_fields=['author_id', 'created_at', 'public_metrics']
# ).flatten(limit=20)

# for tweet in cursor:
#     print(tweet.text)


#####################
# Search for Tweets #
#####################

search_query = "@campbellclaret  -is:tweet -is:retweet -is:quote lang:en -has:links"

cursor = tweepy.Paginator(
    method=client.search_recent_tweets,
    query=search_query,
    exclude=['replies'],
    max_results=3000,
    count= 100,
    tweet_fields=['author_id', 'created_at', 'public_metrics','location', 'geo']
).flatten(limit=5000)

for tweet in cursor:
    # logging.critical(tweet.text+'\n')
    db.tweets.insert_one(dict(tweet))
    


###################################################
'''
# Replace with your own search query
query2 = 'covid -is:retweet has:media'

tweets2 = client.search_recent_tweets(query=query2, tweet_fields=['context_annotations', 'created_at'],
                                     media_fields=['preview_image_url'], expansions='attachments.media_keys',
                                     max_results=1000)

# Get list of media from the includes object
media = {m["media_key"]: m for m in tweets2.includes['media']}

for tweet2 in tweets2.data:
    attachments = tweet2.data['attachments']
    media_keys = attachments['media_keys']
    #print(tweet.text)
    if media[media_keys[0]].preview_image_url:
        db.med_tweets2.insert_one(  (media[media_keys[0]].preview_image_url) )

'''








    
    
            
        
