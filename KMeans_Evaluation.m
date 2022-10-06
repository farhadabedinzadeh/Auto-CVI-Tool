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
addpath("functions")
addpath(genpath(pwd))
%% Load data
% Load the Iris dataset
load fisheriris;
%% Select Parameters proximity
%% Select Distance Type for KMeans
DistanceKMeans = DistKMeans();
%% Generation of clusterings using k-means and varying the number of clusters
Kmax = 6; % Maximum Number of Cluster
clust = zeros(size(meas,1),Kmax);
for k=1:Kmax
    clust(:,k) = kmeans(meas,k,'distance',DistanceKMeans);
end
%% Select CVI
CVI = Select_CVI_KMeans;
% Evaluation of the clustering solutions
eva = evalcvi(clust,CVI, meas);
%% OR
load fisheriris;
Clust = kmeans(meas,Kmax,'distance',DistanceKMeans);
eval = evalcvi(clust,CVI, meas);
%% Visualization
Visualize_CVI(eva,CVI)
%% Compare Multiple CVIs
CVIs = Select_Multiple_CVI_KMeans;
Multiple_Result = Do_Multiple(CVIs,clust,meas);

