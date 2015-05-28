function y=redcross(a,b)
 la = length(a);
 S11_g = a(1:la/2,1:la/2); S12_g = a(1:la/2,1+la/2:la);
 S21_g = a(1+la/2:la,1:la/2);S22_g = a(1+la/2:la,1+la/2:la);
 S11_d = b(1:la/2,1:la/2); S12_d = b(1:la/2,1+la/2:la);
 S21_d = b(1+la/2:la,1:la/2);S22_d = b(1+la/2:la,1+la/2:la);
 S11_g = S11_g+S12_g/((eye(length(S11_d))-S11_d*S22_g))*S11_d*S21_g;
 S12_g = S12_g/((eye(length(S11_d))-S11_d*S22_g))*S12_d;
 S21_g = S21_d/((eye(length(S11_d))-S22_g*S11_d))*S21_g;
 S22_g = S22_d+S21_d/((eye(length(S11_d))-S22_g*S11_d))*S22_g*S12_d;
 y=[S11_g S12_g ; S21_g S22_g] ;
end
