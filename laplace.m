 h = 0.2;
 N = 19; M = 11;% N is x-direction. M is y-direction
 n = N*(M+2);% size of system
 e = ones(n,1);
 A = spdiags([-e -e 4*e -e -e],[-N -1 0 1 N],n,n);
 %1) add known values on sides in term b
 b = zeros(n,1);
 b(1:N:end) = 300;
 b(N:N:end) = 600;
 for i = 1:M-1
    A(2+i*N, 2+i*N-1) = 0; 
    A(N+(i-1)*N, N+(i-1)*N +1) = 0;
 end

 %2) correct lower and upper equations with ghost points etc
 for i = 1:N
    A(i,i+N) = -2;
    A(end-i+1, end-i+1-N) = -2;
 end
 
 U = A\b;
 U = reshape(U,N,M+2)';
 U = [300*ones(M+2,1) U 600*ones(M+2,1)];
 imagesc(U)

 
 
 
 
 
 
 
 
 
 
 