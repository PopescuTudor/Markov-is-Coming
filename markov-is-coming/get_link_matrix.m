function [Link] = get_link_matrix(Labyrinth)
  [lin col] = size(Labyrinth);
  Link = sparse(lin*col + 2);
  Link(lin*col + 1, lin*col + 1) = 1;
  Link(lin*col + 2, lin*col + 2) = 1;
  %vectorul Num_posib retine, pt fiecare stare,
  %in cate stari se poate ajunge
  
  Num_posib = zeros(1, lin*col);
  for i = 1:lin
    for j = 1:col
      %maximul de stari in care se poate ajunge din oricare celula este 4
      Num_posib(col*(i-1) + j) = 4 - sum(bitget(Labyrinth(i,j), 1:4));
    endfor
  endfor
  
  for i = 1:lin
    for j = 1:col
      %calcul probabilitate de a ajunge in win state
      
      if i == 1 && bitand(Labyrinth(i, j), 0b1000) == 0b0000
        Link(col*(i-1) + j, lin*col + 1) = 1/Num_posib(col*(i-1) + j);
      endif
      
      if i == lin && bitand(Labyrinth(i,j), 0b0100) == 0b0000
        Link(col*(i-1) + j, lin*col + 1) = 1/Num_posib(col*(i-1) + j);
      endif
      
      %calcul probabilitate de a ajunge in lose state
      
      if j == 1 && bitand(Labyrinth(i,j), 0b0001) == 0b0000
        Link(col*(i-1) + j, lin*col + 2) = 1/Num_posib(col*(i-1) + j);
      endif
      
      if j == col && bitand(Labyrinth(i,j), 0b0010) == 0b0000
        Link(col*(i-1) + j, lin*col + 2) = 1/Num_posib(col*(i-1) + j);
      endif
      
      %calcul probabilitate de a ajunge in orice stare pe cele 4 directii
      
      if i != 1 && bitand(Labyrinth(i, j), 0b1000) == 0b0000
        Link(col*(i-1) + j, col*(i-2) + j) = 1/Num_posib(col*(i-1) + j);
      endif
      
      if i != lin && bitand(Labyrinth(i,j), 0b0100) == 0b0000
        Link(col*(i-1) + j, col*i + j) = 1/Num_posib(col*(i-1) + j);
      endif
      
      if j != 1 && bitand(Labyrinth(i,j), 0b0001) == 0b0000
        Link(col*(i-1) + j, col*(i-1) + j - 1) = 1/Num_posib(col*(i-1) + j);
      endif
      
      if j != col && bitand(Labyrinth(i,j), 0b0010) == 0b0000
        Link(col*(i-1) + j, col*(i-1) + j + 1) = 1/Num_posib(col*(i-1) + j);    
      endif
    endfor
  endfor
  Link(1,1) = 0;
endfunction