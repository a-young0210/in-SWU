#include "Fan.h"
#include <iostream>

Fan::Fan()
{
	speed = 1;
	on = false;
	radius = 5;
	color = "white";
}

int Fan::getSpeed()
{
	return speed;
}

bool Fan::isOn()
{
	if (on == true)
		cout << "on" << endl;
	else
		cout << "off" << endl;

	return on;
}

double Fan::getRadius()
{
	return radius;
}

string Fan::getColor()
{
	return color;
}

void Fan::setSpeed(int nS)
{
	speed = nS;

}

void Fan::setOn(bool nO)
{
	on = nO;

}

void Fan::setRadius(double nR)
{
	radius = nR;
}

void Fan::setColor(string nC)
{
	color = nC;
}