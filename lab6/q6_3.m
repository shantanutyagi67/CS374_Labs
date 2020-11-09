clearvars;
clc;
close all;

A = [1 1/2 1/3
    1/3 1 1/2
    1/2 1/3 1];
b = [11/18
    11/18
    11/18];



[n1,N] = size(A);
% N=input('N:');
% A=input('A:');
%w=input('w:');
% w=0:0.2:1
% A=reshape(A,[N,N]);
% A=A.'
% 
% b=input('b:');
% b=b';

L = zeros(N);
D = L;
U = D;

for i = 1:N
    for j=1:i-1
       L(i,j) = A(i,j); 
    end
    
    for j=i:i
       D(i,j) = A(i,j); 
    end
    
    for j=i+1:N
       U(i,j) = A(i,j); 
    end
    
end
L
D
U
I = eye(N);
act = (I/A)*b;
x0 = zeros(N,1);
% 
% 
%Richardson
err = act - x0;
lastx = x0;
cnt = 0;
while (norm(err) > 1e-6) && (cnt < 200)
    cnt = cnt + 1;
    
    x = (I - A)*lastx;
    x = x + b
    
    lastx = x;
    
    err = act - x;
    
end
disp(max(abs(eig(I-A))))
Richardson_cnt = cnt
Richardson_sol = x
% % 
% %Jacobi
err = act - x0;
lastx = x0;
cnt = 0;
while (norm(err) > 1e-6) && (cnt < 200)
    cnt = cnt + 1;
    
    x = -(I/D)*(L + U)*lastx;
    x = x + (I/D)*b
    
    lastx = x;
    
    err = act - x;
end
disp(max(abs(eig(-(I/D)*(L + U)))))
Jacobi_cnt = cnt
Jacobi_sol = x


%Gauss-Seidel
err = act - x0;
(I/(L + D))
lastx = x0;
cnt = 0;
while (norm(err) > 1e-6) && (cnt < 200)
    cnt = cnt + 1;

    x = -(I/(L + D))*(U)*lastx;
    x = x + (I/(L + D))*b
    
    lastx = x;
    
    err = act - x;
end
disp(max(abs(eig(-(I/(L + D))*U))))
Gauss_Seidel_cnt = cnt
Gauss_Seidel_sol = x


%SOR

i=1;
str={}
ini=0.1
for w=ini:0.2:1

    err = act - x0;
    lastx = x0;
    cnt = 0;
    while (norm(err) > 1e-6) && (cnt < 13 )
        cnt = cnt + 1;

        x = (I/(D+w*L))*((1-w)*D - w*U)*lastx + w*(I/(D + w*L))*b;

        lastx = x;

        err = act - x;
    end

    if w==ini
        str = {strcat('w = ' , num2str(w))} ; % at the end of first loop, z being loop output
    else
        str = [str , strcat('w = ' , num2str(w))]; % after 2nd loop
    end
% plot your data
    plot(x)
    hold on;
    
    
    SOR = cnt
    SOR_sol = x
    
    
end
   
%plot your data
plot(Gauss_Seidel_sol)
str = [str , strcat('Gauss Seidel' )]; % after 2nd loop
legend(str{:})
%legend(str(0))
%ylabel('Error abs(Gauss Seidel - SOR)')
    SOR = cnt
    SOR_sol = x

%  ylim([-0.002 0.05])
%  xlim([0.9999 3.001])