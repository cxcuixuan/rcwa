% warning off;
clear all; 
addpath('model');
addpath('lib');
addpath('src');
for temp = 1:1000
orderNum = [27,1]; % odd number
n0 = 1; % incident index
nT = 1 ; % transmission index
lambda = 1.1 + temp/500 ; % incident wavelength
Lambda = [1,1]; % grating period [X, Y]
theta = 0; % angle with z-axis
phi = 0;  % argument
pTE = 0;  % TE component
pTM = 1;  % TM component
proceed;
r0(temp) = R ;
end
% for temp = 1:200
%     theta = 40+temp/10;
%     proceed;
%     r1(temp) = R;
%     t1(temp) = T;
% end
% for count = 1:1700;
%     theta = count/20;
%     tmm;
%     r(count)=R;
% end