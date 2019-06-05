clear all
clc

A=randi(100,[50,30])
rank(A)
tic;
[U,S,V] = svd(A,0)

disp(['matlab工具箱SVD分解时间: ',num2str(toc)]);

tic;
%求左奇异矩阵U1
A1=A*A' ;
[X,D] = eig(A1); %D 为特征值矩阵，X为右特征向量矩阵,这里用了下求特征值和特征向量的工具箱函数，直接用行列式=0去求太麻烦了......
[d,ind] = sort(diag(D),1,'descend'); %提取对角线元素，并降序
U1= X(:,ind)

%求奇异值矩阵
D1 = D(ind,ind); %特征值降序排列;
S1=sqrtm(D1)  ; %特征值求奇异值
S1(:,all(S1<0.0001,1))=[]  

%求右奇异矩阵V1
[m,n]=size(S1);
V1=zeros(n,n);
for i=1:n
    V1(:,i)=A'* U1(:,i)*D1(i,i);
    B(1,i)=norm(V1(:,i)); %1行n列矩阵，存放的是每一列的模值
end
B=repmat(B,n,1);  
V1=V1./B

%求右奇异矩阵V1
%A2=A'*A;
%[X,D] = eig(A2)  ; 
%[d,ind] = sort(diag(D),1,'descend') ;
%V1= X(:,ind)

A3=U1*S1*V1'  %用A3来验证一下分解的正确性
disp(['代码计算SVD分解时间: ',num2str(toc)]);