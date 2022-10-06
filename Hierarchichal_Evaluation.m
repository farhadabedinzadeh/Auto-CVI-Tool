% ------------------------------------------------------------------------ %
% This is the code for the Auto-CVI-Tool, which is an Automatic Cluster    %
% validation Toolbox                                                       %
% Version 1.0 October 2022   |  Copyright (c) 2022   | All rights reserved %
%        ------------------------------------------------------            %
% Redistribution and use in source and binary forms, with or without       %
% modification, are permitted provided that the following conditions are   %
% met:                                                                     %
%    * Redistributions of source code must retain the above copyright      %
%    * Redistributions in binary form must reproduce the above copyright.  %
%         ------------------------------------------------------           %
%                         "Auto-CVI-Tool,                                  %
%              An Automatic Culster Validation Toolbox"                    %
%         ------------------------------------------------------           %
%            Farhad Abedinzadeh | farhaad.abedinzade@gmail.com             %
% ------------------------------------------------------------------------ %

clc;clear;close
%% this script is for K-Means
%% Set Path
addpath("functions\")
addpath(genpath(pwd))
%% Load data
% Load the Iris dataset
load fisheriris;
%% Select Hierarchichal Method
HierMethod = HierarchichalMethod;
Z = linkage(meas, HierMethod);
%% Generation of clusterings when varying the number of clusters
Kmax = 6; % Maximum Number of Cluster
clust = zeros(size(meas,1),Kmax);
for k=1:Kmax
    clust(:,k) = cluster(Z, 'maxclust', k);
end
%% Evaluation of the clustering solutions 
%% PDIST2: Pairwise distance between two sets of observations
DistanceType = Distance_PDIST2;
DXX = pdist2(meas,meas,DistanceType);
%% Select CVI
CVI = Select_CVI_Hierarchichal;
eva = evalcvi(clust,CVI, DXX);
%% Visualization
Visualize_CVI(eva,CVI)
%% Compare Multiple CVI
CVIs = Select_Multiple_CVI_Hierarchichal;
Multiple_Result = Do_Multiple(CVIs,clust,DXX);