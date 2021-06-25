
function f=plot(jnt,nframes,ax2,col)



 arr(1,1)= 1; % parent joint in new order
 arr(1,2)= 0; % parent joint in new order
 
 arr(2,1)= 2;
 arr(2,2)= 1;
 
 arr(3,1)= 3;
 arr(3,2)= 2;
 
 arr(4,1)= 4;
 arr(4,2)= 3;

 arr(5,1)= 5;
 arr(5,2)= 1;
  
  
 arr(6,1)= 6;
 arr(6,2)= 5;
  
  
 arr(7,1)= 7;
  arr(7,2)= 6;

 arr(14,1)= 14; 
  arr(14,2)= 1; 
 
 arr(8,1)= 8;
  arr(8,2)= 14;
  
 arr(9,1)= 9;
  arr(9,2)= 8;
  
 arr(10,1)= 10;
  arr(10,2)= 9;


 arr(11,1)= 11;
  arr(11,2)= 14;
  
 arr(12,1)= 12;
  arr(12,2)= 11;
  
 arr(13,1)= 13;
  arr(13,2)= 12;

 arr(15,1)= 15;
  arr(15,2)= 14;






 
 load(jnt);



num_frame = size(d_skel,3);




for j = 1 :num_frame                                     

 
   
   Skeleton(1,1,j) = 0; 
   Skeleton(2,1,j) = 0; 
   Skeleton(3,1,j) = 0; 
   
   Skeleton(1,2,j) = d_skel(17,1,j)-d_skel(4,1,j); 
   Skeleton(2,2,j) = d_skel(17,2,j)-d_skel(4,2,j); 
   Skeleton(3,2,j) = d_skel(17,3,j)-d_skel(4,3,j); 
   
   Skeleton(1,3,j) = d_skel(18,1,j)-d_skel(4,1,j); 
   Skeleton(2,3,j) = d_skel(18,2,j)-d_skel(4,2,j); 
   Skeleton(3,3,j) = d_skel(18,3,j)-d_skel(4,3,j); 
   
   Skeleton(1,4,j) = d_skel(19,1,j)-d_skel(4,1,j); 
   Skeleton(2,4,j) = d_skel(19,2,j)-d_skel(4,2,j); 
   Skeleton(3,4,j) = d_skel(19,3,j)-d_skel(4,3,j); 
   
   Skeleton(1,5,j) = d_skel(13,1,j)-d_skel(4,1,j); 
   Skeleton(2,5,j) = d_skel(13,2,j)-d_skel(4,2,j); 
   Skeleton(3,5,j) = d_skel(13,3,j)-d_skel(4,3,j); 
   
   Skeleton(1,6,j) = d_skel(14,1,j)-d_skel(4,1,j); 
   Skeleton(2,6,j) = d_skel(14,2,j)-d_skel(4,2,j); 
   Skeleton(3,6,j) = d_skel(14,3,j)-d_skel(4,3,j); 
   
   Skeleton(1,7,j) = d_skel(15,1,j)-d_skel(4,1,j); 
   Skeleton(2,7,j) = d_skel(15,2,j)-d_skel(4,2,j); 
   Skeleton(3,7,j) = d_skel(15,3,j)-d_skel(4,3,j);
   
   Skeleton(1,8,j) = d_skel(9,1,j)-d_skel(4,1,j); 
   Skeleton(2,8,j) = d_skel(9,2,j)-d_skel(4,2,j); 
   Skeleton(3,8,j) = d_skel(9,3,j)-d_skel(4,3,j);
   
   Skeleton(1,9,j) = d_skel(10,1,j)-d_skel(4,1,j); 
   Skeleton(2,9,j) = d_skel(10,2,j)-d_skel(4,2,j); 
   Skeleton(3,9,j) = d_skel(10,3,j)-d_skel(4,3,j);
   
   Skeleton(1,10,j) = d_skel(11,1,j)-d_skel(4,1,j); 
   Skeleton(2,10,j) = d_skel(11,2,j)-d_skel(4,2,j); 
   Skeleton(3,10,j) = d_skel(11,3,j)-d_skel(4,3,j);
   
   Skeleton(1,11,j) = d_skel(5,1,j)-d_skel(4,1,j); 
   Skeleton(2,11,j) = d_skel(5,2,j)-d_skel(4,2,j); 
   Skeleton(3,11,j) = d_skel(5,3,j)-d_skel(4,3,j);
   
   Skeleton(1,12,j) = d_skel(6,1,j)-d_skel(4,1,j); 
   Skeleton(2,12,j) = d_skel(6,2,j)-d_skel(4,2,j); 
   Skeleton(3,12,j) = d_skel(6,3,j)-d_skel(4,3,j);
   
   Skeleton(1,13,j) = d_skel(7,1,j)-d_skel(4,1,j); 
   Skeleton(2,13,j) = d_skel(7,2,j)-d_skel(4,2,j); 
   Skeleton(3,13,j) = d_skel(7,3,j)-d_skel(4,3,j);
   
   Skeleton(1,14,j) = d_skel(2,1,j)-d_skel(4,1,j); 
   Skeleton(2,14,j) = d_skel(2,2,j)-d_skel(4,2,j); 
   Skeleton(3,14,j) = d_skel(2,3,j)-d_skel(4,3,j);
   
   Skeleton(1,15,j) = d_skel(1,1,j)-d_skel(4,1,j); 
   Skeleton(2,15,j) = d_skel(1,2,j)-d_skel(4,2,j); 
   Skeleton(3,15,j) = d_skel(1,3,j)-d_skel(4,3,j);
   

       cla reset;
 
  hold on;
 
 view(3);
               text(0, 0,320,num2str(j));
 
  for nn = 1:15
        
        c=arr(nn,1);
        p=arr(nn,2);
                  
        plot3(ax2,Skeleton(1,c,j),Skeleton(2,c,j),Skeleton(3,c,j),'.','markersize',40,'Color',col);
        
        if p > 0  
            
        plot3(ax2,[ Skeleton(1,p,j)  Skeleton(1,c,j)],...
                   [ Skeleton(2,p,j)  Skeleton(2,c,j)],...
                   [ Skeleton(3,p,j)  Skeleton(3,c,j)],'LineWidth',1,'Color',col);  
        end
      
  end
                            
  view(0,90)
  axis equal off
  drawnow
  rotate3d on
  grid off
   
   
   
 
end

          
           
           
end
