warning off;
clear all; 
addpath('model');
addpath('lib');
addpath('src');
orderNum = [11,11]; % odd number;
n0 = sqrt(2); % incident index
nT = 3 ; % transmission index
lambda = 2 ; % incident wavelength
Lambda = [1.75,1.5]; % grating period [X, Y]
theta = 60; % angle with z-axis
phi = 30;  % argument
pte = 1;  % TE component
ptm = 1i;  % TM component
model = 'example'; % the .m file name in model folder
sweep = 0;  % 0-no sweeping parameters ; 1 - sweep lambda ; 2 - theta
switch sweep 
    case 1
        lambdaMin = 1/0.9 ;
        lambdaMax = 1/0.3 ;
        step = 0.001;
    case 2
        thetaMin = 0 ;
        thetaMax = 20 ;
        step = 0.01;
    case 3
        lambdaMin = 1/0.55 ;
        lambdaMax = 1/0.37;
        stepLambda = 0.02;
        thetaMin = 0 ;
        thetaMax = 20 ;
        stepTheta = 0.1;
end
proceed;