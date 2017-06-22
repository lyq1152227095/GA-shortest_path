function fitness = getfitness(genoms,s_x,s_y,end_x,end_y,map,m,n)
%1�����ƶ���2�����ƶ���3 �����ƶ���4�����ƶ���5�����ƶ���6�����ƶ���7�����ƶ���8�����ƶ�
%����ÿ���������Ӧֵ

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
           %     fprintf('��%d������ĵ�%d��(%d,%d)',i,j,start_x,start_y);
                if start_y-1>0&&(start_x~=end_x||start_y~=end_y)
            %         fprintf('��%d������ĵ�%d+1��(%d,%d)\n',i,j,start_x,start_y-1);
                    if map(start_x,start_y-1)==0
                    start_y=start_y-1;    
                    else
                        break;
                    end
                else 
                    break;
                end
            case 2
            %    fprintf('��%d������ĵ�%d��(%d,%d)',i,j,start_x,start_y);
                 if start_y<n&&(start_x~=end_x||start_y~=end_y)
            %        fprintf('��%d������ĵ�%d+1��(%d,%d)\n',i,j,start_x,start_y+1);
                    if map(start_x,start_y+1)==0
                    start_y=start_y+1;
                    else
                        break;
                    end
                else 
                    break;
                end
            case 3
             %   fprintf('��%d������ĵ�%d��(%d,%d)',i,j,start_x,start_y);
                 if start_x-1>0&&(start_x~=end_x||start_y~=end_y)
             %       fprintf('��%d������ĵ�%d+1��(%d,%d)\n',i,j,start_x-1,start_y);
                    if map(start_x-1,start_y)==0
                    start_x=start_x-1;
                    else
                        break;
                    end
                else 
                    break;
                end
            case 4
             %   fprintf('��%d������ĵ�%d��(%d,%d)',i,j,start_x,start_y);
                 if (start_x<m ) &&(start_x~=end_x||start_y~=end_y)
             %       fprintf('��%d������ĵ�%d+1��(%d,%d)\n',i,j,start_x+1,start_y);
                    if map(start_x+1,start_y)==0
                    start_x=start_x+1;
                    else
                        break;
                    end
                else 
                    break;
                end
            case 5
             %   fprintf('��%d������ĵ�%d��(%d,%d)',i,j,start_x,start_y);
                if (start_x-1>0&&start_y-1>0)&&(start_x~=end_x||start_y~=end_y)
             %        fprintf('��%d������ĵ�%d+1��(%d,%d)\n',i,j,start_x-1,start_y-1);
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
               % fprintf('��%d������ĵ�%d��(%d,%d)',i,j,start_x,start_y);
                if (start_x<m&&start_y-1>0)&&(start_x~=end_x||start_y~=end_y)
               %      fprintf('��%d������ĵ�%d+1��(%d,%d)\n',i,j,start_x+1,start_y-1);
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
             %   fprintf('��%d������ĵ�%d��(%d,%d)',i,j,start_x,start_y);
                 if (start_x-1>0&&start_y<n)&&(start_x~=end_x||start_y~=end_y)
              %      fprintf('��%d������ĵ�%d+1��(%d,%d)\n',i,j,start_x-1,start_y+1);
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
            %    fprintf('��%d������ĵ�%d��(%d,%d)',i,j,start_x,start_y);
                 if ((start_x<m) && (start_y<n))&&(start_x~=end_x||start_y~=end_y)
                     % fprintf('��%d������ĵ�%d+1��(%d,%d)\n',i,j,start_x+1,start_y+1);
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

