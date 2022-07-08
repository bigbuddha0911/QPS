clear all
clc

%% Convert tsv to excel
% addpath('C:\Users\bigbuddha0911\Desktop\House\Statistical Analyses\MATLAB\toolbox\tsvread\')

% [data, header, raw] = tsvread('C:\Users\bigbuddha0911\Desktop\House\Statistical Analyses\MATLAB\data\Offence Rates (per capita)—police divisions—monthly from July 2001 20210611.tsv')

% save('C:\Users\bigbuddha0911\Desktop\House\Statistical Analyses\MATLAB\data\converted.mat','raw') % to save

% xlswrite('C:\Users\bigbuddha0911\Desktop\House\Statistical Analyses\MATLAB\data\convertExcel.xlsx',raw) % to write to xlsx

%% Load converted and smaller data
load('C:\Users\bigbuddha0911\Desktop\House\Statistical Analyses\MATLAB\data\converted.mat')

%% extract relevant data
suburbs = unique(raw(2:end,2))
dates_monthYear = unique(raw(2:end,3))
offenceType = raw(1,4:end)

yearStart =  dates_monthYear{1}(end-1:end)
yearEnd = dates_monthYear{end}(end-1:end)

% %% Create dataset for all crimes
% data_allCrime_processed{1} = 'suburb'
% for i = 1:(str2num(dates_monthYear{end}(end-1:end))-str2num(dates_monthYear{1}(end-1:end))+1)
%     data_allCrime_processed{i+1} = i
% end
% 
% for i = 1:length(suburbs)
%     data_allCrime_processed{i+1,1} = suburbs{i}
% end
% 
% % Calculate average crime rate for year per suburb
% 
% for i = 1:length(data)-1 % per suburb
%     for x = 1:str2num(yearEnd)% per year
%         data_allCrime_processed{i+1,x+1} = 
%         
%         target = suburbs{1}
%         find(raw,target)

%% Create dataset of average crime per capita per suburb by year
data_allCrime_average_byYear{1,1} = 'suburb'

% add years
for i = 1:str2num(yearEnd)
    if numel(num2str(i)) == 1
        x = '0'
    else
        x= ''
    end
    data_allCrime_average_byYear{1,i+1} = strcat('20',x,num2str(i))
end

% add suburbs
[length, width] = size(suburbs)

for i = 1:length
    data_allCrime_average_byYear{i+1,1} = suburbs{i}
end

% average for all crime
[length, width] = size(data_allCrime_average_byYear)

%% find all rows that match suburb (s) and year (y)

range = {}

for s = 1:size(suburbs)
    range{s,1} = suburbs{s} % add suburb to range
    index_suburb = find(strcmp(raw(:,2),suburbs{s})) % find all index for suburb
    index_suburb_start = index_suburb(1)
    index_suburb_end = index_suburb(end)
    
    % create temp array to extract data for specific suburb (s)
    temp_array = raw(index_suburb_start:index_suburb_end, 3:end) % use to '3:end' for all crime, use '[3,19:21, 28:31, 33:35, 37:38, 40:41, 48:53, 72]' for property-related crime % raw(index_suburb_start:index_suburb_end,x); include '3' in 'x' variable to ensure Month and Year column remains 
    temp_array_col_one = temp_array(:,1)
    
    %% find average of all crime for the year 2001 (i.e., 'y01')
    year = regexp(temp_array_col_one, regexptranslate('wildcard', '*01')) % change regexptranslate('wildcard', '*XX') so that XX reflects the year (e.g., '01')
    
    x = []
    
    for i = 1:size(year)
        if year{i} == 1
            x = [x, temp_array(i, 2:end)]
        end
    end
    
    year_averageCrime = mean(str2double(x))
    
    range{s,2} = year_averageCrime % range(s,x); where x represents the column number in 'range' allocated for the year number (e.g., y01, y02...)
    
    
    %% find average of all crime for the year 2002
    year = regexp(temp_array_col_one, regexptranslate('wildcard', '*02')) % change regexptranslate('wildcard', '*XX') so that XX reflects the year (e.g., '01')
    
    x = []
    
    for i = 1:size(year)
        if year{i} == 1
            x = [x, temp_array(i, 2:end)]
        end
    end
    
    year_averageCrime = mean(str2double(x))
    
    range{s,3} = year_averageCrime % range(s,x); where x represents the column number in 'range' allocated for the year number (e.g., y01, y02...)

    %% find average of all crime for the year 2003
    year = regexp(temp_array_col_one, regexptranslate('wildcard', '*03')) % change regexptranslate('wildcard', '*XX') so that XX reflects the year (e.g., '01')
    
    x = []
    
    for i = 1:size(year)
        if year{i} == 1
            x = [x, temp_array(i, 2:end)]
        end
    end
    
    year_averageCrime = mean(str2double(x))
    
    range{s,4} = year_averageCrime % range(s,x); where x represents the column number in 'range' allocated for the year number (e.g., y01, y02...)

    %% find average of all crime for the year 2004
    year = regexp(temp_array_col_one, regexptranslate('wildcard', '*04')) % change regexptranslate('wildcard', '*XX') so that XX reflects the year (e.g., '01')
    
    x = []
    
    for i = 1:size(year)
        if year{i} == 1
            x = [x, temp_array(i, 2:end)]
        end
    end
    
    year_averageCrime = mean(str2double(x))
    
    range{s,5} = year_averageCrime % range(s,x); where x represents the column number in 'range' allocated for the year number (e.g., y01, y02...)

    %% find average of all crime for the year 2005
    year = regexp(temp_array_col_one, regexptranslate('wildcard', '*05')) % change regexptranslate('wildcard', '*XX') so that XX reflects the year (e.g., '01')
    
    x = []
    
    for i = 1:size(year)
        if year{i} == 1
            x = [x, temp_array(i, 2:end)]
        end
    end
    
    year_averageCrime = mean(str2double(x))
    
    range{s,6} = year_averageCrime % range(s,x); where x represents the column number in 'range' allocated for the year number (e.g., y01, y02...)

    %% find average of all crime for the year 2006
    year = regexp(temp_array_col_one, regexptranslate('wildcard', '*06')) % change regexptranslate('wildcard', '*XX') so that XX reflects the year (e.g., '01')
    
    x = []
    
    for i = 1:size(year)
        if year{i} == 1
            x = [x, temp_array(i, 2:end)]
        end
    end
    
    year_averageCrime = mean(str2double(x))
    
    range{s,7} = year_averageCrime % range(s,x); where x represents the column number in 'range' allocated for the year number (e.g., y01, y02...)

    %% find average of all crime for the year...
    year = regexp(temp_array_col_one, regexptranslate('wildcard', '*07')) % change regexptranslate('wildcard', '*XX') so that XX reflects the year (e.g., '01')
    
    x = []
    
    for i = 1:size(year)
        if year{i} == 1
            x = [x, temp_array(i, 2:end)]
        end
    end
    
    year_averageCrime = mean(str2double(x))
    
    range{s,8} = year_averageCrime % range(s,x); where x represents the column number in 'range' allocated for the year number (e.g., y01, y02...)

    %% find average of all crime for the year...
    year = regexp(temp_array_col_one, regexptranslate('wildcard', '*08')) % change regexptranslate('wildcard', '*XX') so that XX reflects the year (e.g., '01')
    
    x = []
    
    for i = 1:size(year)
        if year{i} == 1
            x = [x, temp_array(i, 2:end)]
        end
    end
    
    year_averageCrime = mean(str2double(x))
    
    range{s,9} = year_averageCrime % range(s,x); where x represents the column number in 'range' allocated for the year number (e.g., y01, y02...)

    %% find average of all crime for the year...
    year = regexp(temp_array_col_one, regexptranslate('wildcard', '*09')) % change regexptranslate('wildcard', '*XX') so that XX reflects the year (e.g., '01')
    
    x = []
    
    for i = 1:size(year)
        if year{i} == 1
            x = [x, temp_array(i, 2:end)]
        end
    end
    
    year_averageCrime = mean(str2double(x))
    
    range{s,10} = year_averageCrime % range(s,x); where x represents the column number in 'range' allocated for the year number (e.g., y01, y02...)

    %% find average of all crime for the year...
    year = regexp(temp_array_col_one, regexptranslate('wildcard', '*10')) % change regexptranslate('wildcard', '*XX') so that XX reflects the year (e.g., '01')
    
    x = []
    
    for i = 1:size(year)
        if year{i} == 1
            x = [x, temp_array(i, 2:end)]
        end
    end
    
    year_averageCrime = mean(str2double(x))
    
    range{s,11} = year_averageCrime % range(s,x); where x represents the column number in 'range' allocated for the year number (e.g., y01, y02...)
    
    %% find average of all crime for the year...
    year = regexp(temp_array_col_one, regexptranslate('wildcard', '*11')) % change regexptranslate('wildcard', '*XX') so that XX reflects the year (e.g., '01')
    
    x = []
    
    for i = 1:size(year)
        if year{i} == 1
            x = [x, temp_array(i, 2:end)]
        end
    end
    
    year_averageCrime = mean(str2double(x))
    
    range{s,12} = year_averageCrime % range(s,x); where x represents the column number in 'range' allocated for the year number (e.g., y01, y02...)
    
    %% find average of all crime for the year...
    year = regexp(temp_array_col_one, regexptranslate('wildcard', '*12')) % change regexptranslate('wildcard', '*XX') so that XX reflects the year (e.g., '01')
    
    x = []
    
    for i = 1:size(year)
        if year{i} == 1
            x = [x, temp_array(i, 2:end)]
        end
    end
    
    year_averageCrime = mean(str2double(x))
    
    range{s,13} = year_averageCrime % range(s,x); where x represents the column number in 'range' allocated for the year number (e.g., y01, y02...)
    
    %% find average of all crime for the year...
    year = regexp(temp_array_col_one, regexptranslate('wildcard', '*13')) % change regexptranslate('wildcard', '*XX') so that XX reflects the year (e.g., '01')
    
    x = []
    
    for i = 1:size(year)
        if year{i} == 1
            x = [x, temp_array(i, 2:end)]
        end
    end
    
    year_averageCrime = mean(str2double(x))
    
    range{s,14} = year_averageCrime % range(s,x); where x represents the column number in 'range' allocated for the year number (e.g., y01, y02...)
    
    %% find average of all crime for the year...
    year = regexp(temp_array_col_one, regexptranslate('wildcard', '*14')) % change regexptranslate('wildcard', '*XX') so that XX reflects the year (e.g., '01')
    
    x = []
    
    for i = 1:size(year)
        if year{i} == 1
            x = [x, temp_array(i, 2:end)]
        end
    end
    
    year_averageCrime = mean(str2double(x))
    
    range{s,15} = year_averageCrime % range(s,x); where x represents the column number in 'range' allocated for the year number (e.g., y01, y02...)
    
    %% find average of all crime for the year...
    year = regexp(temp_array_col_one, regexptranslate('wildcard', '*15')) % change regexptranslate('wildcard', '*XX') so that XX reflects the year (e.g., '01')
    
    x = []
    
    for i = 1:size(year)
        if year{i} == 1
            x = [x, temp_array(i, 2:end)]
        end
    end
    
    year_averageCrime = mean(str2double(x))
    
    range{s,16} = year_averageCrime % range(s,x); where x represents the column number in 'range' allocated for the year number (e.g., y01, y02...)
    
    %% find average of all crime for the year...
    year = regexp(temp_array_col_one, regexptranslate('wildcard', '*16')) % change regexptranslate('wildcard', '*XX') so that XX reflects the year (e.g., '01')
    
    x = []
    
    for i = 1:size(year)
        if year{i} == 1
            x = [x, temp_array(i, 2:end)]
        end
    end
    
    year_averageCrime = mean(str2double(x))
    
    range{s,17} = year_averageCrime % range(s,x); where x represents the column number in 'range' allocated for the year number (e.g., y01, y02...)
    
    %% find average of all crime for the year...
    year = regexp(temp_array_col_one, regexptranslate('wildcard', '*17')) % change regexptranslate('wildcard', '*XX') so that XX reflects the year (e.g., '01')
    
    x = []
    
    for i = 1:size(year)
        if year{i} == 1
            x = [x, temp_array(i, 2:end)]
        end
    end
    
    year_averageCrime = mean(str2double(x))
    
    range{s,18} = year_averageCrime % range(s,x); where x represents the column number in 'range' allocated for the year number (e.g., y01, y02...)
    
    %% find average of all crime for the year...
    year = regexp(temp_array_col_one, regexptranslate('wildcard', '*18')) % change regexptranslate('wildcard', '*XX') so that XX reflects the year (e.g., '01')
    
    x = []
    
    for i = 1:size(year)
        if year{i} == 1
            x = [x, temp_array(i, 2:end)]
        end
    end
    
    year_averageCrime = mean(str2double(x))
    
    range{s,19} = year_averageCrime % range(s,x); where x represents the column number in 'range' allocated for the year number (e.g., y01, y02...)
    
    %% find average of all crime for the year...
    year = regexp(temp_array_col_one, regexptranslate('wildcard', '*19')) % change regexptranslate('wildcard', '*XX') so that XX reflects the year (e.g., '01')
    
    x = []
    
    for i = 1:size(year)
        if year{i} == 1
            x = [x, temp_array(i, 2:end)]
        end
    end
    
    year_averageCrime = mean(str2double(x))
    
    range{s,20} = year_averageCrime % range(s,x); where x represents the column number in 'range' allocated for the year number (e.g., y01, y02...)
    
end

%% create table with header names
table = array2table(range)
table.Properties.VariableNames(1:2) = {'suburb', 'y2001'}
table.Properties.VariableNames(1:20) = {'suburb', 'y2001', 'y2002', 'y2003', 'y2004', 'y2005', 'y2006', 'y2007', 'y2008', 'y2009', 'y2010', 'y2011', 'y2012', 'y2013', 'y2014', 'y2015', 'y2016', 'y2017', 'y2018', 'y2019'}

%% save as excel file

% writetable(table,'C:\Downloads\crime_data.xls')

% save('C:\Users\bigbuddha0911\Desktop\House\Statistical Analyses\MATLAB\data\QPS_allCrime.mat','table') % for all crime

% save('C:\Users\bigbuddha0911\Desktop\House\Statistical Analyses\MATLAB\data\QPS_propertyRelatedCrime.mat','table') % for property-related crime