% warning off;
init; 
eval(model);
layer_number;
layer_fft;
switch sweep
    case 0         
        wavevector;
        cal_rsmatrix;
        cal_layersmatrix;
        cal_tsmatrix;
        eT_eR;
    case 1
        for temp = 1:1+round((lambdaMax-lambdaMin)/step)
            lambda = lambdaMin + step * (temp-1);
            wavevector;
            cal_rsmatrix;
            cal_layersmatrix;
            cal_tsmatrix;
            eT_eR;
            r0(temp) = R ;
            t0(temp) = T ;
        end
        plot(lambdaMin+step.*([0:round((lambdaMax-lambdaMin)/step)]),r0);
    case 2
        for temp = 1:1+round((thetaMax-thetaMin)/step)
            theta = thetaMin + step * (temp-1);
            wavevector;
            cal_rsmatrix;
            cal_layersmatrix;
            cal_tsmatrix;
            eT_eR;
            r0(temp) = R ;
            t0(temp) = T ;
        end
        plot(thetaMin+step.*([0:round((thetaMax-thetaMin)/step)]),r0);
    case 3
        r0 = zeros(1+round((thetaMax-thetaMin)/stepTheta),1+round((lambdaMax-lambdaMin)/stepLambda));
        t0 = zeros(1+round((thetaMax-thetaMin)/stepTheta),1+round((lambdaMax-lambdaMin)/stepLambda));
        for temptheta = 1:1+round((thetaMax-thetaMin)/stepTheta)
            theta = thetaMin + stepTheta * (temptheta-1);
            for templambda = 1:1+round((lambdaMax-lambdaMin)/stepLambda)
                lambda = lambdaMin + stepLambda * (templambda-1);
                wavevector;
                cal_rsmatrix;
                cal_layersmatrix;
                cal_tsmatrix;
                eT_eR;
                r0(temptheta,templambda) = R ;
                t0(temptheta,templambda) = T ;
            end
        end
end