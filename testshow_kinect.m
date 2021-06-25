

function [Glob ,Loc ,angle, nframes]=testshow(fold,tab)

 global Local;
 global Global;
 global  arr;

 %arr(1,1)= 1;
% arr(1,2)=0;
% arr(2,1)= 2;
% arr(2,2)=1;
% arr(3,1)= 3;
% arr(3,2)=2;
 %arr(4,1)= 4;
% arr(4,2)=3;

% arr(5,1)= 6;
% arr(5,2)=1;
 %arr(6,1)= 7;
 %arr(6,2)=6;
 %arr(7,1)= 8;
% arr(7,2)=7;
 
% arr(8,1)= 13;
% arr(8,2)=12;
 
% arr(9,1)= 14;
% arr(9,2)=13;
% arr(10,1)= 15;
% arr(10,2)=14;
% arr(11,1)= 37;
% arr(11,2)=36 ;
 
% arr(12,1)= 38;
% arr(12,2)=37;
% arr(13,1)= 39;
 %arr(13,2)=38;
 %arr(14,1)= 60;
 %arr(14,2)=1;
 
 %arr(15,1)= 62;
 %arr(15,2)=60;
 
 
 arr(1)= 0; % parent joint in new order
 arr(2)= 1;
 arr(3)= 2;
 arr(4)= 3;

 arr(5)= 1;
 arr(6)= 5;
 arr(7)= 6;

 arr(14)= 1; 
 
 arr(8)= 14;
 arr(9)= 8;
 arr(10)= 9;

 arr(11)= 14;
 arr(12)= 11;
 arr(13)= 12;

 arr(15)= 14;


old_data=[];

s=pwd;

 foldetest=fullfile(s,fold);
 
[skelorg,time] = loadbvh(fullfile(foldetest,'v'));



   
    
 

%NumFiles= size(Files,1);

%net = load(fullfile(folderexp,epoch)) ; 
    %skeletonTab= test(epoch,lay,fold) ;
    
   
for j = 1 :  1:length(time)   %%%%%%%% same as number of frames  and number of transformation.                                       
  

   
   
   Skeleton(1,1,j) = 0; 
   Skeleton(2,1,j) = 0; 
   Skeleton(3,1,j) = 0; 
   
   Skeleton(1,2,j) = skelorg(2).Dxyz(1,j)-skelorg(1).Dxyz(1,j); 
   Skeleton(2,2,j) = skelorg(2).Dxyz(3,j)-skelorg(1).Dxyz(3,j); 
   Skeleton(3,2,j) = skelorg(2).Dxyz(2,j)-skelorg(1).Dxyz(2,j); 
   
   Skeleton(1,3,j) = skelorg(3).Dxyz(1,j)-skelorg(1).Dxyz(1,j); 
   Skeleton(2,3,j) = skelorg(3).Dxyz(3,j)-skelorg(1).Dxyz(3,j); 
   Skeleton(3,3,j) = skelorg(3).Dxyz(2,j)-skelorg(1).Dxyz(2,j); 
   
   Skeleton(1,4,j) = skelorg(4).Dxyz(1,j)-skelorg(1).Dxyz(1,j); 
   Skeleton(2,4,j) = skelorg(4).Dxyz(3,j)-skelorg(1).Dxyz(3,j); 
   Skeleton(3,4,j) = skelorg(4).Dxyz(2,j)-skelorg(1).Dxyz(2,j); 
   
   Skeleton(1,5,j) = skelorg(6).Dxyz(1,j)-skelorg(1).Dxyz(1,j); 
   Skeleton(2,5,j) = skelorg(6).Dxyz(3,j)-skelorg(1).Dxyz(3,j); 
   Skeleton(3,5,j) = skelorg(6).Dxyz(2,j)-skelorg(1).Dxyz(2,j); 
   
   Skeleton(1,6,j) = skelorg(7).Dxyz(1,j)-skelorg(1).Dxyz(1,j); 
   Skeleton(2,6,j) = skelorg(7).Dxyz(3,j)-skelorg(1).Dxyz(3,j); 
   Skeleton(3,6,j) = skelorg(7).Dxyz(2,j)-skelorg(1).Dxyz(2,j); 
   
   Skeleton(1,7,j) = skelorg(8).Dxyz(1,j)-skelorg(1).Dxyz(1,j); 
   Skeleton(2,7,j) = skelorg(8).Dxyz(3,j)-skelorg(1).Dxyz(3,j); 
   Skeleton(3,7,j) = skelorg(8).Dxyz(2,j)-skelorg(1).Dxyz(2,j);
   
   Skeleton(1,8,j) = skelorg(13).Dxyz(1,j)-skelorg(1).Dxyz(1,j); 
   Skeleton(2,8,j) = skelorg(13).Dxyz(3,j)-skelorg(1).Dxyz(3,j); 
   Skeleton(3,8,j) = skelorg(13).Dxyz(2,j)-skelorg(1).Dxyz(2,j);
   
   Skeleton(1,9,j) = skelorg(14).Dxyz(1,j)-skelorg(1).Dxyz(1,j); 
   Skeleton(2,9,j) = skelorg(14).Dxyz(3,j)-skelorg(1).Dxyz(3,j); 
   Skeleton(3,9,j) = skelorg(14).Dxyz(2,j)-skelorg(1).Dxyz(2,j);
   
   Skeleton(1,10,j) = skelorg(15).Dxyz(1,j)-skelorg(1).Dxyz(1,j); 
   Skeleton(2,10,j) = skelorg(15).Dxyz(3,j)-skelorg(1).Dxyz(3,j); 
   Skeleton(3,10,j) = skelorg(15).Dxyz(2,j)-skelorg(1).Dxyz(2,j);
   
   Skeleton(1,11,j) = skelorg(37).Dxyz(1,j)-skelorg(1).Dxyz(1,j); 
   Skeleton(2,11,j) = skelorg(37).Dxyz(3,j)-skelorg(1).Dxyz(3,j); 
   Skeleton(3,11,j) = skelorg(37).Dxyz(2,j)-skelorg(1).Dxyz(2,j);
   
   Skeleton(1,12,j) = skelorg(38).Dxyz(1,j)-skelorg(1).Dxyz(1,j); 
   Skeleton(2,12,j) = skelorg(38).Dxyz(3,j)-skelorg(1).Dxyz(3,j); 
   Skeleton(3,12,j) = skelorg(38).Dxyz(2,j)-skelorg(1).Dxyz(2,j);
   
   Skeleton(1,13,j) = skelorg(39).Dxyz(1,j)-skelorg(1).Dxyz(1,j); 
   Skeleton(2,13,j) = skelorg(39).Dxyz(3,j)-skelorg(1).Dxyz(3,j); 
   Skeleton(3,13,j) = skelorg(39).Dxyz(2,j)-skelorg(1).Dxyz(2,j);
   
   Skeleton(1,14,j) = skelorg(60).Dxyz(1,j)-skelorg(1).Dxyz(1,j); 
   Skeleton(2,14,j) = skelorg(60).Dxyz(3,j)-skelorg(1).Dxyz(3,j); 
   Skeleton(3,14,j) = skelorg(60).Dxyz(2,j)-skelorg(1).Dxyz(2,j);
   
   Skeleton(1,15,j) = skelorg(62).Dxyz(1,j)-skelorg(1).Dxyz(1,j); 
   Skeleton(2,15,j) = skelorg(62).Dxyz(3,j)-skelorg(1).Dxyz(3,j); 
   Skeleton(3,15,j) = skelorg(62).Dxyz(2,j)-skelorg(1).Dxyz(2,j);


  
  
 
  
 %  (j= nframes-1) and j=j
b=[0 0 0 1];  

if j>2    %%% we should have 3 frames to start calculate transformation.
     
  for i = 1 :15
      
   if j== 3  %%%%%%%%%%%% j=3 calculate transformation of the previous frame
       
    [r,t]=Kabsch([Skeleton(1,i,j-2),Skeleton(2,i,j-2),Skeleton(3,i,j-2);Skeleton(1,i,j-1),Skeleton(2,i,j-1),Skeleton(3,i,j-1)]', [Skeleton(1,i,j-1),Skeleton(2,i,j-1),Skeleton(3,i,j-1);Skeleton(1,i,j),Skeleton(2,i,j),Skeleton(3,i,j)]');
   
    GR(:,:,i,2) =r;    %%%% 2 number of transformation
    GT(:,i,2)=t;
    GMT(:,:,i,2)=[GR(:,:,i,2) GT(:,i,2);b];    
 
    GMT(:,:,i,1)=0;   %%%%%%%first transformation =0  1 number of transformation
   end
                    %%%%%%%%%%%%% j=3 or more
                    
    [r,t] = Kabsch([Skeleton(1,i,j-2),Skeleton(2,i,j-2),Skeleton(3,i,j-2);Skeleton(1,i,j-1),Skeleton(2,i,j-1),Skeleton(3,i,j-1)]', [Skeleton(1,i,j-1),Skeleton(2,i,j-1),Skeleton(3,i,j-1);Skeleton(1,i,j),Skeleton(2,i,j),Skeleton(3,i,j)]');
    GR(:,:,i,j) =r; 
    

    
    GT(:,i,j)=t;   
    GMT(:,:,i,j)=[GR(:,:,i,j) GT(:,i,j);b];     
   
    
  end %%%%%%%%%%%end for i
  
   
  if j== 3
            
       
            LMT(:,:,2,2)  = GMT(:,:,2,2); %%%%% number of transformation
            LMT(:,:,5,2)  = GMT(:,:,5,2); 
         %  LMT(:,:,8,2)  = GMT(:,:,8,2);
            LMT(:,:,3,2)  = GMT(:,:,3,2)*inv(LMT(:,:,2,2));
            LMT(:,:,4,2)  = GMT(:,:,4,2)*inv(LMT(:,:,3,2)*LMT(:,:,2,2));
            LMT(:,:,6,2)  = GMT(:,:,6,2)*inv(LMT(:,:,5,2));
            LMT(:,:,7,2)  = GMT(:,:,7,2)*inv(LMT(:,:,6,2)*LMT(:,:,5,2));
            LMT(:,:,14,2) = GMT(:,:,14,2);
            LMT(:,:,8,2)  = GMT(:,:,8,2)*inv(LMT(:,:,14,2));
            LMT(:,:,11,2) = GMT(:,:,11,2)*inv(LMT(:,:,14,2));
            LMT(:,:,9,2) = GMT(:,:,9,2)*inv(LMT(:,:,8,2)*LMT(:,:,14,2));
            LMT(:,:,12,2) = GMT(:,:,12,2)*inv(LMT(:,:,11,2)*LMT(:,:,14,2));
            LMT(:,:,10,2) = GMT(:,:,10,2)*inv(LMT(:,:,9,2)*LMT(:,:,8,2)*LMT(:,:,14,2));
            LMT(:,:,13,2) = GMT(:,:,13,2)*inv(LMT(:,:,12,2)*LMT(:,:,11,2)*LMT(:,:,14,2));
            %LMT(:,:,16,2) = GMT(:,:,16,2)*inv(LMT(:,:,15,2)*LMT(:,:,8,2));
            LMT(:,:,15,2) = GMT(:,:,15,2)*inv(LMT(:,:,14,2)); 
            LMT(:,:,:,1)=0;     
  end                   
                                              %%%%%%%%%%%% if j==3 or more
            LMT(:,:,2,j)  = GMT(:,:,2,j); %%%%% number of transformation
            LMT(:,:,5,j)  = GMT(:,:,5,j); 
          %  LMT(:,:,8,2)  = GMT(:,:,8,2);
            LMT(:,:,3,j)  = GMT(:,:,3,j)*inv(LMT(:,:,2,j));
            LMT(:,:,4,j)  = GMT(:,:,4,j)*inv(LMT(:,:,3,j)*LMT(:,:,2,j));
            LMT(:,:,6,j)  = GMT(:,:,6,j)*inv(LMT(:,:,5,j));
            LMT(:,:,7,j)  = GMT(:,:,7,j)*inv(LMT(:,:,6,j)*LMT(:,:,5,j));
            LMT(:,:,14,j) = GMT(:,:,14,j);
            LMT(:,:,8,j)  = GMT(:,:,8,j)*inv(LMT(:,:,14,j));
            LMT(:,:,11,j) = GMT(:,:,11,j)*inv(LMT(:,:,14,j));
            LMT(:,:,9,j) = GMT(:,:,9,j)*inv(LMT(:,:,8,j)*LMT(:,:,14,j));
            LMT(:,:,12,j) = GMT(:,:,12,j)*inv(LMT(:,:,11,j)*LMT(:,:,14,j));
            LMT(:,:,10,j) = GMT(:,:,10,j)*inv(LMT(:,:,9,j)*LMT(:,:,8,j)*LMT(:,:,14,j));
            LMT(:,:,13,j) = GMT(:,:,13,j)*inv(LMT(:,:,12,j)*LMT(:,:,11,j)*LMT(:,:,14,j));
            %LMT(:,:,16,2) = GMT(:,:,16,2)*inv(LMT(:,:,15,2)*LMT(:,:,8,2));
            LMT(:,:,15,j) = GMT(:,:,15,j)*inv(LMT(:,:,14,j)); 
  
  
  
   if j== 3
                              
        Global(:,:,:,1)=0;   %%%%%%%%%% first frame
        Local(:,:,:,1)=0;
          
        for i = 1 :15        %%%%%%% second frame
           
              
             eulZYXglobal =  rot2eul(GMT(1:3,1:3,i,2));
             eulZYXlocal  =  rot2eul(LMT(1:3,1:3,i,2));
            
              gtetax=eulZYXglobal(3); 
              gtetay=eulZYXglobal(2); 
              gtetaz=eulZYXglobal(1);
          
              ltetax=eulZYXlocal(3); 
              ltetay=eulZYXlocal(2); 
              ltetaz=eulZYXlocal(1);
          
          %%%%%%%%%%%%%%%%%%% Rotation angles  Global
          Global(1,1,i,2) = gtetax;
          Global(2,1,i,2) = gtetay;
          Global(3,1,i,2) = gtetaz;
          
          %%%%%%%%%%%%%%%%%% Translation
          Global(1,2,i,2) = GMT(1,4,i,2);
          Global(2,2,i,2) = GMT(2,4,i,2); 
          Global(3,2,i,2) = GMT(3,4,i,2); 
          
          %%%%%%%%%%%%%%%%%%% Rotation angles  Local
          Local(1,1,i,2) = ltetax;
          Local(2,1,i,2) = ltetay;
          Local(3,1,i,2) = ltetaz;
          
          %%%%%%%%%%%%%%%%%% Translation
          Local(1,2,i,2) = LMT(1,4,i,2);
          Local(2,2,i,2) = LMT(2,4,i,2); 
          Local(3,2,i,2) = LMT(3,4,i,2); 
           
        end     
   end
                       %%%%%%%%%%%% if j==3 or more
       for i = 1 :15
   
   
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
    
   %%%%%%%%%%%%%%%%%% there is no rotation or translation in the first frame    
   
end     

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
   
   A=  sqrt( (Skeleton(1,14,j)-Skeleton(1,8,j))^2+(Skeleton(2,14,j)-Skeleton(2,8,j))^2+ (Skeleton(3,14,j)-Skeleton(3,8,j))^2 ) ;      % joint15 - joint9
   B=  sqrt( (Skeleton(1,9,j)-Skeleton(1,14,j))^2+(Skeleton(2,9,j)-Skeleton(2,14,j))^2+ (Skeleton(3,9,j)-Skeleton(3,14,j))^2 ) ;   % joint10 - joint15
   C=  sqrt( (Skeleton(1,9,j)-Skeleton(1,8,j))^2+(Skeleton(2,9,j)-Skeleton(2,8,j))^2+ (Skeleton(3,9,j)-Skeleton(3,8,j))^2 ) ;      % joint15 - joint10     
   angle(5,j)=acosd((A^2+C^2- B^2)/(2*A*C));   
    
   %%%%%%%%%% angle 6;
   
   A=  sqrt( (Skeleton(1,14,j)-Skeleton(1,11,j))^2+(Skeleton(2,14,j)-Skeleton(2,11,j))^2+ (Skeleton(3,14,j)-Skeleton(3,11,j))^2 ) ;      % joint15 - joint12
   B=  sqrt( (Skeleton(1,12,j)-Skeleton(1,14,j))^2+(Skeleton(2,12,j)-Skeleton(2,14,j))^2+ (Skeleton(3,12,j)-Skeleton(3,14,j))^2 ) ;      % joint13 - joint15
   C=  sqrt( (Skeleton(1,12,j)-Skeleton(1,11,j))^2+(Skeleton(2,12,j)-Skeleton(2,11,j))^2+ (Skeleton(3,12,j)-Skeleton(3,11,j))^2 ) ;      % joint15 - joint13   
   angle(6,j)=acosd((A^2+C^2- B^2)/(2*A*C)); 
   
   %%%%%%%%%% angle 7;
   
   A=  sqrt( (Skeleton(1,8,j)-Skeleton(1,9,j))^2+(Skeleton(2,8,j)-Skeleton(2,9,j))^2+ (Skeleton(3,8,j)-Skeleton(3,9,j))^2 ) ;      % joint9 - joint10
   B=  sqrt( (Skeleton(1,10,j)-Skeleton(1,8,j))^2+(Skeleton(2,10,j)-Skeleton(2,8,j))^2+ (Skeleton(3,10,j)-Skeleton(3,8,j))^2 ) ;      % joint11 - joint9
   C=  sqrt( (Skeleton(1,10,j)-Skeleton(1,9,j))^2+(Skeleton(2,10,j)-Skeleton(2,9,j))^2+ (Skeleton(3,10,j)-Skeleton(3,9,j))^2 ) ;   % joint9 - joint11     
   angle(7,j)=acosd((A^2+C^2- B^2)/(2*A*C));    
   
   %%%%%%%%%% angle 8;
   
   A=  sqrt( (Skeleton(1,11,j)-Skeleton(1,12,j))^2+(Skeleton(2,11,j)-Skeleton(2,12,j))^2+ (Skeleton(3,11,j)-Skeleton(3,12,j))^2 ) ;      % joint12 - joint13
   B=  sqrt( (Skeleton(1,13,j)-Skeleton(1,11,j))^2+(Skeleton(2,13,j)-Skeleton(2,11,j))^2+ (Skeleton(3,13,j)-Skeleton(3,11,j))^2 ) ;      % joint14 - joint12
   C=  sqrt( (Skeleton(1,13,j)-Skeleton(1,12,j))^2+(Skeleton(2,13,j)-Skeleton(2,12,j))^2+ (Skeleton(3,13,j)-Skeleton(3,12,j))^2 ) ;      % joint12 - joint14    
   angle(8,j)=acosd((A^2+C^2- B^2)/(2*A*C)); 
   

  
end;    
  
 
for j = 1 : length(time)  %%%%%%%% same as number of frames  and number of transformation.


   ang=1;
   
   for i=1:15
       
     if (ang<=8)
       d =  {j i Global(1,1,i,j) Global(2,1,i,j) Global(3,1,i,j) Global(1,2,i,j) Global(2,2,i,j) Global(3,2,i,j) Local(1,1,i,j)  Local(2,1,i,j)  Local(3,1,i,j)  Local(1,2,i,j) Local(2,2,i,j) Local(3,2,i,j) Skeleton(1,i,j) Skeleton(2,i,j) Skeleton(3,i,j) angle(ang,j)};
                
            ang=ang+1;
     else      
       d =  {j i Global(1,1,i,j) Global(2,1,i,j) Global(3,1,i,j) Global(1,2,i,j) Global(2,2,i,j) Global(3,2,i,j) Local(1,1,i,j)  Local(2,1,i,j)  Local(3,1,i,j)  Local(1,2,i,j) Local(2,2,i,j) Local(3,2,i,j) Skeleton(1,i,j) Skeleton(2,i,j) Skeleton(3,i,j) 'NaN'};          
     end
     
       set(tab, 'data',[old_data;d]);
        
        old_data=get(tab,'data');
  end;
 
end




Glob=Global;

Loc=Local;
 
nframes=length(time) ;



   
end