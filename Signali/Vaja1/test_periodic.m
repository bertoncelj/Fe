% plot a periodic signal
clear all; close all;

##Function do_period
#Usage: do_period(signal, time, repeat)
  #Signal must work in 1 period, first you discribe one period and if it works call function
  #time must be in vector 1D form, and linear, must have start_time and end_time. End_time > start_time
  #repeat must be bigger or 1. Repeat is integer. It only repeats on positive site!
function [u_ret, t_ret] = do_period( signal, time, repeat)
  if(repeat < 1) printf("\nERROR!\n \tRepeat must be bigger then 1 and an integer! \n") endif;
  sig_len = length(signal);
  time_len = length(time);
  
  ##Figure and calculate for time
  time_max = max(time);
  time_min = min(time);
  period_length = time_max - time_min;  #gets period length by searching for minimal & max time value
  
  t_nov = ones(1, repeat * time_len);
  for i = 0: (repeat - 1)
    for j = 1 : time_len
      t_nov(j + time_len*i) = time(j) + (i * period_length);
    endfor
  endfor
  
  # Calculate for signal u(t)
   u_nov = signal' * ones(1, repeat);
   u_nov = (u_nov(:))';
   
   
   u_ret = u_nov;
   t_ret = t_nov;
   return;
endfunction

###############################
#Signal description
dt = 0.02;  %časovni inkrement

% Signal description in exe 1C. Look at picture 
  %t1 = 0 : dt : 0;  u1 = zeros(size(t1));
  t1 =-2 : dt :-2;  u1 = -0.5*ones(size(t1));
  t2 =-2 : dt :-1;  u2 = -0.5*ones(size(t2));
  t3 =-1 : dt :-1;  u3 =   zeros(size(t3));
  t4 =-1 : dt : 0;  u4 =  0.5 + t4*0.5;
  t5 = 0 : dt : 0;  u5 = -0.5 * ones(size(t5));
  t6 = 0 : dt : 1;  u6 =  -0.5 + 0.5*(t6);
  t7 = 1 : dt : 2;  u7 =  0.5 * ones(size(t7));
  t8 = 2 : dt : 2;  u8 = -0.5 * ones(size(t8));

%we added all increments of sginal in single time and signal vector 1D
  t = [t1 t2 t3 t4 t5 t6 t7 t8];
  u = [u1 u2 u3 u4 u5 u6 u7 u8];

  
#function call
  [signal, cas] = do_period(u, t, 3);

#draw result
plot(cas, signal)

  