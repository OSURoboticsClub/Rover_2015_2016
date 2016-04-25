/*
 * prints a rectangular "room" pgm file base on parameters
 * CONVERSION is feet to meters value
 * resolution is the resolution that will be used in the base_launch file
 * mFeet and nFeet are the boundaries of the "room"
 * boundaries in the resolution are rounded to the nearest whole number
 */

#include <iostream> 
#include <fstream>
#include <cstdlib> 
#include <string>

using namespace std;

float CONVERSION = .3048;

int main()
{
float resolution = .25;
cout << "USING resolution: " << resolution << "\n";
float mFeet = 80;
float nFeet = 120;
float mMeter = 80*CONVERSION;
float nMeter = 120*CONVERSION;

mMeter = 1/resolution*mMeter;
nMeter = 1/resolution*nMeter;
cout << "Rows: "<<mMeter << " " << "Cols: "<< nMeter << "\n";

// add .5 for rounding when casting
int m = int(mMeter + .5);
int n = int(nMeter + .5);
cout << "Rounded: " << m << ", " << n << "\n";

int pgm[m+2][n+2];
ofstream fp;
int pixCount = 1;

for (int i = 0; i<m+2 ;i++)
{
        for (int j=0; j<n+2; j++)
	{
		// mark off the boundaries
		if ((i == 0) || (j == 0) || (i == m+1) || (j == n+1))
		{
			pgm[i][j] = 0;
		}
		else
		{
        		pgm[i][j] = 255;
		}
        }
}
string fName = "Level_1_" + std::to_string(resolution) + ".pgm";
fp.open(fName);
//brutal header printing cause I haven't worked w/ c++ fstream before
fp << "P2\n" << n+2 << " " << m+2 << "\n" << "255\n";

//print the image
for (int i = 0; i<m+2; i++)
{
        for (int j=0; j<n+2;j++)
        {
		fp << pgm[i][j];
		if (pixCount%70 == 0)
		{
			// newline every 70 pix due to pgm standards
			fp << ("\n");
		}
		else
		{		
			fp << (" ");
		}
		pixCount++;
        }	
}

fp.close();
cout << "File created: " << fName << "\n";
return 0;
}
