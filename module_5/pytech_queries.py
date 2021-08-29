"""
Title: pytech.queries.py
Author: Sarah Duprey
Date: 29 August 2021
Description: Query of student collection
"""

import pymongo
from pymongo import MongoClient


url = "mongodb+srv://admin:admin@cluster0.2dju7.mongodb.net/pytech?retryWrites=true&w=majority"

client = MongoClient(url)

db = client.pytech

students = db.students

student_list = students.find({})

print("\n -- DISPLAYING STUDENT DOCUMENTS FROM find() Query --")

for doc in student_list:
    print(" Student ID: " + doc["student_id"] + "\n First Name: " + doc["first_name"] + "\n Last Name: " + doc["last_name"] + "\n")
   
    ginny = students.find_one({"student_id": "1008"})

    print("\n -- DISPLAYING STUDENT DOCUMENT FROM find_one() QUERY --")
    print(" Student ID: " + ginny["student_id"] + "\n First Name: " + ginny["first_name"] + "\n Last Name: " + ginny["last_name"] + "\n")

    input("\n\n End of program, press any key to continue...")

    
