#include<iostream>

using namespace std;

int variable1=5;	//variable global.

int funcion(){
	int variable2;	//variable local.
	variable2=0;
}

//NAMESPACES:		Para evadir colision de nombres


namespace MiNamespace1{
	int a=2,b=4;
	float valor(){return 6.0;}
}
namespace MiNamespace2{
	int a=3,b=5;
	float valor(){return 7.0;}
}

int main(){

	int x=10,y=20;

	cout<< "Original:"<<endl;
	cout<< "x= "<<x<<",  y= "<<y<<endl;

	{
	int x=20;
	y=50;
	cout<< "En bloque interno:"<<endl;
	cout<< "x= "<<x<<",  y= "<<y<<endl;

	
	}

	cout<< "Luego del bloque:"<<endl;

	cout<< "x= "<<x<<",  y= "<<y<<endl;



	cout<< MiNamespace1::a<<endl;
	cout<< MiNamespace2::a<<endl;

	cout<< MiNamespace1::valor()<<endl;
	cout<< MiNamespace2::valor()<<endl;
	return 0;
}
