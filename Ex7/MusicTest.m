clear ; close all; clc
fprintf('Reading CSV File....\n');
filename='D:\machine-learning-ex\MusicData\Data\features_3_sec.csv'

M=csvread(filename);
Xr=M(2:size(M,1),3:(size(M,2)-1));

%randomise the data read form the CSV

index=round(1 + (size(Xr,1)-1).*rand(1,size(Xr,1)));

X=Xr(index,:);


fprintf('Program paused. Press enter to continue.\n');
pause;

%  Before running PCA, it is important to first normalize X by subtracting 
%  the mean value from each feature

fprintf('Normalising the data.....\n');

[X_norm, mu, sigma] = featureNormalize(X);

fprintf('Program paused. Press enter to continue.\n');
pause;

%  Run PCA
[U, S] = pca(X_norm);


fprintf('Program paused. Press enter to continue.\n');
pause;

Z = projectData(X_norm, U, 2);

K=15;

cost=zeros(K,1);


for i = 1:1:K


   
   max_iters = 30;

% When using K-Means, it is important the initialize the centroids
% randomly. 
% You should complete the code in kMeansInitCentroids.m before proceeding

 initial_centroids = kMeansInitCentroids(X, K);


% Run K-Means
  [centroids, idx] = runkMeans(X, initial_centroids, max_iters);

  cost(i)=CostOfCentroid(X,centroids, idx);
end

fprintf('Program paused. Press enter to continue.\n');
pause;

figure();
plot(cost);
