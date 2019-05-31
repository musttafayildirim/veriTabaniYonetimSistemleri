#include <stdio.h>
#include <conio.h>

int main(){
	
	
int a = 5, b = 20;
FILE  *fptr,*fptr1;


fptr=fopen("okuma.txt","w");
fprintf ( fptr, "%d %d\n", a, b ) ;



fptr1 = fopen ("okuma.txt", "r" );
fscanf ( fptr1, "%d %d", &a, &b);
printf ("%d %d\n", a, b ) ;
getch();
}

