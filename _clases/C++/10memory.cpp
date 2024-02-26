//MANEJO DE MEMORIA
#include<iostream>

using namespace std;

	//Operador "address-de"  	(&)
	//Operador "derreferenciador"   (*)
    

//POINTER


int main(){

	int mi_var = 20;
	int valor;
	int* address;

	valor = mi_var;
	address = &mi_var;	//POINTER:
	
	cout<< valor   <<endl;
	cout<< address <<endl;

	cout <<"Tamaño bits:" << sizeof(valor) <<". Memory address: "<< &valor <<". Valor: "<< valor << endl;
	cout <<"Tamaño bits:" << sizeof(address) <<". Valor: "<< *address  <<". Memory address: "<<address<< endl;



	return 0;
}


//Resize?
