
close all

T_0 = 0;
T_max = 4;

Ts = 0.1;

G = filt([0 0.1], [1 -0.8] , Ts);

t = (0:Ts:T_max).';      % time vector aligned with Ts

f = 1;

while f ~= 0

  f = input("Input Frequency to plot: ");

  if f == 0
    break
  end

  frequency_response(f, t, G);
end

disp('Exiting ...!');
