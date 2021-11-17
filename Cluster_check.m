% Geosom_clustering
% https://www.mathworks.com/help/stats/evalclusters.html

clear all
clc

df=csvread('E:\Desktop_copied\Master data sets\Data A\1687_cases\ASF_Hwakes_1-1687.csv',1);
df_cls_ceck=df(:,4:end);
X= df_cls_ceck;
n=15;
klist=2:n;%the number of clusters you want to try
myfunc = @(X,K)(kmeans(X, K));
eva = evalclusters(X,myfunc,'CalinskiHarabasz','klist',klist);
% eva = evalclusters(X,myfunc,'gap','klist',klist);

%E = evalclusters(X,'kmeans','DaviesBouldin','klist', [1:10])
figure;
set(gcf,'color','w');
plot(eva)
[idx,C]=kmeans(X,eva.OptimalK);
% [idx,C]=kmeans(X,3); % examining with 3 clusters
figure;
set(gcf,'color','w');
%scatter(X(:,2),X(:,1),'k*') % plotting wrt coordiinates

plot(X(idx==1,2),X(idx==1,1),'r.','MarkerSize',12)
hold on
plot(X(idx==2,2),X(idx==2,1),'b.','MarkerSize',12)
plot(X(idx==3,2),X(idx==3,1),'g.','MarkerSize',12)
xlabel('Longitude'); ylabel('Latitude')
% plot(C(:,2),C(:,1),'kx',...
%      'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Cluster 3',...
       'Location','NW')
title 'Cluster Assignments '
hold off