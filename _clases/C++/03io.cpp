#include<iostream>
#include<string>
#include<sstream>

using namespace std; //Pa no esecificar c/vez que uso una fun de una lib "std::funcion"

/* INPUT/OUTPUT
	cin :  stdin
	cout:  stdout
	cerr:  stderr
	clog:  stdlog
*/
int main(){ 
	string nombre;
	int edad;

  //stdout / stdin 
  cout << "Ingrese edad: ";	cin >> edad;
  cout << "Ingrese nombre: ";	cin >> nombre;
	//concatenacion:
  cout << "Me llamo "<< nombre <<endl;
  cout <<"Tengo "<< edad <<" años."<<endl;

	//cin solo puede pasar palabras individuales, para pasar frases hay que usar:
  string nombrecompleto;

  cout << "Ingrese nombre completo: \n";
  getline(cin, nombrecompleto);
  cout << "Me llamo "<<nombrecompleto<< ". Y tengo "<<edad<<" años."<<endl;

  //StreamString 	<sstream>
	//permite convertir entre string y numeros.
  	string mi_string;
	float precio=0;
	int   cantidad=0;
	
	cout << "Intrudzca cantidad: ";
	getline (cin, mi_string);
	stringstream(mi_string) >> cantidad;

	cout << "Intrudzca precio: ";
	getline (cin, mi_string);
	stringstream(mi_string) >> precio;

	cout<<"Precio final: "<< precio*cantidad <<endl;

return 0;
}
