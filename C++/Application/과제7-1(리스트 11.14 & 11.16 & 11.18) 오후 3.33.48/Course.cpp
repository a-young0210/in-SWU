#include <iostream>
#include "Course.h"
using namespace std;

Course::Course(const string& courseName, int capacity)
{
	numberOfStudents = 0;
	this->courseName = capacity;
	students = new string[capacity];
}

Course::~Course()
{
	delete[] students;
}

string Course::getCourseName() const
{
	return courseName;
}

void Course::addStudent(const string& name)
{
	students[numberOfStudents] = name;
	numberOfStudents++;
}

void Course::dropStudent(const string& name)
{

}

string* Course::getStudents() const
{
	return students;
}

int Course::getNumberOfStudents() const
{
	return numberOfStudents;
}