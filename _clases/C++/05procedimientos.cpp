#include<iostream>
#include<fstream>
#include<string>
#include<vector>

using namespace std;

//FUNCIONES
int addNums(int firstNum, int secNum =0){
  int suma=firstNum + secNum;
  return suma;
}
	//Recursividad:
	int factorial(int num){ //Funcion recursiva
	  int sum;
	  if(num == 1) sum =1;
	  else sum= factorial(num-1)*num;
	  return sum;
	}

//SUBRUTINAS:
void miSubrutina1(){
    cout<<"Soy una subrutina.."<<endl;
}
  // Si quiero que modifique las variables de entrada, entonces le paso sus memory adrresses (pointers) *variable
void miSubrutina2(int& arg1, int& arg2){
	arg1=arg1*2;
	arg2=arg2*3;
	
	return;
}
	
//Overloading: tener más de una funcion con mismo nombre. Se puede. Pero debe tener distintos argumentos.
	int suma(int arg1, int arg2){return (arg1 + arg2);}
	float suma(float arg1, float arg2){return (arg1 + arg2);}

//TEMPLATES (INTERFACE): 		permiten generalizar funciones con distintos argumentos.

template <class T, class U>		//estoy permitiendo que los argumentos sean datatypes distintos
bool son_iguales(T arg1, U arg2){return (arg1==arg2);}


int main(){

  int n=9,m=2;

  cout << "Factorial de "<< n <<" es: " << factorial(n) << endl;
  
  miSubrutina1();
  cout<<"m="<<m<<" n="<<n<<endl; 	
  miSubrutina2(n,m);
  cout<<"m="<<m<<" n="<<n<<endl; 	
  
	cout << "Factorial de "<< n <<" es: " << factorial(n) << endl;
    // Memoria:

    cout <<"Tamaño bits:" <<sizeof(m) <<". Memory adress: "<< &m  << endl;
    // pointers:  &variable
    int* memadrr=&m;

    cout<<"Pointer:" << memadrr<<endl;
    cout<<"Derreferencio pointer:" << *memadrr<<endl;

   //interface
    cout<<"Son iguales? " << son_iguales(10.0,10.0)<<endl;
  return 0;
}
