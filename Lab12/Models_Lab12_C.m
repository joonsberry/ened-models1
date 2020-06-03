%Models Lab 12 Part C
clear; clc; close all;

message = input('Message: ','s');
message = double(message);
bin_message = dec2bin(message,8);
bin_message = bin_message';
bin_message = bin_message(:);
bin_message = bin_message';
bin_message_size = size(bin_message);
bin_message_length = numel(bin_message);
pic = imread('Cat','png');
codedPic = pic;
[M,N] = size(codedPic);
bin_message_1 = zeros(bin_message_size);

if numel(bin_message) > numel(codedPic)
    error('Message is too long.');
end

k = 0;

for m = 1:M
    for n = 1:N
        k = k + 1;
        if k > bin_message_length
            break
        end
        bin_message_1(k) = strcmp(bin_message(k),'1');
        if bin_message_1(k) == 1 && pic(m,n) < 255
            codedPic(m,n) = pic(m,n) + 1;
        elseif bin_message_1(k) == 1 && pic(m,n) == 255
            codedPic(m,n) = pic(m,n) - 1;
        end
    end
end
figure(1)
imshow(pic);
title('\bfOriginal Image','FontSize',16);
figure(2)
imshow(codedPic);
title('\bfCoded Image','FontSize',16);
imwrite(codedPic,'CodedCat.png');