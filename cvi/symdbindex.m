function f = symdbindex(clust,X,varargin)
% SYMDBINDEX Evaluation based on the  Davies-Bouldin based on Symmetry (SDB) criterion.
%   SYMINDEX(CLUST, X) computes the Davies-Bouldin based on Symmetry (SDB) criterion 
%   value which can be used for estimating the number of clusters on data.
%   The optimal number of clusters is the solution with the lowest index value.
%
%   X is an N-by-P data matrix with one row per observation and one
%   column per variable. CLUST is a numeric vector that represents 
%   a clustering solution. By default, the SDB index uses the Symetry
%   distance and internally uses the Euclidean distance.
%
%   V = SYMDBINDEX(CLUST, X) returns a positive numeric value corresponding to
%   the SDB index.
%   
%   V = SYMDBINDEX(..., 'DISTANCE', value) computes the SDB index using
%   a specified distance measure. The available built-in measures are:
%       'euc'           - Euclidean distance (the default).
%       'neuc'          - Normalized Euclidean distance.
%       'cos'           - Cosine similarity.
%       'pcorr'         - Pearson's correlation coefficient.
%       'scorr'         - Spearman's correlation coefficient.
%       'lap'           - Laplacian distance.
%
%   Example:
%   -------
%   load fisheriris;
%   clust = kmeans(meas,3,'distance','sqeuclidean');
%   eva   = symdbindex(clust, meas);
%
%   See also EVALCVI, SYMINDEX, CHINDEX, XBINDEX, PBMINDEX, SFINDEX, DBCVINDEX
%
%   Reference:
%   ----------
%   S. Saha and S. Bandyopadhyay, "Performance Evaluation of Some 
%   Symmetry-Based Cluster Validity Indexes," 
%   IEEE Transactions on Systems, Man, and Cybernetics, Part C (Applications and Reviews), 
%   Vol. 39, No. 4, pp. 420–425, 2009.
%
% ------------------------------------------------------------------------
%   Version 1.0 (Matlab R2020b Unix)
%   Copyright (c) 2021, A. Jose-Garcia and W. Gomez-Flores
% ------------------------------------------------------------------------
%Parameter validation
if nargin > 2
    [varargin{:}] = convertStringsToChars(varargin{:});
end
pnames = {'distance'}; pdvals = {'euc'};
[Dtype] = internal.stats.parseArgs(pnames, pdvals, varargin{:});
pfun = proxconfig(Dtype);
% ------------------------------------------------------------------------
% Validation of the clustering solution 
N = numel(clust);
cnames = unique(clust);
K = numel(cnames);
Nk = accumarray(clust,ones(N,1),[K,1]);
if sum(Nk<1) || K==1
    f = Inf;
    return;
end

% Intra-cluster cohesion (compactness)
M = NaN(K,size(X,2));
Si = zeros(1,K);
for i = 1:K
    members = (clust == cnames(i));
    M(i,:) = mean(X(members,:),1);
    
    dps = symdist(X(clust == i,:),M(i,:),Nk(i),pfun);
    Si(i) = mean(dps);
end

% Dispersion inter-cluster
Mij = feval(pfun,M',M');% Distancia entre centroides
R = -inf(K);
for i = 1:K
    for j = setdiff(1:K,i)
        R(i,j) = (Si(i)+Si(j))/Mij(i,j);
    end
end
R = real(R); % Consider the real part only

% CVI Computation
f = mean(max(R,[],2));
