function [decoded_path] = decode_path(path, lines, cols)
  path(end) = [];
  [lin col] = size(path);
  decoded_path = zeros(lin, 2);
  disp(cols);

  for i = 1:lin
    %impart numarul starii curente la numarul de coloane (stari)
    %de pe fiecare linie a matricei labirint
    decoded_path(i, 1) = idivide(int32 (path(i)), int32 (cols), "fix");
    if mod(path(i), cols) != 0 %daca starea nu se afla la marginea
                               %din dreapta a labirintului
      decoded_path(i, 1) = decoded_path(i, 1) + 1; %linia pe care se afla starea va fi pe 
                                        %urmatoarea linie fata de cea calculata la idivide
      decoded_path(i, 2) = mod(path(i), cols); %coloana este restul impartirii la nr. de stari per linie
    else
      decoded_path(i, 2) = cols;
    endif
  endfor
endfunction
