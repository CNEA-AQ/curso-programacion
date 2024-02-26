#include<cstdlib>
#include<cstdio>
#include<iostream>
#include<sstream>
#include<string>
#include<vector>
#include<limits>

using namespace std;

int main(){

	float dbNum1,dbNum2;
	char Espacio=" ";
	string Operacion;
	string StringCalculo;
	vector<string> VectorCalculo;

	cout<<"Ingrese calculo (ej: 5 + 6) :"<<"\n";
	getline(cin, StringCalculo);

	stringstream ss(StringCalculo);
	string StringIndividual;

	while (getline(ss, StringIndividual,Espacio)){
		VectorCalculo.push_back(StringIndividual);
	}

	dbNum1= stoi(VectorCalculo[0]);
	dbNum2= stoi(VectorCalculo[2]);
	Operacion= VectorCalculo[1];

	if(Operacion == "+"){printf("%.1f + %.1f = %.1f",dbNum1,dbNum2,dbNum1+dbNum2);}
	else if(Operacion == "-"){printf("%.1f - %.1f = %.1f",dbNum1,dbNum2,dbNum1-dbNum2);}
	else if(Operacion == "*"){printf("%.1f * %.1f = %.1f",dbNum1,dbNum2,dbNum1*dbNum2);}
	else if(Operacion == "/"){printf("%.1f / %.1f = %.1f",dbNum1,dbNum2,dbNum1/dbNum2);}
	else(cout<<"Ingrese calculo (ej: 5 + 6) :"<<"\n");



	return 0;
}
