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
        plot(1./(lambdaMin+step.*([0:round((lambdaMax-lambdaMin)/step)]-1)),r0);
    case 2
        wavevector;
        cal_rsmatrix;
        cal_layersmatrix;
        cal_tsmatrix;
        eT_eR;
end