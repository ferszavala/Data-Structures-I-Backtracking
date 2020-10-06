int n=8;
int [][]reinas=new int[n][n];
int cont=0;
boolean col=false;
int tam;
void setup()
{ 
  //frameRate(1);
  size(800,800);  
  thread("hilo");
  print(cont);
  tam=width/n;
}

void draw(){
  for(int i=0;i<n;i++)
  {
     for(int j=0;j<n;j++)
     {
        if((i+j)%2==0)
        {
         fill(255); 
        }
        else
        {
         fill(0); 
        }
        rect(i*tam,j*tam,tam,tam);
     }
  }
  fill(0,255,0);
  for(int i=0;i<n;i++)
  {
     for(int j=0;j<n;j++)
     {
         if(reinas[i][j]==1)
         {
            ellipse(i*tam+tam/2, j*tam+tam/2,tam,tam);
         }
     }
  } 
}
void hilo()
{
 backtracking(0);
}
void backtracking(int estado)
{
  
  for(int i=0;i<n;i++)
  {
    if(validar(i,estado))
    {
      reinas[i][estado]=1;
      if(estado==n-1){
        cont++;
        imprimir();
        delay(5000);
      }
      else
      {
        backtracking(estado+1);
      }
      reinas[i][estado]=0;
    }
  }  
}

boolean validar(int x, int estado)
{
  for(int i=0;i<=x;i++)
  {
    if(reinas[i][estado]==1)
    {
      return false;
    }
  }
  for(int i=0;i<=estado;i++)
  {
    if(reinas[x][i]==1)
    {
       return false;
    }
  }
  for(int i=estado,y=x;i>=0&&y>=0;i--,y--)
  {
    if(reinas[y][i]==1){
       return false;
    }
  }
  for(int i=estado,y=x;i>=0&&y<n;i--,y++)
  {
    if(reinas[y][i]==1){
       return false;
    }   
  }
  return true;
}
void imprimir(){
  for(int i=0;i<n;i++){
    for(int j=0;j<n;j++){
       print(reinas[i][j]);
    }
    print("\n");
  }print("\n");
  print(cont);
}
