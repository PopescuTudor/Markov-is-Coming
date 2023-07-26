function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
  [lin, col] = size(G);
  
  %initializare solutie
  x=zeros(lin, 1);   %initializare solutie
  steps = 0;

  while 1
   x = G * x0 + c; %formula de recurenta Jacobi
   err = norm(x - x0);
   if ++steps == max_steps + 1 || err < tol %verificare eroare & nr. pasi
     return;
   endif
   x0 = x; %actualizare sol. precedenta
  endwhile
endfunction
