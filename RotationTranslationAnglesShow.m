function [Skeleton GR GT GMT LMT Global Local angle nframes] = RotationTranslationAngles(tes)%% (1..17;(x,y,z))

[skeletonTab,nframes]= test('net-epoch-8805',15,tes);


for j=1:nframes
  i=1;
  for k = 1 :3: 51
   Skeleton(1,i,j) = skeletonTab(j,k); 
   Skeleton(2,i,j) = skeletonTab(j,k+1); 
   Skeleton(3,i,j) = skeletonTab(j,k+2); 
   i=i+1;
  end
  
       
      
  
  %%%%%%%%%%% j:frame, i: joint ; 1,2,3: coordinates.
end  %%%%%%%% tt(:,1,1) first joint in the first frame,second joint in the first frame tt(:,2,1) 

%%%%%%%%%%% calculate global rotation and translation for each joint in each frame start from the second frame using
%kabsh algorithm GR GT  j1 and j1       
         
%%%%%%%%%%%% Create  Global Matrix Transform for each joint  from GR GT  (GMT 1 . . 17 , matrix)

numTransform=1; %  (numTransform= nframes-1) and numTransform=j
b=[0 0 0 1];          
for j=2:nframes    %%%%%%% start calcule rotation and translation from the second frame finish before last
      %%%%%%%%%%%% number of translations is nframes-1
     
  for i = 1 :17
      
  if j== nframes  %%%%%%% last frame
  
    [r,t] = Kabsch([Skeleton(1,i,j-2),Skeleton(2,i,j-2),Skeleton(3,i,j-2);Skeleton(1,i,j-1),Skeleton(2,i,j-1),Skeleton(3,i,j-1)]', [Skeleton(1,i,j-1),Skeleton(2,i,j-1),Skeleton(3,i,j-1);Skeleton(1,i,j),Skeleton(2,i,j),Skeleton(3,i,j)]');
    GR(:,:,i,numTransform) =r; 
    GT(:,i,numTransform)=t;   
    GMT(:,:,i,numTransform)=[GR(:,:,i,numTransform) GT(:,i,numTransform);b];     
 
  else
      
    [r,t]=Kabsch([Skeleton(1,i,j-1),Skeleton(2,i,j-1),Skeleton(3,i,j-1);Skeleton(1,i,j),Skeleton(2,i,j),Skeleton(3,i,j)]', [Skeleton(1,i,j),Skeleton(2,i,j),Skeleton(3,i,j);Skeleton(1,i,j+1),Skeleton(2,i,j+1),Skeleton(3,i,j+1)]');
    GR(:,:,i,numTransform) =r; 
    GT(:,i,numTransform)=t;
    GMT(:,:,i,numTransform)=[GR(:,:,i,numTransform) GT(:,i,numTransform);b];

  end
  
  end
  
  numTransform=numTransform+1;
end 





%%%%%%%%%%% Creat Local Matrix transform for each joint  (LMT 1 . . 17 , matrix)

 arr(1)= 0; % parent joint in new order
 arr(2)= 1;
 arr(3)= 2;
 arr(4)= 3;

 arr(5)= 1;
 arr(6)= 5;
 arr(7)= 6;

 arr(8)= 1; 
 
 arr(9)= 15;
 arr(10)= 9;
 arr(11)= 10;

 arr(12)= 15;
 arr(13)= 12;
 arr(14)= 13;

 arr(15)= 8;
 arr(16)= 15;
 arr(17)= 16;
 
         
for j=1:nframes-1   %%%%%%% start calcule rotation and translation from the second frame finish before last
%%%%%%%%%%%% number of translations is nframes-1


     
    %%%%%%%%%%%%  origin not concedidered.
     
          
            LMT(:,:,2,j) = GMT(:,:,2,j);
            LMT(:,:,5,j) = GMT(:,:,5,j); 
            LMT(:,:,8,j) = GMT(:,:,8,j);
            LMT(:,:,3,j) = GMT(:,:,3,j)*inv(LMT(:,:,2,j));
            LMT(:,:,4,j) = GMT(:,:,4,j)*inv(LMT(:,:,3,j)*LMT(:,:,2,j));
            LMT(:,:,6,j) = GMT(:,:,6,j)*inv(LMT(:,:,5,j));
            LMT(:,:,7,j) = GMT(:,:,7,j)*inv(LMT(:,:,6,j)*LMT(:,:,5,j));
            LMT(:,:,15,j) = GMT(:,:,15,j)*inv(LMT(:,:,8,j));
            LMT(:,:,9,j) = GMT(:,:,9,j)*inv(LMT(:,:,15,j)*LMT(:,:,8,j));
            LMT(:,:,12,j) = GMT(:,:,12,j)*inv(LMT(:,:,15,j)*LMT(:,:,8,j));
            LMT(:,:,10,j) = GMT(:,:,10,j)*inv(LMT(:,:,9,j)*LMT(:,:,15,j)*LMT(:,:,8,j));
            LMT(:,:,13,j) = GMT(:,:,13,j)*inv(LMT(:,:,12,j)*LMT(:,:,15,j)*LMT(:,:,8,j));
            LMT(:,:,11,j) = GMT(:,:,11,j)*inv(LMT(:,:,10,j)*LMT(:,:,9,j)*LMT(:,:,15,j)*LMT(:,:,8,j));
            LMT(:,:,14,j) = GMT(:,:,14,j)*inv(LMT(:,:,13,j)*LMT(:,:,12,j)*LMT(:,:,15,j)*LMT(:,:,8,j));
            LMT(:,:,16,j) = GMT(:,:,16,j)*inv(LMT(:,:,15,j)*LMT(:,:,8,j));
            LMT(:,:,17,j) = GMT(:,:,17,j)*inv(LMT(:,:,16,j)*LMT(:,:,15,j)*LMT(:,:,8,j));
            
           
         %%%  LMT(:,:,i,j) = GMT(:,:,i,j)*inv(LMT(:,:,i-1,j));
    
   
     
  
  
end 



%%%%%%%%%%% Global  and Local  angles and trnaslation

for j=1:nframes-1   


  for i = 1 :17
   
      
          [gtetax gtetay gtetaz]= GetEulerAngles(GMT(1:3,1:3,i,j));
          [ltetax ltetay ltetaz]= GetEulerAngles(LMT(1:3,1:3,i,j));
          
          %%%%%%%%%%%%%%%%%%% Rotation angles  Global
          Global(1,1,i,j) = gtetax;
          Global(2,1,i,j) = gtetay;
          Global(3,1,i,j) = gtetaz;
          
          %%%%%%%%%%%%%%%%%% Translation
          Global(1,2,i,j) = GMT(1,4,i,j);
          Global(2,2,i,j) = GMT(2,4,i,j); 
          Global(3,2,i,j) = GMT(3,4,i,j); 
          
          %%%%%%%%%%%%%%%%%%% Rotation angles  Local
          Local(1,1,i,j) = ltetax;
          Local(2,1,i,j) = ltetay;
          Local(3,1,i,j) = ltetaz;
          
          %%%%%%%%%%%%%%%%%% Translation
          Local(1,2,i,j) = LMT(1,4,i,j);
          Local(2,2,i,j) = LMT(2,4,i,j); 
          Local(3,2,i,j) = LMT(3,4,i,j); 
           
     end
     
  end
  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Angle between joints  (8 angles)


for j=1:nframes
                    
    %%%%%%%%%% angle 1;
   
   A=  sqrt( (Skeleton(1,1,j)-Skeleton(1,2,j))^2+(Skeleton(2,1,j)-Skeleton(2,2,j))^2+ (Skeleton(3,1,j)-Skeleton(3,2,j))^2 ) ;      % joint1 - joint2
   B=  sqrt( (Skeleton(1,3,j)-Skeleton(1,1,j))^2+(Skeleton(2,3,j)-Skeleton(2,1,j))^2+ (Skeleton(3,3,j)-Skeleton(3,1,j))^2 ) ;      % joint3 - joint1
   C=  sqrt( (Skeleton(1,3,j)-Skeleton(1,2,j))^2+(Skeleton(2,3,j)-Skeleton(2,2,j))^2+ (Skeleton(3,3,j)-Skeleton(3,2,j))^2 ) ;      % joint1 - joint3    
   angle(1,j)=acosd((A^2+C^2- B^2)/(2*A*C));
 
   %%%%%%%%%% angle 2;
   
   A=  sqrt( (Skeleton(1,1,j)-Skeleton(1,5,j))^2+(Skeleton(2,1,j)-Skeleton(2,5,j))^2+ (Skeleton(3,1,j)-Skeleton(3,5,j))^2 ) ;      % joint1 - joint5
   B=  sqrt( (Skeleton(1,6,j)-Skeleton(1,1,j))^2+(Skeleton(2,6,j)-Skeleton(2,1,j))^2+ (Skeleton(3,6,j)-Skeleton(3,1,j))^2 ) ;      % joint6 - joint1
   C=  sqrt( (Skeleton(1,6,j)-Skeleton(1,5,j))^2+(Skeleton(2,6,j)-Skeleton(2,5,j))^2+ (Skeleton(3,6,j)-Skeleton(3,5,j))^2 ) ;      % joint1 - joint6    
   angle(2,j)=acosd((A^2+C^2- B^2)/(2*A*C));   
   
   %%%%%%%%%% angle 3;
   
   A=  sqrt( (Skeleton(1,2,j)-Skeleton(1,3,j))^2+(Skeleton(2,2,j)-Skeleton(2,3,j))^2+ (Skeleton(3,2,j)-Skeleton(3,3,j))^2 ) ;      % joint2 - joint3
   B=  sqrt( (Skeleton(1,4,j)-Skeleton(1,2,j))^2+(Skeleton(2,4,j)-Skeleton(2,2,j))^2+ (Skeleton(3,4,j)-Skeleton(3,2,j))^2 ) ;      % joint4 - joint2
   C=  sqrt( (Skeleton(1,4,j)-Skeleton(1,3,j))^2+(Skeleton(2,4,j)-Skeleton(2,3,j))^2+ (Skeleton(3,4,j)-Skeleton(3,3,j))^2 ) ;      % joint2 - joint4     
   angle(3,j)=acosd((A^2+C^2- B^2)/(2*A*C));   
   
   %%%%%%%%%% angle 4;
   
   A=  sqrt( (Skeleton(1,5,j)-Skeleton(1,6,j))^2+(Skeleton(2,5,j)-Skeleton(2,6,j))^2+ (Skeleton(3,5,j)-Skeleton(3,6,j))^2 ) ;      % joint5 - joint6
   B=  sqrt( (Skeleton(1,7,j)-Skeleton(1,5,j))^2+(Skeleton(2,7,j)-Skeleton(2,5,j))^2+ (Skeleton(3,7,j)-Skeleton(3,5,j))^2 ) ;      % joint7 - joint5
   C=  sqrt( (Skeleton(1,7,j)-Skeleton(1,6,j))^2+(Skeleton(2,7,j)-Skeleton(2,6,j))^2+ (Skeleton(3,7,j)-Skeleton(3,6,j))^2 ) ;      % joint5 - joint7    
   angle(4,j)=acosd((A^2+C^2- B^2)/(2*A*C));   
   
   %%%%%%%%%% angle 5;
   
   A=  sqrt( (Skeleton(1,15,j)-Skeleton(1,9,j))^2+(Skeleton(2,15,j)-Skeleton(2,9,j))^2+ (Skeleton(3,15,j)-Skeleton(3,9,j))^2 ) ;      % joint15 - joint9
   B=  sqrt( (Skeleton(1,10,j)-Skeleton(1,15,j))^2+(Skeleton(2,10,j)-Skeleton(2,15,j))^2+ (Skeleton(3,10,j)-Skeleton(3,15,j))^2 ) ;   % joint10 - joint15
   C=  sqrt( (Skeleton(1,10,j)-Skeleton(1,9,j))^2+(Skeleton(2,10,j)-Skeleton(2,9,j))^2+ (Skeleton(3,10,j)-Skeleton(3,9,j))^2 ) ;      % joint15 - joint10     
   angle(5,j)=acosd((A^2+C^2- B^2)/(2*A*C));   
   
   
   %%%%%%%%%% angle 6;
   
   A=  sqrt( (Skeleton(1,15,j)-Skeleton(1,12,j))^2+(Skeleton(2,15,j)-Skeleton(2,12,j))^2+ (Skeleton(3,15,j)-Skeleton(3,12,j))^2 ) ;      % joint15 - joint12
   B=  sqrt( (Skeleton(1,13,j)-Skeleton(1,15,j))^2+(Skeleton(2,13,j)-Skeleton(2,15,j))^2+ (Skeleton(3,13,j)-Skeleton(3,15,j))^2 ) ;      % joint13 - joint15
   C=  sqrt( (Skeleton(1,13,j)-Skeleton(1,12,j))^2+(Skeleton(2,13,j)-Skeleton(2,12,j))^2+ (Skeleton(3,13,j)-Skeleton(3,12,j))^2 ) ;      % joint15 - joint13   
   angle(6,j)=acosd((A^2+C^2- B^2)/(2*A*C)); 
   
   %%%%%%%%%% angle 7;
   
   A=  sqrt( (Skeleton(1,9,j)-Skeleton(1,10,j))^2+(Skeleton(2,9,j)-Skeleton(2,10,j))^2+ (Skeleton(3,9,j)-Skeleton(3,10,j))^2 ) ;      % joint9 - joint10
   B=  sqrt( (Skeleton(1,11,j)-Skeleton(1,9,j))^2+(Skeleton(2,11,j)-Skeleton(2,9,j))^2+ (Skeleton(3,11,j)-Skeleton(3,9,j))^2 ) ;      % joint11 - joint9
   C=  sqrt( (Skeleton(1,11,j)-Skeleton(1,10,j))^2+(Skeleton(2,11,j)-Skeleton(2,10,j))^2+ (Skeleton(3,11,j)-Skeleton(3,10,j))^2 ) ;   % joint9 - joint11     
   angle(7,j)=acosd((A^2+C^2- B^2)/(2*A*C));    
   
   %%%%%%%%%% angle 8;
   
   A=  sqrt( (Skeleton(1,12,j)-Skeleton(1,13,j))^2+(Skeleton(2,12,j)-Skeleton(2,13,j))^2+ (Skeleton(3,12,j)-Skeleton(3,13,j))^2 ) ;      % joint12 - joint13
   B=  sqrt( (Skeleton(1,14,j)-Skeleton(1,12,j))^2+(Skeleton(2,14,j)-Skeleton(2,12,j))^2+ (Skeleton(3,14,j)-Skeleton(3,12,j))^2 ) ;      % joint14 - joint12
   C=  sqrt( (Skeleton(1,14,j)-Skeleton(1,13,j))^2+(Skeleton(2,14,j)-Skeleton(2,13,j))^2+ (Skeleton(3,14,j)-Skeleton(3,13,j))^2 ) ;      % joint12 - joint14    
   angle(8,j)=acosd((A^2+C^2- B^2)/(2*A*C)); 
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
  
end 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1 : nframes
 
  
 

  
  h = figure(2); clf; hold on
  set(h,'color','white')
   
  
 view(3);
  for nn = 1:17
        
        c=nn; 
        p=arr(nn);
   
   
        plot3( Skeleton(1,c,i),Skeleton(2,c,i),Skeleton(3,c,i),'.','markersize',50)
        
        if p > 0
        
    
       plot3([Skeleton(1,p,i) Skeleton(1,c,i)],...
             [Skeleton(2,p,i) Skeleton(2,c,i)],...
             [Skeleton(3,p,i) Skeleton(3,c,i)],'LineWidth',2); 
       
       
        end
      
  end

 
     
  view(-30,30);
  axis equal on;
  drawnow;
  rotate3d on;
  grid on;
  

        

      
        
    pp=-0.05;
       ang=1;
       
   %%%%%%%%%%%%%%%%%% there is no rotation or translation in the first frame    
   
  if (i<18)
   for hi=1:17
      
      
        annotation('textbox', [0, 0.9+pp, 0, 0.1], 'string', num2str(hi),'FontSize',7);
        annotation('textbox', [0.02, 0.9+pp, 0, 0.1], 'string', num2str(Global(1,1,hi,i)),'FontSize',7);
        annotation('textbox', [0.06, 0.9+pp, 0, 0.1], 'string', num2str(Global(2,1,hi,i)),'FontSize',7);
        annotation('textbox', [0.10, 0.9+pp, 0, 0.1], 'string', num2str(Global(3,1,hi,i)),'FontSize',7);
        annotation('textbox', [0.14, 0.9+pp, 0, 0.1], 'string', num2str(Global(1,2,hi,i)),'FontSize',7);
        annotation('textbox', [0.18, 0.9+pp, 0, 0.1], 'string', num2str(Global(2,2,hi,i)),'FontSize',7);
        annotation('textbox', [0.22, 0.9+pp, 0, 0.1], 'string', num2str(Global(3,2,hi,i)),'FontSize',7);
        
        annotation('textbox', [0.26, 0.9+pp, 0, 0.1], 'string',  Skeleton(1,hi,i),'FontSize',7); 
        annotation('textbox', [0.30, 0.9+pp, 0, 0.1], 'string',  Skeleton(2,hi,i),'FontSize',7); 
        annotation('textbox', [0.34, 0.9+pp, 0, 0.1], 'string',  Skeleton(3,hi,i),'FontSize',7);
        
        annotation('textbox', [0.65, 0.9+pp, 0, 0.1], 'string', num2str(Local(1,1,hi,i)),'FontSize',7);
        annotation('textbox', [0.69, 0.9+pp, 0, 0.1], 'string', num2str(Local(2,1,hi,i)),'FontSize',7);
        annotation('textbox', [0.73, 0.9+pp, 0, 0.1], 'string', num2str(Local(3,1,hi,i)),'FontSize',7);
        annotation('textbox', [0.77, 0.9+pp, 0, 0.1], 'string', num2str(Local(1,2,hi,i)),'FontSize',7);
        annotation('textbox', [0.81, 0.9+pp, 0, 0.1], 'string', num2str(Local(2,2,hi,i)),'FontSize',7);
        annotation('textbox', [0.85, 0.9+pp, 0, 0.1], 'string', num2str(Local(3,2,hi,i)),'FontSize',7);
      
        pp=pp-0.05;
        
    end;
      
   end
       pp=-0.05;
       
       for ang=1:8
           
           annotation('textbox', [0.95, 0.9+pp, 0, 0.1], 'string', num2str(angle(ang,i)),'FontSize',7);
            pp=pp-0.05;
       end   
  
 % figure(5);
 %imshow(ci);

  pause;
 

            
end; 



end