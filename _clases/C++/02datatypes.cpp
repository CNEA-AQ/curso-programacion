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
//  int fulano=10;
// auto mengano = fulano;
//  decltype(fulano) mengano;


// Contracciones:
	n=3;	//n=3
	++n;	//n=n+1
	n+=1;	//n=n+1
	m=n++;	//m=n+1 n=n
	m=++n;	//m=n+1 n=n+1

 return 0;
}
