function [Labyrinth] = parse_labyrinth(file_path)
  % deschid fisierul
  fid = fopen(file_path, 'r');

  % citesc dimensiunile de pe prima linie
  dimensions = fscanf(fid, '%d', [1, 2]);

  % citesc matricea cu elemente pe 4 biti
  Labyrinth = fscanf(fid, '%d',[dimensions(2), dimensions(1)])';

  fclose(fid);
endfunction
