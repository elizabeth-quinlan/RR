%% 2c 
w=1;
figure(1), clf, F_2a=RR_tf([w^2], [1 0.77*w w^2]);
RR_bode(F_2a)
figure(2), clf, F_2b=RR_tf([w^2], [1 1.85*w w^2]);
RR_bode(F_2b)
figure(3), clf, F_4=RR_tf([w^4], [1 2.62*w 3.4245*(w)^2 2.6*(w)^3 w^4]);
RR_bode(F_4)
%% 2d 
w=1;
r=roots([1, 2.62*W, 3.4245*(w)^2, 2.62*(w)^3, (w)^41]);
r1=r(1);
r2=r(2);