function [father,mather]= selectparent(genoms,fitness)
    %����ѡ��ѡ������������ĸ��ѡ��Ҫ����ĸ�ĸ
    [ma,a]=max(fitness(:,2));
    tempfit = fitness;
    tempfit(a,:)=[0,0,0];
    [ma2,b]=max(tempfit(:,2));
    %fprintf('a=%d,b=%d\n',a,b);
    father = genoms(a,:);
    mather = genoms(b,:);
end