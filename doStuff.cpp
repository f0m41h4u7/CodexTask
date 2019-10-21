#include <iostream>
#include <string>
using namespace std;

class Trait
{
public:
	int n;
	string parts[n];
	string command;
	Trait(int n, string command)
	{
		this->n=n;
		this->command=command;
		this->parts[n] = new string[n];
	}
	Trait() {}
};

int main()
{
	Trait traits[5];
/*
	traits[0] = new Trait(6, "df -h");
	traits[0].parts[0] = "Filesystem";
	traits[0].parts[1] = "Size";
	traits[0].parts[2] = "Used";
	traits[0].parts[3] = "Available";
	traits[0].parts[4] = "Use%";
	traits[0].parts[5] = "Mounted on";

	traits[1] = new Trait(7, "route -n");
        traits[1].parts[0] = "Destination";
        traits[1].parts[1] = "Gateway";
        traits[1].parts[2] = "Genmask";
        traits[1].parts[3] = "Metric";
        traits[1].parts[4] = "Ref";
	traits[1].parts[5] = "Use";
	traits[1].parts[6] = "Iface";
*/
	return 0;
}
