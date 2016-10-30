%****************************In the Name of God****************************
% A function for fetching features form HTK file format and convert it to
% matrix with m*n dimension, where m is the size of frames and n is the
% size of features. other outputs are used form writing after extracting 
% bottleneck features properly.

% Permission is granted for anyone to copy, use, modify, or distribute this
% program and accompanying programs and documents for any purpose, provided
% this copyright notice is retained and prominently displayed, along with
% a note saying that the original programs are available from our web page.
%
% The programs and documents are distributed without any warranty, express
% or implied.  As the programs were written for research purposes only,
% they have not been tested to the degree that would be advisable in any
% important application.  All use of these programs is entirely at the
% user's own risk.

% CONTRIBUTORS
%	Created by:
%   	Hassan Taherian
%   	09/2016
%
%           LIMP(Laboratory for Intelligent Multimedia Processing),
%           AUT(Amirkabir University of Technology), Tehran, Iran
% 
%**************************************************************************


function [data,trainMfcIndex,testMfcIndex,trainSamPeriod,testSamPeriod] = prepareTIMIT(inputTrainScript, inputTestScript,useSavedFile)

data=DataClasses.DataStore();
data.valueType=ValueType.gaussian;
fprintf(1,'Beginning to convert\n'); 

if(~useSavedFile)
    %load Train
    [InputFileList,TrainFileNum] =TIMIT.LoadScript(inputTrainScript);
     TrainInput=[];
     trainMfcIndex=[];
     trainSamPeriod=zeros(TrainFileNum,1);
    for i=1:TrainFileNum
       [Input1,samPeriod,~]=TIMIT.readhtk_lite(char(InputFileList(i,:)));
       trainMfcIndex=[trainMfcIndex;ones(size(Input1,1),1)*i]; %#ok
       trainSamPeriod(i)=samPeriod;
       TrainInput=[TrainInput;Input1]; %#ok
    end
    
    %load Test
    [InputFileList,TestFileNum] =TIMIT.LoadScript(inputTestScript);
    TestInput=[];
    testMfcIndex=[];
    testSamPeriod=zeros(TestFileNum,1);
    for i=1:TestFileNum
       [Input1,samPeriod,~]=TIMIT.readhtk_lite(char(InputFileList(i,:)));
       testMfcIndex=[testMfcIndex;ones(size(Input1,1),1)*i]; %#ok
       testSamPeriod(i)=samPeriod;
       TestInput=[TestInput;Input1]; %#ok
    end
    
    %Concatenate 11 Frames
    trainConcate=TIMIT.concatenateFrames(TrainInput,11);
    data.trainData=trainConcate;
    testConcate=TIMIT.concatenateFrames(TestInput,11);
    data.testData=testConcate;
    
    %%truncate last 10 features
    trainMfcIndex=trainMfcIndex(1:end-10,:);
    testMfcIndex=testMfcIndex(1:end-10,:);
    %save for archive records
    fprintf(1,'Train data set size: %d x %d\n', size(trainConcate,1),size(trainConcate,2));
    fprintf(1,'Test data set size: %d x %d\n', size(testConcate,1),size(testConcate,2));
    save('+TIMIT/results/LogSpect72.mat','TrainInput','TestInput','trainSamPeriod','testSamPeriod','trainMfcIndex','testMfcIndex');
    
else
    fprintf(1,'Using Saved .mat file for data\n'); 
    load=matfile('+TIMIT/results/LogSpect72.mat');
    trainConcate=TIMIT.concatenateFrames(load.TrainInput,11);
    testConcate=TIMIT.concatenateFrames(load.TestInput,11);
    data.trainData=trainConcate;
    data.testData=testConcate;
    trainSamPeriod=load.trainSamPeriod;
    testSamPeriod=load.testSamPeriod;
    trainMfcIndex=load.trainMfcIndex;
    testMfcIndex=load.testMfcIndex;
    
    fprintf(1,'Train data set size: %d x %d\n', size(trainConcate,1),size(trainConcate,2));
    fprintf(1,'Test data set size: %d x %d\n', size(testConcate,1),size(testConcate,2));
    
end
fprintf(1,'End of conversion\n');
fprintf(1,'================================================================================\n');
end %End of prepareTIMIT function


