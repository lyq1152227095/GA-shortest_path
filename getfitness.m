function fitness = getfitness(genoms,s_x,s_y,end_x,end_y,map,m,n)
%1正上移动，2正下移动，3 向左移动，4向右移动，5左上移动，6右上移动，7左下移动，8右下移动
%计算每个基因的适应值

gsize = (size(genoms));
M = gsize(1);
N = gsize(2);
fitness = zeros(M,3);
for i=1:M
    start_x=s_x;
    start_y=s_y;
    count=0;
    for j=1:N
        switch genoms(i,j)
            case 1
           %     fprintf('第%d条基因的第%d步(%d,%d)',i,j,start_x,start_y);
                if start_y-1>0&&(start_x~=end_x||start_y~=end_y)
            %         fprintf('第%d条基因的第%d+1步(%d,%d)\n',i,j,start_x,start_y-1);
                    if map(start_x,start_y-1)==0
                    start_y=start_y-1;    
                    else
                        break;
                    end
                else 
                    break;
                end
            case 2
            %    fprintf('第%d条基因的第%d步(%d,%d)',i,j,start_x,start_y);
                 if start_y<n&&(start_x~=end_x||start_y~=end_y)
            %        fprintf('第%d条基因的第%d+1步(%d,%d)\n',i,j,start_x,start_y+1);
                    if map(start_x,start_y+1)==0
                    start_y=start_y+1;
                    else
                        break;
                    end
                else 
                    break;
                end
            case 3
             %   fprintf('第%d条基因的第%d步(%d,%d)',i,j,start_x,start_y);
                 if start_x-1>0&&(start_x~=end_x||start_y~=end_y)
             %       fprintf('第%d条基因的第%d+1步(%d,%d)\n',i,j,start_x-1,start_y);
                    if map(start_x-1,start_y)==0
                    start_x=start_x-1;
                    else
                        break;
                    end
                else 
                    break;
                end
            case 4
             %   fprintf('第%d条基因的第%d步(%d,%d)',i,j,start_x,start_y);
                 if (start_x<m ) &&(start_x~=end_x||start_y~=end_y)
             %       fprintf('第%d条基因的第%d+1步(%d,%d)\n',i,j,start_x+1,start_y);
                    if map(start_x+1,start_y)==0
                    start_x=start_x+1;
                    else
                        break;
                    end
                else 
                    break;
                end
            case 5
             %   fprintf('第%d条基因的第%d步(%d,%d)',i,j,start_x,start_y);
                if (start_x-1>0&&start_y-1>0)&&(start_x~=end_x||start_y~=end_y)
             %        fprintf('第%d条基因的第%d+1步(%d,%d)\n',i,j,start_x-1,start_y-1);
                    if map(start_x-1,start_y-1)==0
                    start_y=start_y-1;
                    start_x=start_x-1;
                    else
                        break;
                    end
                else 
                    break;
                end
            case 6
               % fprintf('第%d条基因的第%d步(%d,%d)',i,j,start_x,start_y);
                if (start_x<m&&start_y-1>0)&&(start_x~=end_x||start_y~=end_y)
               %      fprintf('第%d条基因的第%d+1步(%d,%d)\n',i,j,start_x+1,start_y-1);
                    if map(start_x+1,start_y-1)==0
                    start_x=start_x+1;
                    start_y=start_y-1;
                    else
                        break;
                    end
                else 
                    break;
                end
            case 7
             %   fprintf('第%d条基因的第%d步(%d,%d)',i,j,start_x,start_y);
                 if (start_x-1>0&&start_y<n)&&(start_x~=end_x||start_y~=end_y)
              %      fprintf('第%d条基因的第%d+1步(%d,%d)\n',i,j,start_x-1,start_y+1);
                    if map(start_x-1,start_y+1)==0
                    start_x=start_x-1;
                    start_y=start_y+1;
                    else
                        break;
                    end
                else 
                    break;
                end
            case 8
            %    fprintf('第%d条基因的第%d步(%d,%d)',i,j,start_x,start_y);
                 if ((start_x<m) && (start_y<n))&&(start_x~=end_x||start_y~=end_y)
                     % fprintf('第%d条基因的第%d+1步(%d,%d)\n',i,j,start_x+1,start_y+1);
                    if map(start_x+1,start_y+1)==0
                    start_x=start_x+1;
                    start_y=start_y+1;
                    else
                        break;
                    end
                else 
                    break;
                end
        end  
         count = j;
    end
    %fprintf('\n');
    %fprintf('(%d,%d)\n',start_x,start_y);
    diffx = end_x-start_x;
    diffy = end_y-start_y;
    fitness(i,1) = i;
    fitness(i,2) = 1/(diffx+diffy+1);
    fitness(i,3) = count;
end


end

