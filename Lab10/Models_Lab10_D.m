%Models Lab 10 Part D
clear; clc;

original_message = input('Message to decrypt: ','s');
encryption_key = 0;

number_message = double(original_message);
for n = 1:25
    clc;
    encryption_key = n;
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
    correct_decryption = menu('Is this message correct?','Yes','No');
    if correct_decryption == 1
        break
    end
end
fprintf('The encryption key is %i\n',encryption_key);
