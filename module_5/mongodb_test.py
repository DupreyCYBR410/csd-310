"""
Title: mongodb_test.py
Author: Sarah Duprey
Date: 27 August 2021
Description: Test program for connecting to a
              MongoDB Atlas cluster
"""              

import pymongo
from pymongo import MongoClient


url = "mongodb+srv://admin:admin@cluster0.2dju7.mongodb.net/pytech?retryWrites=true&w=majority"

client = MongoClient(url)

db = client.pytech

print("\n -- Pytech COllection List --")
print(db.list_collection_names)

input("\n\n End of program, press and key to exit...")

