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
