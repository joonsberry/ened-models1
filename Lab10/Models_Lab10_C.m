%Models Lab 10 Part C
clear; clc;

original_message = input('Message to decrypt: ','s');
encryption_key = input('Encryption key: ');

number_message = double(original_message);

for k = 1:length(number_message)
    if number_message(k) >= 65  &&  number_message(k) <= 90
       number_message(k) = number_message(k) - encryption_key;
      while number_message(k) < 65 
           number_message(k) = number_message(k) + 26;
      end
    end
    if number_message(k) >= 97  &&  number_message(k) <= 122
       number_message(k) = number_message(k) - encryption_key;
      while number_message(k) < 97 
           number_message(k) = number_message(k) + 26;
      end
    end
end

fprintf('%s\n',number_message);