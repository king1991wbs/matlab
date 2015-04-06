%root = 'E:/20150309/2014_12_03_06_17_29_04/2014_12_03_06_17_29_04-ok/';
root = 'E:/20150309/test/';
files = dir([root, '*.bmp']);
n = length(files);

data = fopen([root 'data.txt'], 'a+t');

for i = 1:n
    fpath = [root files(i).name];
    img = imread(fpath);
    %ind = -[-size(img, 2):1:-1];
    ind = [size(img, 2):-1:1];
    img = img(:, ind);
    figure;
    imshow(img);hold on;
    [x, y] = ginput(2);%%get mouse position in image
    %%%%save point of rectangle in file%%%%%%%
    fprintf(data, '%s ', fpath);
    fprintf(data, '%d %d %d %d\n', [int32(x(1)) int32(y(1)) int32(x(2)) int32(y(2))]);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [x,y]
    %xx = int32(x());
    width  = abs(x(2) - x(1));
    height = abs(y(2) - y(1));
    rectangle('Position', [x(1), y(1), width, height], 'EdgeColor','r');%%draw rectangle
    %imwrite(img, [root 'test.bmp'], 'bmp');%%save mirror image
    clc;
end
fclose(data);