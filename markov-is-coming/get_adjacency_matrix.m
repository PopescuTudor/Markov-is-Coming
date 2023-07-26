function [Adj] = get_adjacency_matrix(Labyrinth)
  [lin col] = size(Labyrinth);
  %initializez matricea de adiacenta, salvata in format sparse
  Adj = sparse(lin*col + 2);
  %initializare pt celulele win-win si lose-lose 
  Adj(lin*col + 1, lin*col + 1) = 1;
  Adj(lin*col + 2, lin*col + 2) = 1;
  for i = 1:lin
    for j = 1:col
      %urmatoarele 2 if-uri verifica adiacenta cu starea win
      if i == 1 && bitand(Labyrinth(i, j), 8) == 0
        Adj(col*(i-1) + j, lin*col + 1) = 1;
      endif

      if i == lin && bitand(Labyrinth(i,j), 4) == 0
        Adj(col*(i-1) + j, lin*col + 1) = 1;
      endif
      %urmatoarele 2 if-uri verifica adiacenta cu starea lose
      if j == 1 && bitand(Labyrinth(i,j), 1) == 0
        Adj(col*(i-1) + j, lin*col + 2) = 1;
      endif

      if j == col && bitand(Labyrinth(i,j), 2) == 0
        Adj(col*(i-1) + j, lin*col + 2) = 1;
      endif

      %urmatoarele 2 if-uri verifica adiacenta intre celule
      %pe toate cele 4 directii
      if i != 1 && bitand(Labyrinth(i, j), 8) == 0
        Adj(col*(i-1) + j, col*(i-2) + j) = 1;
      endif

      if i != lin && bitand(Labyrinth(i,j), 4) == 0
        Adj(col*(i-1) + j, col*i + j) = 1;
      endif

      if j != 1 && bitand(Labyrinth(i,j), 1) == 0
        Adj(col*(i-1) + j, col*(i-1) + j - 1) = 1;
      endif

      if j != col && bitand(Labyrinth(i,j), 2) ==0
        Adj(col*(i-1) + j, col*(i-1) + j + 1) = 1;
      endif
    endfor
  endfor
  Adj(1,1) = 0;
endfunction
