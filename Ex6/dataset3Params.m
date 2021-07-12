function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;
cVal=[0.01 0.03 0.1 0.3 1 3 10 30 ];
sigVal=[0.01 0.03 0.1 0.3 1 3 10 30 ];
error=zeros(size(cVal,2)*size(sigVal,2));
% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
Minerror=1000;
Cret=0;
sigmaRet=0;
for C = cVal
   for sigma=sigVal
      model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
      error=mean(double((predictions =svmPredict(model,Xval))~=yval));
      if error<=Minerror
          Minerror=error;
          Cret=C;
          sigmaRet=sigma;        
      endif
      
       

end

end

C=Cret;
sigma=sigmaRet;



% =========================================================================

end
