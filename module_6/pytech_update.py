"""
Title: pytech_update.py
Author: Sarah Duprey
Date: September 4, 2021
Description: Update in Pytech Collection
"""

import pymongo
from pymongo import MongoClient

url = "mongodb+srv://admin:admin@cluster0.2dju7.mongodb.net/pytech?retryWrites=true&w=majority"

client = MongoClient(url)

db = client.pytech
db.student.find()

students = db.students

student_list = students.find({})

print("\n --DISPLAYING STUDENTS DOCUMENTS FROM find() QUERY --")

for doc in student_list:
    print(" Student ID " + doc["student_id"] + "\n First Name: " + doc["first_name"] + "\n Last Name: " + doc["last_name"] + "\n ")

result = students.update_one({"student_id": "1009"}, {"$set": {"last_name": "Potter II"}})

lily = students.find_one({"student_id": "1009"})

print("\n --DISPLAYING STUDENT DOCUMENT 1009 --")
print(" Student ID " + lily["student_id"] + "\n First Name: " + lily["first_name"] + "\n Last Name: " + lily["last_name"] + "\n ")

    
input("\n\n End of program, press any key to continue...")
