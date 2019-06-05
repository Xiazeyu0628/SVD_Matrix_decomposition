clear all
clc

A=randi(100,[50,30])
rank(A)
tic;
[U,S,V] = svd(A,0)

disp(['matlab������SVD�ֽ�ʱ��: ',num2str(toc)]);

tic;
%�����������U1
A1=A*A' ;
[X,D] = eig(A1); %D Ϊ����ֵ����XΪ��������������,����������������ֵ�����������Ĺ����亯����ֱ��������ʽ=0ȥ��̫�鷳��......
[d,ind] = sort(diag(D),1,'descend'); %��ȡ�Խ���Ԫ�أ�������
U1= X(:,ind)

%������ֵ����
D1 = D(ind,ind); %����ֵ��������;
S1=sqrtm(D1)  ; %����ֵ������ֵ
S1(:,all(S1<0.0001,1))=[]  

%�����������V1
[m,n]=size(S1);
V1=zeros(n,n);
for i=1:n
    V1(:,i)=A'* U1(:,i)*D1(i,i);
    B(1,i)=norm(V1(:,i)); %1��n�о��󣬴�ŵ���ÿһ�е�ģֵ
end
B=repmat(B,n,1);  
V1=V1./B

%�����������V1
%A2=A'*A;
%[X,D] = eig(A2)  ; 
%[d,ind] = sort(diag(D),1,'descend') ;
%V1= X(:,ind)

A3=U1*S1*V1'  %��A3����֤һ�·ֽ����ȷ��
disp(['�������SVD�ֽ�ʱ��: ',num2str(toc)]);