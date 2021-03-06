clear all;


all=input('请输入地图的长和宽（【m n】）:');
m=all(1);
n=all(2);

point = input('请输入起始点坐标【x y】');
x=point(1);
y=point(2);

point_end = input('请输入终止点坐标【x y】');
x_end = point_end(1);
y_end = point_end(2);

count = input('请输入障碍物个数');

map = zeros(m,n);

for i=1:count
    points = input('请输入矩形障碍物坐标(左上,右上，左下和右下顶点[[x1 y1] [x2 y2] [x3 y3] [x4 y4]] ):\n');
    x1 = points(1);
    y1 = points(2);
    x2 = points(3);
    y2 = points(4);
    x3 = points(5);
    y3 = points(6);
    x4 = points(7);
    y4 = points(8);
    %（x1,y1）(x2,y2)
    line_first_a = y2-y1;
    line_first_b = x1-x2;
    line_first_c =  x2*y1 -x1*y2;
    %(x2,y2)(x3,y3)
    line_second_a = y3-y2;
    line_second_b = x2-x3;
    line_second_c =  x3*y2 -x2*y3;
    %(x3,y3)(x4,y4)
    line_third_a = y4-y3;
    line_third_b = x3-x4;
    line_third_c =  x4*y3 -x3*y4;
    %(x4,y4)(x1,y1)
    line_fouth_a = y1-y4;
    line_fouth_b = x4-x1;
    line_fouth_c =  x1*y4 -x4*y1;
  
   %构建地图，通过map矩阵计算障碍物位置，1代表有障碍物，0代表没有障碍物
    for j =1:m
        for k=1:n
            if ((j*line_first_a+k*line_first_b+line_first_c)<=0)&&((j*line_second_a+k*line_second_b+line_second_c)<=0)&&((j*line_third_a+k*line_third_b+line_third_c)<=0)&&((j*line_fouth_a+k*line_fouth_b+line_fouth_c)<=0)
                map(j,k)=1;
            end
        end
    end
end

M=100;%预设种群规模 
D=500;%迭代次数

pc=0.8;%交叉概率
pm=0.7;%变异概率
times=50;%路径条数
first = 1;%第一次的标志



minpath = zeros(1,(abs(x-x_end)*abs(y-y_end)));%保存最短的路径
mindis = zeros(1,2);%最短路径中的有效长度
while times
    %初始化种群，为种群随机的赋予基因
    genoms = zeros(M,(abs(x-x_end)*abs(y-y_end)));
    for i=1:M
    genoms(i,:)=creatgen((abs(x-x_end)*abs(y-y_end)));%赋予基因的函数
    end
    
    %临时的路径和有效长度
    path = zeros(1,(abs(x-x_end)*abs(y-y_end)));
    dis = zeros(1,2);
    DC=D;%迭代计数器
    %循环得到路径
    while DC
        fprintf('%d',DC);
        fitness = getfitness(genoms,x,y,x_end,y_end,map,m,n);%获取种群中每条基因的适应度
        %查看是否有已达到目的地的，如果有停止循环跳出
        [ma,a]= max(fitness(:,2));
        if ma==1
     %  fprintf('%d',a);
            path = genoms(a,:);
            dis = fitness(a,2:3);
            break;
        end
        [father,mather] = selectparent(genoms,fitness);%没有到达的则选择适应度最大的两个作为父母
        genoms = cross(father,mather,M,pc);%将父母交叉，得到新的种群
        genoms = mutate(genoms,pm,M);%对种群的每一条基因的每一位进行变异
        DC=DC-1;
    end
    fprintf('\n mindis =%d',mindis(1,2));
    fprintf('dis =%d\n',dis(1,2));
    %如果是第一次找到则直接复制，否则与最小值比较得到最小的路径
    if first ==1
        mindis = dis;
        minpath = path;
        first = 0;
    else if mindis(1,2)>dis(1,2)&&dis(1,2)>0
        mindis = dis;
        minpath = path;
        end
    end
    times =times-1;
end
%fprintf('sssssssssssssssssssss');
%fprintf('%d',dis(1,2));

%将所有节点存储到一个矩阵中

p = zeros(mindis(1,2)+1,2);
p(1,:)=[x,y];
tempx = x;
tempy = y;
nextx = x;
nexty = y;
for i = 1:mindis(1,2)
    f = minpath(i);
    switch f
        case 1
            nextx = tempx;
            nexty = tempy-1;
     
             fprintf('1');
        case 2
            nextx = tempx;
            nexty = tempy+1;
            fprintf('2');
        case 3
            nextx = tempx-1;
            nexty = tempy;
            fprintf('3');
        case 4
            nextx = tempx+1;
            nexty = tempy;
            fprintf('4');
        case 5
            nextx = tempx-1;
            nexty = tempy-1;
            f_x = -1;
            f_y = -1;
            fprintf('5');
        case 6
            nextx = tempx+1;
            nexty = tempy-1;
            fprintf('6');
        case 7
            nextx = tempx-1;
            nexty = tempy+1;;
            fprintf('7');
        case 8
            nextx = tempx+1;
            nexty = tempy+1;
            fprintf('8');
    end
%    fprintf('(%d,%d)----',tempx,tempy);
%    fprintf('(%d,%d)\n',nextx,nexty);
   % fprintf('s_x = %d',((tempx-1)*32+16));
    %fprintf('s_y = %d',((tempy-1)*32+16));
    p(i+1,:)=[nextx,nexty];
    tempx = nextx;
    tempy = nexty;
end


%提出矩阵中重复的路径

j=1;
while j<=size(p,1)
%    fprintf('%d---',j);
%    fprintf('%d',size(p,1));
    temp = p(j,:);
    [s,l] = ismember(temp,p(j+1:end,:),'rows');
%    fprintf('   l=%d \n',l);
    if l~=0
        p(j+1:j+l,:) = [];
      %  fprintf('  %d  ',size(p,1));
    end
    j=j+1;
end


%将矩阵中在一条直线上的数据合并为头尾两点
q = zeros(size(p));
q(1,:) = [x,y];
c=2;
j=2;
while j<size(p,1)
 %   fprintf('%d,%d',p(j-1,:)-p(j,:));
%    fprintf('   ==%d,%d\n',p(j,:)-p(j+1,:));
    an = (p(j-1,:)-p(j,:)==p(j,:)-p(j+1,:));
    if an(1)~=1||an(2)~=1
%        fprintf('c =%d\n',c);
         q(c,:) = p(j,:);
         c=c+1;    
    end
    j=j+1; 
end
q(c,:) = [x_end,y_end];
q(c+1:end,:)= [];

len = size(q,1);

for i =1:len-1
    fprintf('(%d,%d)---->',q(i,1),q(i,2));
end
fprintf('(%d,%d)',q(len,1),q(len,2));












