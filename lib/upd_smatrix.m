S11_g = S11_g+S12_g/((eye(length(S11_d))-S11_d*S22_g))*S11_d*S21_g;
S12_g = S12_g/((eye(length(S11_d))-S11_d*S22_g))*S12_d;
S21_g = S21_d/((eye(length(S11_d))-S22_g*S11_d))*S21_g;
S22_g = S22_d+S21_d/((eye(length(S11_d))-S22_g*S11_d))*S22_g*S12_d;