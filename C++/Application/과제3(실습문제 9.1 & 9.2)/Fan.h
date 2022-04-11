#include <string>
using namespace std;

class Fan
{
public:
	Fan();
	int getSpeed();
	bool isOn();
	double getRadius();
	string getColor();
	void setSpeed(int);
	void setOn(bool);
	void setRadius(double);
	void setColor(string);

private:
	int speed;
	bool on;
	double radius;
	string color;
};
