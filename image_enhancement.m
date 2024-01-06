% Assuming you have a folder named 'images' containing multiple images
% Replace 'path_to_your_images_folder' with the actual path to your folder

image_folder = 'C:\Users\Mega\Desktop\dataset';
file_names = dir(fullfile(image_folder, '*.jpg')); % Assuming images are in JPG format

num_images = numel(file_names);

for i = 1:num_images
    % Read each image
    image_name = file_names(i).name;
    img = imread(fullfile(image_folder, image_name));
    
    % Perform histogram equalization
    img_eq = histeq(img);
    
    % Display original and equalized images
    figure;
    subplot(1, 2, 1);
    imshow(img);
    title(['Original Image - ', image_name]);
    subplot(1, 2, 2);
    imshow(img_eq);
    title(['Equalized Image - ', image_name]);
    
    % Save the equalized image
    equalized_image_name = strcat('equalized_', image_name);
    imwrite(img_eq, fullfile(image_folder, equalized_image_name));
end
