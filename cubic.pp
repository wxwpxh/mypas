{
      Shengjin's Formulas Univariate cubic equation aX ^ 3 + bX ^ 2 + cX + d = 0, (a, b, c, d < R, and a!= 0).
       Multiple root discriminant: delta1 = b^2-3*a*c; delta2 = b*c-9*a*d; delta3 = c^2-3*b*d,
           The total discriminant is delta=delta2^2-4*delta1*delta3.
           When delta1 = delta2 = 0, Shengjin Formula (1): X1=X2=X3=-b/(3*a)=-c/b=-3d/c.
           When delta=B^2-4*A*C>0, Shengjin Formula II:
                 Y1= delta1*b + 3*a *((-B + (delta)^1/2))/ 2.
                 Y2= delta1*b + 3*a *((-B - (delta)^1/2))/ 2.
                 x1=(-b-Y1^(1/3) - Y1^(1/3)/(3*a);
                 X2=(-2*b+Y1^(1/3)+Y2^(1/3)/(6*a)+3^(1/2)* (Y1^(1/3)-Y2^(1/3)/(6a)i,
                 X3=(-2*b+Y1^(1/3)+Y2^(1/3)/(6*a)-3^(1/2)* (Y1^(1/3)-Y2^(1/3)/(6a)i,

           When delta=B^2-4AC=0, Shengjin Formula 3:
                 X1=-b/a+K; X2=X3=-K/2,            K = delta2/delta1, (A<>0).
           When delta=B^2-4AC<0, Shengjin Formula 4:
                 X1= (-b-2*sqrt(delta1)*cos(theta/3))/(3*a);
                 X2= (-b+sqrt(delta1)*(cos(theta/3)+sqrt(3)*sin(theta/3)))/(3*a);
                 X3= (-b+sqrt(delta1)*(cos(theta/3)-sqrt(3)*sin(theta/3)))/(3*a)
                 theta=arccosT,T=(2Ab-3aB)/(2A^(3/2))
    Shengjin's Distinguishing Means
        (1)A = B = 0, the equation has a triple real root.
        (2) When delta =B^2-4AC>0, the equation has a real root and a pair of conjugate complex roots.
        (3) When delta=B^2-4AC=0, the equation has three real roots, one of which has two double roots.
        (4) When delta=B^2-4AC<0, the equation has three unequal real roots.
}



program cubic(input,output);
const
  PI=3.14159265359;
var
  a,b,c,d:real;{Coefficient of cubic Equation}
  delta1,delta2,delta3,delta:real;
  Y1,Y2,expY1,expY2:real;
  K,theta,T:real;
begin
  writeln('Input Coefficient of cubic Equation:a b c d');
  readln(a,b,c,d);
  delta1 := b*b-3*a*c;
  delta2 := b*c-9*a*d;
  delta3 := c*c-3*b*d;
  delta  := delta2*delta2-4*delta1*delta3;
  if (delta1=0 )and (delta2=0) then
    begin
       writeln('the equation has a triple real root.');
       writeln('x1=x2=x3=',-c/b:0:5)
    end
  else if delta>0 then
    begin
       writeln(' the equation has a real root and a pair of conjugate complex roots.');
       Y1 := delta1*b + 3*a *((-delta2 + sqrt(delta)))/2;
       Y2 := delta1*b + 3*a *((-delta2 - sqrt(delta)))/2;
       if Y1>0 then expY1 := exp((1/3)*ln(Y1))
       else if Y1=0 then  expY1 := 0
       else expY1 := (-1)*exp((1/3)*ln(abs(Y1)));
       if Y2>0 then expY2 := exp((1/3)*ln(Y2))
       else if Y2=0 then  expY2 := 0
       else expY2 := (-1)*exp((1/3)*ln(abs(Y2)));
           {
             writeln('Y1=',Y1,'Y2=',Y2);
             writeln('x1=',(-b-exp((1/3)*ln(Y1)) - exp((1/3)*ln(Y2)))/(3*a));
             writeln('x2=',(-2*b+exp((1/3)*ln(Y1)) +exp((1/3)*ln(Y2)))/(6*a):0:5,'+',sqrt(3.0)* (exp((1/3)*ln(Y1))-exp((1/3)*ln(Y2)))/(6*a):0:5,'i');
             writeln('x3=',(-2*b+exp((1/3)*ln(Y1)) +exp((1/3)*ln(Y2)))/(6*a):0:5,'-',sqrt(3.0)* (exp((1/3)*ln(Y1))-exp((1/3)*ln(Y2)))/(6*a):0:5,'i')
           }
       writeln('x1=',(-b-expY1 - expY2)/(3*a):0:5);
       writeln('x2=',(-2*b+expY1 +expY2)/(6*a):0:5,'+',sqrt(3.0)* (expY1-expY2)/(6*a):0:5,'i');
       writeln('x3=',(-2*b+expY1 +expY2)/(6*a):0:5,'-',sqrt(3.0)* (expY1-expY2)/(6*a):0:5,'i')
    end
  else if delta=0 then
    begin
       writeln('the equation has three real roots, one of which has two double roots.');
       K :=delta2/delta1;
       writeln('X1=X2=',-K/2:0:5);
       writeln('X3=',-b/a+K:0:5)
    end
  else if delta<0 then
    begin
       writeln('the equation has three unequal real roots.');
       T:=(2*delta1*b-3*a*delta2)/(2*sqrt(delta1*delta1*delta1));
       if T=0 then theta:=PI/2  else theta:=arctan(sqrt(1-T*T)/T); { theta:=arccos(T); }
       if theta<0 then theta:=PI+theta;
       writeln('X1=',(-b-2*sqrt(delta1)*cos(theta/3))/(3*a):0:5);
       writeln('X2=',(-b+sqrt(delta1)*(cos(theta/3)+sqrt(3.0)*sin(theta/3)))/(3*a):0:5);
       writeln('X3=',(-b+sqrt(delta1)*(cos(theta/3)-sqrt(3.0)*sin(theta/3)))/(3*a):0:5)
    end;
end.
