%ATaCRSIG_matlabsetup

clear; close all

addpath ('function');

%day data
startlist = 'NOISETC_CI/starttimes.txt'; % list of start times for data download
stalist = 'NOISETC_CI/stalist.txt';
datalength = 86400; % length of time series after each start time in seconds (default 86400, code not thoroughly tested for other values)
sacdaydata = 'DATA'; % path to local day sac files

download_networks = '7D'; %'2D'; % list of networks to download
download_stations = textread('./NOISETC_CI/stalist.txt','%s'); % list of stations to download (* for all)

%Channel Names
chz_vec = 'BHZ'; % list of acceptable names for Z component
ch1_vec = 'BH1'; % list of acceptable names for H1 component
ch2_vec = 'BH2'; % list of acceptable names for H2 component
chp_vec = 'BDH'; % list of acceptable names for P component

datacache = 'NOISETC_CI/DATA/datacache_day'; % output folder for data

if ~exist(datacache,'dir')
    mkdir(datacache)
end

startlist = textread(startlist,'%s');

for id = 1:length(startlist)
   eventid = cell2mat(startlist(id));
   disp(sprintf('Start Time: %s',eventid));
   otime = datenum(eventid,'yyyymmddHHMM');
   starttime = datestr(otime,'yyyy-mm-dd HH:MM:SS');
   endtime = datestr(otime+datalength/3600/24,'yyyy-mm-dd HH:MM:SS');   
   jday = otime - datenum(year(otime),1,1) + 1;
   
   for ista =1:length(download_stations)
       clear traces_day
       error = 0;
       stnm = download_stations{ista};
       network = download_networks;
       if ~exist(fullfile(datacache,network),'dir')
           mkdir(fullfile(datacache,network));
       end
       if ~exist(fullfile(datacache,network,stnm),'dir')
           mkdir(fullfile(datacache,network,stnm));
       end
       sta_filename = fullfile(datacache,network,stnm,[eventid,'_',network,'_',stnm,'.mat']);
       if exist(sta_filename,'file')
           disp(['Exist: ',sta_filename,', Skip!']);
           continue;
       end
       disp(['SAC to MAT station: ',stnm,' From:',starttime,' To:',endtime]);
		try
            ich = 0;
            for ch = {chp_vec ch1_vec ch2_vec chz_vec}
                ich = ich + 1;
                sac_filename = [num2str(year(otime)),'.',num2str(jday,'%03d'),'..',ch{:},'.SAC'];
                sac = rdsac(fullfile(sacdaydata,[network,'.',stnm],sac_filename));
                traces_day(ich) = sac2mat( sac );
                if ich ==1
                    traces_day(ich).channel = 'BDH';
                elseif ich ==2
                    traces_day(ich).channel = 'BH1';
                elseif ich ==3
                    traces_day(ich).channel = 'BH2';
                elseif ich ==4
                    traces_day(ich).channel = 'BHZ';
                end
                traces_day(ich).elevation = traces_day(ich).elevation*1000;
            end
            save(sta_filename,'traces_day');
		catch e
            e.message;
            display('Missing data file');
            error = 1;
        end
    end
   
end
% event data
startlist = 'NOISETC_CI/eventtimes.txt'; % list of start times for data download
datalength = 7200; % length of time series after each start time in seconds (default 86400, code not thoroughly tested for other values)
sacdaydata = 'EVENTS'; % path to local day sac files

datacache = 'NOISETC_CI/DATA/datacache';

if ~exist(datacache,'dir')
    mkdir(datacache)
end
startlist = textread(startlist,'%s');

for id = 1:length(startlist)
   eventid = cell2mat(startlist(id));
   disp(sprintf('Start Time: %s',eventid));
   otime = datenum(eventid,'yyyymmddHHMM');
   starttime = datestr(otime,'yyyy-mm-dd HH:MM:SS');
   endtime = datestr(otime+datalength/3600/24,'yyyy-mm-dd HH:MM:SS');   
   jday = otime - datenum(year(otime),1,1) + 1;
   
   for ista =1:length(download_stations)
       clear traces_day
       error = 0;
       stnm = download_stations{ista};
       network = download_networks;
      if ~exist(fullfile(datacache,eventid),'dir')
           mkdir(fullfile(datacache,eventid));
       end
       sta_filename = fullfile(datacache,eventid,[eventid,'_',network,'_',stnm,'.mat']);
       if exist(sta_filename,'file')
           disp(['Exist: ',sta_filename,', Skip!']);
           continue;
       end
       disp(['SAC to MAT station: ',stnm,' From:',starttime,' To:',endtime]);
		try
            ich = 0;
            for ch = {chp_vec ch1_vec ch2_vec chz_vec}
                ich = ich + 1;
                sac_filename = [num2str(year(otime)),'.',num2str(jday,'%03d'),'.07.09.',ch{:},'.SAC'];
                sac = rdsac(fullfile(sacdaydata,[network,'.',stnm],sac_filename));
                traces(ich) = sac2mat( sac );
                if ich ==1
                    traces(ich).channel = 'BDH';
                elseif ich ==2
                    traces(ich).channel = 'BH1';
                elseif ich ==3
                    traces(ich).channel = 'BH2';
                elseif ich ==4
                    traces(ich).channel = 'BHZ';
                end
                traces(ich).elevation = traces(ich).elevation*1000;
            end
            save(sta_filename,'traces');
		catch e
            e.message;
            display('Missing data file');
            error = 1;
        end
    end
   
end