a= imread('timg.jpg');
a = rgb2gray(a);%�Ҷȴ���ת��Ϊ2ά����
a=double(a);
%a�Ѿ���double�͡����������imshow��ʾͼ����������Ҫ��ת����uint8��ʽ��
figure;
imshow(mat2gray(a))%ԭͼ

r=rank(a)
[m,n] = size(a);
ratio = m*n/(w*(2*n+1));  

[s,v,d]=svd(a);
w=50%ѡ��������ֵ�ĸ�����w�Ĵ�СҪС��rank(a)
a1=s(:,:)*v(:,1:w)*d(:,1:w)';

figure;
imshow(mat2gray(a1));
title(['ѹ����',num2str(ratio)]) ;