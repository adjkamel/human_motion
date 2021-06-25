function f = optitrack(fold,ax2,col) 

s=pwd;

 foldetest=fullfile(s,fold);
 
[skeleton,time] = loadbvh(fullfile(foldetest,'v'));






for ff = 1:length(time) %#ok<FORPF>
   
  
    
                              

 arr(1,1)= 1;
 arr(1,2)=0;
 arr(2,1)= 2;
 arr(2,2)=1;
 arr(3,1)= 3;
 arr(3,2)=2;
 arr(4,1)= 4;
 arr(4,2)=3;

 arr(5,1)= 6;
 arr(5,2)=1;
 arr(6,1)= 7;
 arr(6,2)=6;
 arr(7,1)= 8;
 arr(7,2)=7;
 
 arr(8,1)= 13;
 arr(8,2)=12;
 
 arr(9,1)= 14;
 arr(9,2)=13;
 arr(10,1)= 15;
 arr(10,2)=14;
 arr(11,1)= 37;
 arr(11,2)=36 ;
 
 arr(12,1)= 38;
 arr(12,2)=37;
 arr(13,1)= 39;
 arr(13,2)=38;
 arr(14,1)= 60;
 arr(14,2)=1;
 
 arr(15,1)= 62;
 arr(15,2)=60;
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% current
 

 %arr(16,1)= 62;
 %arr(16,2)=60;
 
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% previous
 
 %arr(16,1)= 61; 
 %arr(16,2)=60;
 %arr(17,1)= 62;
 %arr(17,2)=61;
           cla reset;
  
  
  hold on;
 
 view(3);
               text(0, 0,320,num2str(ff));
 
  for nn = 1:15
        
        c=arr(nn,1);
        p=arr(nn,2);
   
        plot3(ax2,skeleton(c).Dxyz(1,ff),skeleton(c).Dxyz(3,ff),skeleton(c).Dxyz(2,ff),'.','markersize',40,'Color',col);
        
        if p > 0
        
       %%%%שששש   disp(skeleton(p).name);   
       
       plot3(ax2,[skeleton(p).Dxyz(1,ff) skeleton(c).Dxyz(1,ff)],...
             [skeleton(p).Dxyz(3,ff) skeleton(c).Dxyz(3,ff)],...
             [skeleton(p).Dxyz(2,ff) skeleton(c).Dxyz(2,ff)],'LineWidth',1,'Color',col);   
       
        %plot3(skeleton(nn).Dxyz(1,ff),skeleton(nn).Dxyz(3,ff),skeleton(nn).Dxyz(2,ff),'.','markersize',20)
        end
      
  end
                            
  view(-165,30)
  axis equal off
  drawnow
  rotate3d on
  grid off

  %pause;

end

end