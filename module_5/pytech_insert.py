"""
Title: pytech_insert.py
Author: Sarah Duprey
Date: 27 August 2021
Description: Inserting new documents into Student Collection
"""

import pymongo
from pymongo import MongoClient


url = "mongodb+srv://admin:admin@cluster0.2dju7.mongodb.net/pytech?retryWrites=true&w=majority"

client = MongoClient(url)

db = client.pytech

"""Student Documents"""
luna = {
    "student_id": "1007",
    "first_name": "Luna",
    "last_name": "Lovegood",
    "enrollments": [
        {
            "term": "Winter",
            "gpa": "3.2",
            "start_date": "January 5, 2020",
            "end_date": "March 30, 2020",
            "courses": [
                {
                    "course_id": "CYBR410",
                    "description": "Database Security",
                    "instructor": "Professor Smith",
                    "grade": "A"
                },
                {
                    "course_id": "ENG200",
                    "description": "English Comp 2",
                    "instructor": "Professor Smith",
                    "grade": "B-"
                }
            ]
        }
    ]
}

ginny = {
    "student_id": "1008",
    "first_name": "Ginny",
    "last_name": "Weasley",
    "enrollments": [
        {
            "term": "Winter",
            "gpa": "3.5",
            "start_date": "January 5, 2020",
            "end_date": "March 30, 2020",
            "courses": [
                {
                    "course_id": "CYBR410",
                    "description": "Database Security",
                    "instructor": "Professor Smith",
                    "grade": "A-"
                },
                {
                    "course_id": "ENG200",
                    "description": "English Comp 2",
                    "instructor": "Professor Smith",
                    "grade": "B+"
                }
            ]
        }
    ]
}

lily = {
    "student_id": "1009",
    "first_name": "Lily",
    "last_name": "Potter",
    "enrollments": [
        {
            "term": "Winter",
            "gpa": "4.0",
            "start_date": "January 5, 2020",
            "end_date": "March 30, 2020",
            "courses":[
                {
                    "course_id": "CYBR410",
                    "description": "Database Security",
                    "instructor": "Professor Smith",
                    "grade": "A+"
                },
                {
                    "course_id": "ENG200",
                    "description": "English Comp 2",
                    "instructor": "Professor Smith",
                    "grade": "A+"
                }
            ]
        }
    ]
}

students = db.students

print("\n --INSERT STATEMENTS--")
luna_student_id = students.insert_one(luna).inserted_id
print(" Inserted student record Luna Lovegood into students collection with document_id " + str(luna_student_id))

ginny_student_id = students.insert_one(ginny).inserted_id
print(" Inserted student record Ginny Weasley into students collection with document_id " + str(ginny_student_id))

lily_student_id = students.insert_one(lily).inserted_id
print(" Inserted student record Lily Potter into the students collection with document_id " + str(lily_student_id))

input("\n\n End of program, press and key to exit...")
