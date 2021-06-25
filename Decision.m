function error1  =Decision(GlobalComp,LocalComp,AngleComp,nframes,type)



%%%%%%%%%%%%%%%%%%% take in consederation the estemation



k=1;

for j=1:nframes-1   

  for i = 1 :17
   
          %%%%%%%%%%%%%%%%%%% Rotation angles  Global
          
         if GlobalComp(1,1,i,j) > ThGRot
         error1(k,j)= strcat('error1 in global rotation X from frame ',num2str(j+1) ,'to' , num2str(j) , 'with joint' , num2str(i));
         end  
         k=k+1;
         
         if GlobalComp(2,1,i,j)> ThGRot 
         error1(k)= strcat('error1 in global rotation Y from frame ',num2str(j+1), 'to' , num2str(j), 'with joint' , num2str(i));    
         end
         k=k+1;
         
         if GlobalComp(3,1,i,j) > ThGRot
         error1(k)= strcat('error1 in global rotation Z from frame ',num2str(j+1), 'to' , num2str(j), 'with joint' , num2str(i));    
         end
         k=k+1; 
          
          %%%%%%%%%%%%%%%%%% Translation Glogal
          
              
         if GlobalComp(1,2,i,j)  >  ThGTrans
         error1(k)= strcat('error1 in global translation X from frame ',num2str(j+1), 'to' , num2str(j), 'with joint' , num2str(i));
         end  
          k=k+1;
          
         if GlobalComp(2,2,i,j)>   ThGTrans 
         error1(k)= strcat('error1 in global translation Y from frame ',num2str(j+1), 'to' , num2str(j)+ 'with joint' , num2str(i));    
         end
         k=k+1;
         
         if GlobalComp(3,2,i,j)  >  ThGTrans
         error1(k)= strcat('error1 in global translation Z from frame ',num2str(j+1), 'to' , num2str(j)+ 'with joint' , num2str(i));    
         end
         k=k+1;
        
         %%%%%%%%%%%%%%%%%%% Rotation angles  Local
          
         if LocalComp(1,1,i,j)  > ThLRot
         error1(k)= strcat('error1 in local rotation X from frame ',num2str(j+1), 'to' , num2str(j), 'with joint' , num2str(i));
         end  
          k=k+1;
          
         if LocalComp(2,1,i,j)> ThLRot 
         error1(k)= strcat('error1 in local rotation Y from frame ',num2str(j+1), 'to' , num2str(j), 'with joint' , num2str(i));    
         end
         k=k+1;
         
         if LocalComp(3,1,i,j) > ThLRot
         error1(k)= strcat('error1 in local rotation Z from frame ',num2str(j+1), 'to' , num2str(j), 'with joint' , num2str(i));    
         end
         k=k+1;
          
         %%%%%%%%%%%%%%%%%% Translation Local
              
         if LocalComp(1,2,i,j)  >  ThLTrans
         error1(k)= strcat('error1 in local translation X from frame ',num2str(j+1), 'to' , num2str(j)+ 'with joint' , num2str(i));
         end  
         k=k+1;
         
         if LocalComp(2,2,i,j)>   ThLTrans 
         error1(k)= strcat('error1 in local translation Y from frame ',num2str(j+1), 'to' , num2str(j)+ 'with joint' , num2str(i));    
         end
         k=k+1;
         
         if LocalComp(3,2,i,j)  >  ThLTrans
         error1(k)= strcat('error1 in local translation Z from frame ',num2str(j+1), 'to' , num2str(j)+ 'with joint' , num2str(i));    
         end
         k=k+1;
  end 
      
end

  
for j=1:nframes
    
      if (AngleComp(1,j) >  ThAngle)   
         error2(k)= strcat('error1 in angle 1 from frame ',num2str(j));  
      end;    
      k=k+1;
      
       if (AngleComp(2,j) >  ThAngle)   
         error2(k)= strcat('error1 in angle 2 from frame ',num2str(j));  
      end;    
      k=k+1;
      
       if (AngleComp(3,j) >  ThAngle)   
         error2(k)= strcat('error1 in angle 3 from frame ',num2str(j));  
      end;    
      k=k+1;
      
       if (AngleComp(4,j) >  ThAngle)   
         error2(k)= strcat('error1 in angle 4 from frame ',num2str(j));  
      end;    
      k=k+1;
      
       if (AngleComp(5,j) >  ThAngle)   
         error2(k)= strcat('error1 in angle 5 from frame ',num2str(j));  
      end;    
      k=k+1;
      
       if (AngleComp(6,j) >  ThAngle)   
         error2(k)= strcat('error1 in angle 6 from frame ',num2str(j));  
      end;    
      k=k+1;
      
       if (AngleComp(7,j) >  ThAngle)   
         error2(k)= strcat('error1 in angle 7 from frame '+num2str(j));  
      end;    
      k=k+1;
      
       if (AngleComp(8,j) >  ThAngle)   
         error2(k)= strcat('error1 in angle 8 from frame '+num2str(j));  
      end;    
      k=k+1;
          
end;
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Final comparison and decision 





end