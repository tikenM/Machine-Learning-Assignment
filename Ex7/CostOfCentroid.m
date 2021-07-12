function [cost] = CostOfCentroid(X,centroids,idx)
  
  [m,n]=size(X);
   
   K=size(centroids,1);
   diff=0;
   
   for i =1:m
     
     diff=diff+sum((X(i,:).-centroids(idx(i),:)).^2);
     
   endfor
  
    cost=diff/m;
  
  end