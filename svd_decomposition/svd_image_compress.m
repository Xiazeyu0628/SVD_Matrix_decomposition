a= imread('timg.jpg');
a = rgb2gray(a);%灰度处理转化为2维矩阵
a=double(a);
%a已经是double型。如果现在想imshow显示图像结果，就需要再转换成uint8格式。
figure;
imshow(mat2gray(a))%原图

r=rank(a)
[m,n] = size(a);
ratio = m*n/(w*(2*n+1));  

[s,v,d]=svd(a);
w=50%选定的奇异值的个数，w的大小要小于rank(a)
a1=s(:,:)*v(:,1:w)*d(:,1:w)';

figure;
imshow(mat2gray(a1));
title(['压缩率',num2str(ratio)]) ;