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
