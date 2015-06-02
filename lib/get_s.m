function y=get_s(a,b)
  switch b
      case 11
          y = a(1:length(a)/2,1:length(a)/2);
      case 12
          y = a(1:length(a)/2,1+length(a)/2:length(a));
      case 21
          y = a(1+length(a)/2:length(a),1:length(a)/2);
      case 22
          y = a(1+length(a)/2:length(a),1+length(a)/2:length(a));
  end
end