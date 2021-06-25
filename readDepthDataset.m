function SEQUENCE = readDepthDataset(file,tline)

%% read file

fid = fopen(file);

num_frames   = fread(fid, 1 ,'ubit32');
n_cols       = fread(fid, 1 ,'ubit32');
n_rows       = fread(fid, 1 ,'ubit32');

%% construct sequence
%SEQUENCE = zeros(num_frames, n_cols * n_rows); % each row represents a frame

SEQUENCE = cell(num_frames, 1);
FRAME = zeros(n_rows,n_cols);


%% read frame

folder='F:\coding\Motion Comparison\meCode\matlab\images\';     

d = dir('F:\coding\Motion Comparison\meCode\matlab\images\*.png');

delete('F:\coding\Motion Comparison\meCode\matlab\images\*.png')




for f = 1:num_frames
    
    for i = 1:n_rows
        tempRow = fread(fid, n_cols, 'ubit32');
        for j = 1:n_cols
            FRAME(i,j) = tempRow(j);
        end
    end
    
      I=mat2gray(FRAME);
      originalMinValue = single(min(min(I)));  
      originalMaxValue = double(max(max(I)));
      originalRange = originalMaxValue - originalMinValue;  
      desiredMin = 0;
      desiredMax = 1;
      desiredRange = desiredMax - desiredMin;
      I = desiredRange * (single(I) - originalMinValue) /originalRange + desiredMin;

     
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   I = I./ max(I(:)) ;
  
      opBaseFileName = sprintf('%d.png', f);
      opFullFileName = fullfile(folder, opBaseFileName);
      imwrite(I,opFullFileName,'png');
     
     
   %  figure, imshow(FRAME); 
   
   
   
end












end