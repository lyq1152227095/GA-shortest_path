function img = pic(img,s_x,s_y,n_x,n_y,f_x,f_y)
    if f_x==0&&f_y==0
        return ;
    end
    img(s_x,s_y)=255;
    while 1
        fprintf('s_x = %d',s_x);
        fprintf('s_y = %d',s_y);
        if s_x~=n_x||s_y~=n_y
            img(s_x,s_y)=255;
            s_x = s_x+f_x;
            s_y = s_y+f_y;
        else
            break;
        end
    end
end