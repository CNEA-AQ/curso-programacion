#include<iostream>
#include<fstream>

using namespace std;

// I/O (archivos)
int main(){

	ifstream archivoI;		//solo lectura		
	ofstream archivoO; 		//solo escritura
	fstream archivoIO;		//lectura/escritura

	archivoIO.open("ejemplo.txt");	//apertura
	archivoIO << "Hola wacho!\n";	//escritura
	archivoIO.close();		//clausura


	//Modos de apertura:
	/*	ios::in   (ifstream)
		ios::out  (ofstream)
		ios::binary
		ios::ate  ios::app ios::trunc
	*/
	archivoO.open("ejemplo.txt",ios::binary|ios::app|ios::out); 
	// checkeo de estado
	cout<< "Esta abirto? "<<archivoO.is_open()<<endl;
	archivoO.close();
	cout<< "Esta abirto? "<<archivoO.is_open()<<endl;
	return 0;


}
