# Auto-CVI-Tool
Automatic toolbox for Cluster Validity Index(CVI)

A cluster analysis involves identifying the optimal number and natural division of clusters through automatic clustering. A cluster validity index (CVI) can be used to estimate the number of clusters with relative ease. Several cluster solutions have been proposed in the literature in terms of intra-cluster cohesiveness and inter-cluster separation. In spite of this, it is crucial to identify the situations where these CVIs work well and their limitations.
To estimate the number of clusters, this toolbox presents 22 robust CVIs. It is extremely user-friendly and does not require any coding knowledge.
Without writing a single line of code, it is possible to compare 22 CVIs and visualize the results in a comparable manner.
As soon as the data is loaded, all parameters are automatically provided, and the CVIs can be compared without any additional programming.
It is important to note that one section of this [paper](https://dl.acm.org/doi/10.1145/3449639.3459341) was used in the development of this toolbox, and if you use any part of it, please reference both the reference paper and me.


  |-------------------|-------------------------------------------------------------------------------------|
  |     chindex       |  - Calinski-Harabasz index (ch).|
  |     cindex        | - C index (cind).|
  |     copindex      | - COP index (cop).|
  |     csindex       | - CS index (cs).|
  |     cvddindex     |  - Index based on density-involved distance (cvdd).|
  |     cvnnindex     |  - Index based on nearest neighbors (cvnn).|
  |     dbindex       |  - Davies-Bouldin index (db).|
  |     db2index      |  - Enhanced Davies-Bouldin index (db2).|
  |     dbcvindex     |  - Density-based index (dbcv).|
  |     dunnindex     |  - Dunn index (dunn).|
  |     gd31index     |  - Dunn index variant 3,1 (gd31).|
  |     gd33index     |  - Dunn index variant 3,3 (gd33).|
  |     gd41index     | - Dunn index variant 4,1 (gd41).|
  |     gd43index     |  - Dunn index variant 4,3 (gd43).|
  |     gd51index     |  - Dunn index variant 5,1 (gd51).|
  |     gd53index     |  - Dunn index variant 5,3 (gd53).|
  |     lccvindex     |  - Index based on local cores (lccv).|
  |     pbmindex      |  - PBM index (pbm).|
  |     sdbwindex     |  - S_Dbw validity index (sdbw).|
  |     sfindex       |  - Score Function index (sf).|
  |     silindex      |  - Silhouette index (sil).|
  |     ssddindex     |  - Index based on shapes, sizes, densities, and separation distances (ssdd).|
  |     svindex       |  - SV index (sv).|
  |     symindex      |  - Symmetry index (sym).|
  |     symdbindex    |  - Davies-Bouldin index based on symmetry (sdb).|
  |     symdunnindex  | - Dunn index based on symmetry (sdi).|
  |     wbindex       |  - WB index (wb).|
  |    xbindex        |  - Xie-Beni index (xb).|





```
A. José-García and W. Gómez-Flores.
A survey of cluster validity indices for automatic data clustering using differential evolution.
The Genetic and Evolutionary Computation Conference* (GECCO '21), Lille, France, 2021.
DOI: 10.1145/3449639.3459341
```
