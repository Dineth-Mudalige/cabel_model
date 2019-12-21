% electrical constants and derived quantities for typical 
% mammalian dendrite

% Dimensions of compartments

d1 = 75e-4; 			% cm
d21 = 30e-4; 			% cm
d22 = 15e-4; 			% cm

% Commented till Question 6
% d21 = 47.2470e-4;       % E9 cm
% d22 = d21;               % E9 cm
%%%%%%%
l1 = 1.5;			% dimensionless
l21 = 3.0;			% dimensionless
l22 = 3.0;			% dimensionless

% Electrical properties of compartments

Rm = 6e3;			% Ohms cm^2
Rc = 90;			% Ohms cm
Rs = 1e6;			% Ohms

c1 = 2*(Rc*Rm)^(1/2)/pi;

rl1 = c1*d1^(-3/2);		% Ohms
rl21 = c1*d21^(-3/2);		% Ohms
rl22 = c1*d22^(-3/2);		% Ohms


% Applied current

iapp = 1e-9; 	% Amps

% Coefficient matrices

A = [1 -1 0 0 0 0;
     0 0 exp(-l21) exp(l21) 0 0;
     0 0 0 0 exp(-l22) exp(l22);
     exp(-l1) exp(l1) -exp(-l1) -exp(l1) 0 0;
     0 0 exp(-l1) exp(l1) -exp(-l1) -exp(l1);
     -exp(-l1) exp(l1) rl1*exp(-l1)/rl21 -rl1*exp(l1)/rl21 rl1*exp(-l1)/rl22 -rl1*exp(-l1)/rl22];

b = [rl1*iapp; 0 ;0; 0 ;0; 0];
x = A\b;%Calculating the value of x
x
%Plotting the graph
y1 = linspace(0,l1,20);
y21 = linspace(l1,l21,20);
y22 = linspace(l1,l22,20);
v1 = x(1)*exp(-y1)+x(2)*exp(y1);
v21 = x(3)*exp(-y21)+x(4)*exp(y21);
v22 = x(5)*exp(-y22)+x(6)*exp(y22);
figure;
plot(y1,v1,'y-');
hold on;
plot(y21,v21,'r-');
hold on;
plot(y22,v22,'b-');
hold off;
xlabel('X(dimensionless)');
ylabel('V(Volts)');
title('Steady-state voltage');
legend('Branch 1','Branch 21','Branch 22');
%Changing A according to Figure 2a
A1 = A;
A1(2,:) = [0 0 -exp(-l21) exp(l21) 0 0];
x1 = A1\b;
v21 = x1(1)*exp(-y1)+x1(2)*exp(y1);
v221 = x1(3)*exp(-y21)+x1(4)*exp(y21);
v222 = x1(5)*exp(-y22)+x1(6)*exp(y22);
figure;
plot(y1,v21,'y-');
hold on;
plot(y21,v221,'r-');
hold on;
plot(y22,v222,'b-');
hold off;
xlabel('X(dimensionless)');
ylabel('V(Volts)');
title('Steady-state voltage of Figure 2(a)');
legend('Branch 1','Branch 21','Branch 22');
%Changing A according to Figure 2b
A2 = A;
A2(3,:) = [0 0 0 0 -exp(-l22) exp(l22)];
x2 = A2\b;
v31 = x2(1)*exp(-y1)+x2(2)*exp(y1);
v321 = x2(3)*exp(-y21)+x2(4)*exp(y21);
v322 = x2(5)*exp(-y22)+x2(6)*exp(y22);
figure;
plot(y1,v31,'y-');
hold on;
plot(y21,v321,'r-');
hold on;
plot(y22,v322,'b-');
hold off;
xlabel('X(dimensionless)');
ylabel('V(Volts)');
title('Steady-state voltage of Figure 2(b)');
legend('Branch 1','Branch 21','Branch 22');
%Changing b according to Figure 2c
b1 = b;
b1(1) = 0;
b1(2) = rl21*iapp;
x3 = A1\b1;
v41 = x3(1)*exp(-y1)+x3(2)*exp(y1);
v421 = x3(3)*exp(-y21)+x3(4)*exp(y21);
v422 = x3(5)*exp(-y22)+x3(6)*exp(y22);
figure;
plot(y1,v41,'y-');
hold on;
plot(y21,v421,'r-');
hold on;
plot(y22,v422,'b-');
hold off;
xlabel('X(dimensionless)');
ylabel('V(Volts)');
title('Steady-state voltage of Figure 2(c)');
legend('Branch 1','Branch 21','Branch 22');
%Changing b according to Figure 2d
b2 = b;
b2(3) = rl22*iapp;
x4 = A2\b2;
v51 = x4(1)*exp(-y1)+x4(2)*exp(y1);
v521 = x4(3)*exp(-y21)+x4(4)*exp(y21);
v522 = x4(5)*exp(-y22)+x4(6)*exp(y22);
figure;
plot(y1,v51,'y-');
hold on;
plot(y21,v521,'r-');
hold on;
plot(y22,v522,'b-');
hold off;
xlabel('X(dimensionless)');
ylabel('V(Volts)');
title('Steady-state voltage of Figure 2(d)');
legend('Branch 1','Branch 21','Branch 22');
