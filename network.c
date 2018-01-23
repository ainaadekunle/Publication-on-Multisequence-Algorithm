# include <stdlib.h>
# include <stdio.h>
# include <string.h>
# include <math.h>
/****************************************************************/
# define N 35
# define NMAX 11
# define NSEQ 1024
/****************************************************************/
char sequences[NSEQ][N];
double p1[NSEQ],p2[NSEQ],ptot[NSEQ],B[NSEQ];
double pcut=0.50;
double Bcut=0.50; // bistability cutoff
/****************************************************************/
int read_data(char *fn);
void print_nearest_neighbors();
int Hamming(int i,int j);
/****************************************************************/
int main (int argc, char *argv[])
{
  read_data(argv[1]);

  //  for (i=0;i<NSEQ;i++)
  //    printf("%i %lf %lf %lf\n",i,p1[i],p2[i],ptot[i]);

  print_nearest_neighbors();
 
}
/****************************************************************/
int read_data(char *fn) {
  int i,j,ind;
  char buff[100];
  char *p;
  FILE *fp;

  fp=fopen(fn,"r");

  for (i=0;i<NSEQ;i++) {
    fgets(buff, 100, fp);
    
    p = strtok(buff," \n");
    ind = atoi(p);

    p = strtok(NULL," \n");
    for (j=0;j<N;j++) sequences[i][j] = p[j];

    p = strtok(NULL," \n");
    p1[i] = atof(p);

    p = strtok(NULL," \n");
    p2[i] = atof(p);
  
    ptot[i]=p1[i]+p2[i];

    B[i]=1-(fabs(p1[i]-p2[i])/(p1[i]+p2[i]));
//printf("%lf",B[i]);
  }

  fclose(fp);

  return 0;
}
/****************************************************************/
int Hamming(int i,int j) {
  int k,n=0;
  
  for (k=0;k<N;k++) if (sequences[i][k] != sequences[j][k]) n++;
  
  return n;
}
/****************************************************************/
void print_nearest_neighbors()
{
  int i,j;

   printf("graph network\n");
   printf("{\n");
   printf("\tsize=\"%i,%i\";\n",20,20);
   printf("\tnode [shape=circle, label=\"\",style=filled,color=\"green\"];\n"); 
   printf("\tedge [label=\"\",style=filled,color=\"black\"];\n"); 

  
  /* loop through all pairs of sequences i<j with sufficient 
     stability (i.e. ptot >= pcut) */
  for (i=0; i<NSEQ; i++) {
    if (ptot[i] < pcut) continue;

   if(p1[i]>p2[i] && B[i]<Bcut)
   {
    if(i!=0 && i!=1023) 
     printf("\t%i [shape=circle, label=\"\",style=filled,color=\"#6495ED\"];\n",i); 
    else
     printf("\t%i [shape=circle,width=2,fixedsize=true, label=\"A2\",fontsize=50,style=filled,color=\"#6495ED\"];\n",i); 

   }
   else if(p1[i]<p2[i] && B[i]<Bcut)
   { 
    if(i!=0 && i!=1023) 
     printf("\t%i [shape=circle, label=\"\",style=filled,color=\"#A00000\"];\n",i); 
    else
     printf("\t%i [shape=circle,width=2, fixedsize=true, label=\"TN\",fontsize=50,style=filled,color=\"#A00000\"];\n",i); 

   }
   else if(B[i]>=Bcut)
   { 
     printf("\t%i [shape=circle, label=\"\",style=filled,color=\"black\"];\n",i); 

   }

    /* If ptot[i] >= pcut print i (node) */
//    printf("{%i}\n",i);

    for (j=i+1; j<NSEQ; j++) {
      if (ptot[j] < pcut) continue;

      /* If i,j are nearest neighbors, print i,j (edge) */
//      if(i==0||i==1023||j==0||j==1023) // print for only sequences 0 & 1023
//      {

	if (Hamming(i,j)==1) printf("\t%i -- %i;\n",i,j);
//      }
    }

  }

  printf("}\n");

}
/****************************************************************/

