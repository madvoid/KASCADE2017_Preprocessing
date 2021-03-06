function lems = importfile(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as a matrix.
%   LEMSA00 = IMPORTFILE(FILENAME) Reads data from text file FILENAME for
%   the default selection.
%
%   LEMSA00 = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from rows
%   STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   LEMSA00 = importfile('LEMSA_00.CSV', 2, 18282);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2017/01/18 10:26:38

%% Initialize variables.
delimiter = ',';
if nargin<=2
    startRow = 2;
    endRow = inf;
end

%% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
%   column7: double (%f)
%	column8: double (%f)
%   column9: double (%f)
%	column10: double (%f)
%   column11: double (%f)
%	column12: double (%f)
%   column13: double (%f)
%	column14: double (%f)
%   column15: double (%f)
%	column16: double (%f)
%   column17: double (%f)
%	column18: double (%f)
%   column19: double (%f)
%	column20: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Create output variable
lems = table(dataArray{1:end-1}, 'VariableNames', {'Year','Month','Date','Hour','Minute','Second','Bat_Lvl','MLX_IR_C','MLX_Amb_C','Upper_Soil_Temp','Upper_Soil_Mois','Lower_Soil_Temp','Lower_Soil_Mois','Pressure','BMP_Amb','Wind_Dir','Wind_Spd','Sunlight','SHT_Amb_C','SHT_Hum_Pct'});

