import pymongo
from pymongo import MongoClient

# MongoDB connection string
url = "mongodb+srv://admin:admin@cluster0.2dju7.mongodb.net/pytech?retryWrites=true&w=majority"

# connect to MongoDB cluster
client = MongoClient(url)

# connect to pytech database
db = client.pytech

# show the connection collections
print("\n -- Pytech COllection List --")
print(db.list_collection_names)

# show an exit message
input("\n\n End of program, press and key to exit...")

