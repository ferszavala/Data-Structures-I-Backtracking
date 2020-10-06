int sudoku[][]={
  {9, 6, 0, 1, 0, 4, 0, 5, 8}, 
  {0, 7, 8, 3, 2, 5, 6, 0, 9}, 
  {2, 5, 0, 6, 0, 0, 7, 0, 1}, 
  {8, 0, 1, 4, 0, 7, 5, 0, 6}, 
  {0, 9, 6, 0, 0, 2, 3, 0, 7}, 
  {7, 0, 5, 9, 6, 1, 0, 2, 4}, 
  {5, 0, 0, 7, 1, 0, 4, 6, 2}, 
  {3, 1, 7, 2, 0, 6, 9, 0, 0}, 
  {0, 4, 0, 5, 0, 8, 0, 7, 3}, 
};
int cont=0;
int tam;
void setup()
{ 

  size(750, 750);  
  thread("hilo");
  backtracking();
}
void draw() 
{
  background(255);
  textSize(30);
  for(int i=0; i<9; i++)
  {
     for(int j=0; j<9; j++)
     {
       if(sudoku[i][j]==0)
       {
          fill(0); 
       }
       else
       {
        fill(255,0,255); 
       }
       text(sudoku[i][j],j*80+42,i*80+42);
     }
  }
  
  for(int i=0; i<9; i++)
  {
     if(i%3==0)
     {
        fill(0);
        line(80*i,0,80*i,900);
     }
     for(int j=0;j<9;j++)
     {
        if(j%3==0)
        {
         fill(0);
         line(0,80*j,800,80*j);
        }
     }
  }
 
}
void hilo()
{
  backtracking();
}
void backtracking()
{
  //delay(100);
  for (int i=0; i<9; i++)
  {
    for (int j=0; j<9; j++)
    {
      if (sudoku[i][j]==0)
      {
        for (int k=1; k<=9; k++)
        {
          if (validar(i, j, k)==true)
          {
            sudoku[i][j]=k; 
            backtracking();
            sudoku[i][j]=0;
          }
        }
        return;
      }
    }
  }
     imprimir();
     delay(1000000);
}

boolean validar(int filas, int columnas, int num)
{
  for (int i=0; i<9; i++)
  {
    if (sudoku[i][columnas]==num)
    {
      return false;
    }
  }
  for (int i=0; i<9; i++)
  {
    if (sudoku[filas][i]==num)
    {
      return false;
    }
  }
  int fil=filas-filas%3;
  int col=columnas-columnas%3;
  for (int i=fil; i<fil+3; i++)
  {
    for (int j=col; j<col+3; j++)
    {
      if (sudoku[i][j]==num)
      {
        return false;
      }
    }
  }
  return true;
}
void imprimir() {
  for (int i=0; i<9; i++) {
    for (int j=0; j<9; j++) {
      print(sudoku[i][j]);
    }
    print("\n");
  }
  print("\n");
}
