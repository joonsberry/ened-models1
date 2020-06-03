%Models Lab 12 Part D
clear; clc; close all;

pic = imread('Cat','png');
codedPic = imread('CodedCat','png');
pic = double(pic);
codedPic = double(codedPic);
difference = abs(pic - codedPic);
[M,N] = size(difference);
k = 0;

for m = 1:M
    for n = 1:N
        k = k + 1;
        
        if difference(m,n) == 1
            bin_message(k) = '1';
        else
            bin_message(k) = '0';
        end
    end
end
l = numel(bin_message);
for c = 1:(l/8)
    message(c) = char(bin2dec(bin_message(1 + 8*(c-1):8*c)));
end
disp(message);