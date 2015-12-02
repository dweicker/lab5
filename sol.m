function U = sol(M,N)
% Solves the problem and returns the solution U reshaped as a matrix.
% N is x-direction. M is y-direction
% Florentin GOYENS & David WEICKER
% LAB 5

 n = N*(M+2);% size of system
 e = ones(n,1);
 band = M + 2;
 A = spdiags([-e -e 4*e -e -e],[-band -1 0 1 band],n,n);
 
 %1) add known values on sides in term b
 b = zeros(n,1);
 b(1:M+2) = 300;
 b(((N-1)*(M+2)+1):end) = 600;
 
 % 2) Fix ghost points and some coefficients
 for i = 1:N-1
    A(M+2 + (i-1)*(M+2),M+2 + (i-1)*(M+2) +1) = 0; % upper side of domain
    A(M+2 + (i-1)*(M+2),M+2 + (i-1)*(M+2) -1) = -2;% upper side of domain
    A(1+i*(M+2), 1+i*(M+2) -1) = 0;% lower side of domain
    A(1+i*(M+2), 1+i*(M+2) +1) = -2;% lower side of domain
 end 
 A(N*(M+2), N*(M+2) -1) = -2;
 A(1,2) = -2;

U = A\b;
U = reshape(U,M+2,N);
U = [300*ones(M+2,1) U 600*ones(M+2,1)];
end
