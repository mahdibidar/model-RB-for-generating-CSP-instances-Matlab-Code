%function  [n,NT,NC,Domain,var]= GEN()
%%%%%%%%% IN THE NAME OF GOD
%%%%%%%%% GENERATOR
%%%%%%%%%%%USER_DEFINED VARIABLES
%n=number of the variables
%p=Constraint tightness [0,1]
%a=Constant value between [0,1]
%r=Constant value between [0,1]
flag=0;
Dom=0;

%while(flag==0)
n=input('n: please input number of the variables===>  ');
%end
fp=1;
while (fp)
p=input('p: please input constraint tightness in [0,1]===> ');
if p>1||p<0
    fp=1;
    disp('you enter invalid number')
else
    fp=0;
end
end
fa=1;
while (fa)
a=input('a: please input a constant value between [0,1]===> ');
if a>1||a<0
    fa=1;
    disp('you enter invalid number')
else
    fa=0;
end
end
fr=1;
while(fr)
r=input('r: please input a constant value between [0,1]===> ');
if r>1||r<0
    fr=1;
    disp('you enter invalid number')
else
    fr=0;
end
end
disp('*********************************************************************')
%end
%%Domain is upper bound -1 of domain
%%Dom contains values of variable domain
Domain=floor(power(n,a));
for i=1:Domain
    Dom(1,i)=i-1;
end
%%%Number of Constraint
NC=round(r*n*log(n));
%%%%number of tuples
d=power(n,a);
NT=round(p*power(d,2));
%%%%%%%%% Producing Constraints Rondomly in form of incompatible tuples
dex2=1+NT;
dex1=NC;
var=cell(dex1,dex2);
flag=0;
%%%%%random tuple of variables
while((flag)==0)
    flag=1;
mat=randi([0,n-1],NC,2);
for i=1:NC
    if(isequal(mat(i,1),mat(i,2)))
            flag=0;
    end
end
if(flag==1)
for i=1:NC
    for j=i+1:NC
    if(isequal(mat(i,1),mat(j,1)))
        if (isequal(mat(i,2),mat(j,2)))
            flag=0;
        end
    end
    end 
end
end
if(flag==1)
for i=1:NC
    for j=i+1:NC
    if(isequal(mat(i,1),mat(j,2)))
        if (isequal(mat(i,2),mat(j,1)))
            flag=0;
        end
    end
    end 
end
end
end
for i=1:NC
    bb(1,1)=mat(i,1);
    bb(1,2)=mat(i,2);
    var{i,1}=bb;
end
%%%%%%%Producing random Incompatible Tuples 

for nc=1:NC
    flag=0;
 while(flag==0)
        flag=1;
        matt=randi([0,Domain-1],NT,2);
 for i=1:NT
    for j=i+1:NT
     if(isequal(matt(i,1),matt(j,1)))
        if (isequal(matt(i,2),matt(j,2)))
            flag=0;
        end
    end
    end 
end
 end
 
 c=2;
 %var{nc,3}=matt(1,1);
for i=1:NT
    for j=1:2
        aa(1,j)=matt(i,j);
        var{nc,c}=aa;
    end
    c=c+1;
end
end
in=input('do you wish to see the constraint, If yes enter Y (otherwise N)====>   ','s');
if in=='Y'
    disp('each row show the number of variable which have constraint, left one is the first varibale and right one is the second variable')
    mat
end
cc=zeros(NT,2);
inn=input('do you wish to see the incompatible tuples, If yes enter Y (otherwise N)====>   ','s');
if inn=='Y'
while (inn=='Y')

    disp('Number of the constraints is ')
    NC
    innn=input('for which row do you wish to see the incompatible tuples (from 1 to NC)? ===>  ');
    for i=2:NT+1
        bb=var{innn,i};
        disp((bb))
        %cc(i-1,1)=bb(1,1);
        %cc(i-1,2)=bb(1,2); 
    end
    %(cc)
    inn=input('Do you wish to continue  Y/N ==>','s');
end
end
%end