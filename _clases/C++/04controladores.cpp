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
