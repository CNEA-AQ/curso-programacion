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
	int array3[3][2] = {{0,9},{2,3},{1,2}}; //son arrays de arrays

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
