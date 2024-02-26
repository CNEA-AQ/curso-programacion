---
title: C++
description: Sintaxis básica de C++
date: 2022-01-01
nav_order: 6
phony: true
noclass: true
ready: false
---

# C++

> C++ es un lenguaje de programación diseñado en 1979 por Bjarne Stroustrup. La intención de su creación fue extender al lenguaje de programación C mecanismos que permiten la manipulación de objetos. En ese sentido, desde el punto de vista de los lenguajes orientados a objetos, C++ es un lenguaje híbrido.

## Hola Mundo!

```cpp 
#include<iostream>

int main(){

 	printf("Hola mundo!\n");
 
	return 0;
}
```

## Compilación y ejecución:
```bash
$> g++ script.cpp
```

Para ejecutar el programa:
```bash
$> ./a.out
```


## Estructura:
```cpp 
#include<iostream>

//Comentario simple linea..

/*
   Comentario
	multilinea
*/

int main(){	//Todo va dentro de una función principal (main)

  //Definicion de variables:
  int  n,m = 2;
  int resultado;
  
  //Indicaciones:
  	std::cout << "Type a number: "; // Type a number and press enter
	std::cin >> n; 			// Get user input from the keyboard
	std::cout << "Your number is: " << n<<"\n"; // Display the input value 

  	resultado=n+m;

	std::cout << "The sum with "<< m<<" is: " <<resultado<<std::endl; 
  
  return 0;
}
```


## Datatypes:
```cpp 
#include<stdio.h>
#include<iostream>
#include<string>
#include<cmath>

using namespace std; //Esto es para no especificar c/vez que uso una fun de una lib "std::funcion"

//Constantes
const double pi=3.1415926;	

int main(){ 

    /*===   D A T A    T Y P E S   ===*/

	//BOOLEANOs
    bool p=true,q;
    q=false;				//asignacion

    cout << p    	<< endl; 
    cout <<    ! q 	<< endl; 	//op. logicas (!:not  &:and  |:or)
    cout << (p & q)  	<< endl; 	//op. logicas (!:not  &:and  |:or)
    cout << (p | q)     << endl; 	//op. logicas (!:not  &:and  |:or)
    cout << (p ^ q)     << endl; 	//op. logicas (!:not  &:and  |:or)

	//ENTEROs
    int n=-4,m;
    m=3;
    cout << (n/2+m*3)  	     << endl; //aritmeticas ( +  -  *  /  )
    cout << n%m		     << endl; //op. modular (%)
    cout << abs(n)     	     << endl; //modulo 	(requiere cmath)
    cout << (n == m)         << endl; //op. relacionales (==  !=  >  <  >=  <= )

	//PUNTO FLOTANTE
    float  x = 3.141592, y=6.02e23f;
    double xx= 1.123123123123,yy=1.123L;

    cout << pow(x,2)	     << endl; //potencia (cmath)
    cout << sqrt(xx)	     << endl; //raiz cuadrada (cmath)

	//CHARACTER
    char   letra='a';
 
	//STRINGs (usando el modulo <string>)
    string mistring= "Esto es un string";   
    cout<< mistring << endl;        //retorna 1
 	// codigos especiales:
	// \n  newline  \t  tab  \v  vtab  \b  espacio
	
// Casting":  Cuando queremos cambiar el tipo de dato que resulta de una opeación:
  int a=3, b=2;
  cout<< a/b << endl;        //retorna 1
  cout<<(float) a/b << endl; //retorna 1.5
  
//deduccion de type
// int fulano=10;
// auto mengano = fulano;
// decltype(fulano) mengano;

// Contracciones:
	n=3;	//n=3
	++n;	//n=n+1
	n+=1;	//n=n+1
	m=n++;	//m=n+1 n=n
	m=++n;	//m=n+1 n=n+1

 return 0;
}
```

## Input / Output

```cpp 
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
```



## Controladores:

```cpp 
#include<iostream>

using namespace std; 

//CONTROLADORES DE FLUJO:

int main(){ 
	int n;
        cout << "Inserte un numero:";
	cin>> n;

//	IF:
    if ( n%2 == 0 ){
      cout << "n es par."<<endl;
    }
    else if( n%2 != 0 ){
      cout << "n es impar."<<endl;
    }
    else( cerr<<"input invalido!");

//	FOR:
    char palabra[5] = {'c','i','n','c','o'};
    int i;
    for (int i=0;i<5;i++){
     cout<< palabra[i]<<endl;
     }
    cout<<endl;


//	WHILE:
	cout << "Adivina que numero estoy pensando:"; cin>> n; 
  	while(n != 7){
	        cout << "No, inserte otro numero:"; cin>> n; 
	 }

	// Conditional ternary operator:  (?)
	string mensaje;
	mensaje = (n==7)? "Adivinaste!" : "Perdiste!";
	cout<< mensaje << endl; 

  return 0;
}
```



## Procedimientos (Funciones y Subrutinas)

```cpp 
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
```


## Bloques:

```cpp 
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
```

## I/O II
```cpp 
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
```



## Arrays:
```cpp 
#include<iostream>
#include<vector>
#include<numeric>

using namespace std;
// ARRAYS

int main(){

//ARRAYS:
	//Creacion:
	int array1[3] = {10, 27, 33};
	//Acceso a elementos:
	array1[0]=99;
	cout<<array1[0]<<endl;

	//Ver tamaño de un array:
	int array2[] = {0,9,-3,-7,1};
	cout<< sizeof(array2)/sizeof(*array2) <<endl;

	//Arays multidimensionales:
	int array3[3][2] = { {0,9},{2,3},{1,2} } ; //son arrays de arrays

//VECTORES:  
	//Crear:
	vector <int> vector1(3);
	vector1[0]=0;vector1[1]=4;vector1[2]=-3;
	//Acceso:
	vector1[2]=10;
	cout<<vector1[1]<<endl;

	//Ver tamaño:
	cout<<vector1.size()<<endl;
/*	int i,j;
	for (i=0;i<=2;i++ ){
		for (j=0;j<=1;j++){
			cout<<array3[i][j]<<endl;
		}
	}
	
*/
	string sentencia="Esto es una sentencia..";
	vector<string> palabras;
	

	return 0;
}	
```




## Clases:

```cpp 
#include <stdio.h>
#include <iostream>
#include <string>
#include <bits/stdc++.h> 
using namespace std; 
//Clases:
class Animal{
  private: //solo pueden ser cambiadas por funciones dentro de mi clase.
    float height;
    float weight;
//    static in numOfAnimals;

  public:// pueden ser modificadas externamente.
    string name;
    float getHeight(){ return height;}
    float getWeight(){ return weight;}
    
    void setHeight(float altura){height = altura;}
    void setWeight(float peso){ weight = peso; }

//    void setAll(int,int,string)
    //Constructor:
    //Animal(int,int,string);
};


int main(){
  Animal tito;  // Create an object of MyClass

  // Access attributes and set values
  tito.setHeight(1.5); 
  tito.setWeight(35); 
  tito.name="Tito";

  // Print attribute values
  std::cout << tito.name<< ", mide: "<< tito.getHeight()<<" y pesa "<<tito.getWeight() << "\n";


  return 0;
}
```



## Memoria y Pointers 
```cpp 
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
```






## Ejemplo:

```cpp 
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
```

