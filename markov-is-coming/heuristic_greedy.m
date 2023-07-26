function [path] = heuristic_greedy(start_position, probabilities, Adj)
  %initializez vectorul solutie
  %calea porneste de la start
  path = [start_position];
  [lin, col] = size(Adj);
  
  %scot starile win/lose din nr de col/lin
  lin = lin - 2;
  col = col - 2;
  
  visited = zeros(lin + 2, 1);
  visited(start_position) = 1;

  while isempty(path) == false
    %posizita curenta este ultimul element din cale
    position = path(end);
    
    %daca ajung in starea win, pot returna solutia
    if position == lin + 1
      path = path';
      return;
    endif
    
    %verific daca pozitia curenta are vecini nevizitati
    check = 0;
    maxx = 0;
    maxx_index = 0;
    for i = 1:(col + 2)
      if Adj(position, i) == 1 && visited(i) == 0
        check = 1;
        %calculez ce vecin are cea mai mare probabilitate de a ajunge in win
        if probabilities(i) > maxx 
          maxx = probabilities(i);
          maxx_index = i;
        endif
      endif
    endfor
    
    %cand raman fara vecini nevizitati, scot celula din cale
    if check == 0
      path(end) = [];
      continue;
    endif
    %daca acesta exista, adaug la cale vecinul cu cea mai mare
    %probabilitate calculat mai sus
    if maxx_index != 0
      visited(maxx_index) = 1;
      path = [path, maxx_index];
    endif
  endwhile
  path = path'; %transpose
endfunction