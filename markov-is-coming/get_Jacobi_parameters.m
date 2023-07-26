function [G,c] = get_Jacobi_parameters(Link)
  [lin, col] = size(Link);
  
  %elimin starile win/lose din matricea de legaturi
  Link(lin-1:lin, :) = [];
  
  %c - vector de probabilitati pt fiecare stare (in afara de win & lose)
  %     de a ajunge in win
  c = Link(:, col-1);
  
  %elimin starile win/lose din matricea de legaturi
  Link(:,col-1:col) = [];
  
  G = Link;
endfunction