% warning off;
clear all; 
addpath('model');
addpath('lib');
addpath('src');
orderNum = [27,1]; % odd number;
n0 = 1; % incident index
nT = 1 ; % transmission index
lambda = 1.95 ; % incident wavelength
Lambda = [1,1]; % grating period [X, Y]
theta = 0; % angle with z-axis
phi = 0;  % argument
pTE = 0;  % TE component
pTM = 1;  % TM component
model = 'grating'; % the .m file name in model folder
sweep = 2;  % 0-no sweeping parameters ; 1 - sweep lambda ; 2 - theta
switch sweep 
    case 1
        lambdaMin = 1.1 ;
        lambdaMax = 3.1;
        step = 0.002;
    case 2
        thetaMin = 0 ;
        thetaMax = 20 ;
        step = 0.01;
end
proceed;