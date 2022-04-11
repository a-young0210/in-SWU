class Rectangle
{
public:
	Rectangle();
	Rectangle(double, double);
	double getWidth();
	double getHeight();
	double getArea();
	double getPerimeter();
	void setWidth(double);
	void setHeight(double);

private:
	double width;
	double height;
};
