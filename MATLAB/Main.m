
I = imread('Ok.png');
I = rgb2gray(I);
%I=[1 2 3 4 5;2 3 4 5 6;3 4 5 6 7;4 5 6 7 8;5 6 7 8 9];
n = length(I);

C =  matrixMultiply(I,findTranspose(I));
disp(C);
[EV, EV_1] = Jacobi(C);

[EV,EV_1] = Sort(EV,EV_1);

[EigenVectors,EigenValues, vv] = svd(double(I));

format long;
Error=zeros(32,1);
for i = 1:n
        Error(:,1) = Error(1)+(EigenVectors(:,i) + EV_1(:,i)).^2;
end
Error(:,1)=Error(:,1)./n;
x=linspace(0,33,33);
%plot(x,Error(:,1));
%I

EigenValues

EV

EigenVectors

Error

EV_1
