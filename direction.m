function p = direction (A,B,C,D)

  direc=zeros(3,1);
  direc2=zeros(3,1);
  
  if ( (A(1) == B(1)) && (A(2) == B(2)) &&  (A(3)==B(3))   )
    
        direc(1,1)=1;
        direc(2,1)=1;
        direc(3,1)=1;
  end
 
  if ((A(1) ~= B(1)) && (A(2)==B(2)) &&  (sign(A(3))==B(3))   )
     
        direc(1,1)=0;
        direc(2,1)=1;
        direc(3,1)=1;     
  end
  
  if ((A(1) == B(1)) && (A(2)~=B(2)) &&  (sign(A(3))==B(3))   )
     
        direc(1,1)=1;
        direc(2,1)=0;
        direc(3,1)=1;        
  end
  
  if ((A(1) == B(1)) && (A(2)==B(2)) &&  (sign(A(3))~=B(3))   )
     
        direc(1,1)=1;
        direc(2,1)=1;
        direc(3,1)=0;        
  end
  
  if ((A(1) ~= B(1)) && (A(2)~=B(2)) &&  (sign(A(3))==B(3))   )
     
        direc(1,1)=0;
        direc(2,1)=0;
        direc(3,1)=1;    
  end
  
  if ((A(1) == B(1)) && (A(2)~=B(2)) &&  (sign(A(3))~=B(3))   )
     
        direc(1,1)=1;
        direc(2,1)=0;
        direc(3,1)=0;     
  end
  
  if ((A(1) ~= B(1)) && (A(2)==B(2)) &&  (sign(A(3))~=B(3))   )
     
        direc(1,1)=0;
        direc(2,1)=1;
        direc(3,1)=0;      
  end
  
  if ((A(1) ~= B(1)) && (A(2)~=B(2)) &&  (sign(A(3))~=B(3))   )
     
        direc(1,1)=0;
        direc(2,1)=0;
        direc(3,1)=0;      
  end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  if ( (C(1) == D(1)) && (C(2) == D(2)) &&  (C(3)==D(3))   )
    
        direc2(1,1)=1;
        direc2(2,1)=1;
        direc2(3,1)=1;
  end
 
  if ((C(1) ~= D(1)) && (C(2)==D(2)) &&  (C(3)==D(3))   )
     
        direc2(1,1)=0;
        direc2(2,1)=1;
        direc2(3,1)=1;     
  end
  
  if ((C(1) == D(1)) && (C(2)~=D(2)) &&  (C(3)==D(3))   )
     
        direc2(1,1)=1;
        direc2(2,1)=0;
        direc2(3,1)=1;        
  end
  
  if ((C(1) == D(1)) && (C(2)==D(2)) &&  (C(3)~=D(3))   )
     
        direc2(1,1)=1;
        direc2(2,1)=1;
        direc2(3,1)=0;        
  end
  
  if ((C(1) ~= D(1)) && (C(2)~=D(2)) &&  (C(3)==D(3))   )
     
        direc2(1,1)=0;
        direc2(2,1)=0;
        direc2(3,1)=1;    
  end
  
  if ((C(1) == D(1)) && (C(2)~=D(2)) &&  (C(3)~=D(3))   )
     
        direc2(1,1)=1;
        direc2(2,1)=0;
        direc2(3,1)=0;     
  end
  
  if ((C(1) ~= D(1)) && (C(2)==D(2)) &&  (C(3)~=D(3))   )
     
        direc2(1,1)=0;
        direc2(2,1)=1;
        direc2(3,1)=0;      
  end
  
  if ((C(1) ~= D(1)) && (C(2)~=D(2)) &&  (C(3)~=D(3))   )
     
        direc2(1,1)=0;
        direc2(2,1)=0;
        direc2(3,1)=0;      
  end

  
  %%%%%%%%%%%%%%%%%%%%%%%
  if (direc(1,1)==direc2(1,1) && direc(2,1)==direc2(2,1) && direc(3,1)==direc2(3,1)    )
     
        p=1 ;
  end

   if (direc(1,1)~=direc2(1,1) && direc(2,1)==direc2(2,1) && direc(3,1)==direc2(3,1)    )
     
        p=0.5 ;
   end
   
   if (direc(1,1)==direc2(1,1) && direc(2,1)~=direc2(2,1) && direc(3,1)==direc2(3,1)    )
     
        p=0.5 ;
   end
  
   if (direc(1,1)==direc2(1,1) && direc(2,1)==direc2(2,1) && direc(3,1)~=direc2(3,1)    )
     
        p=0.5 ;
  end
  if (direc(1,1)~=direc2(1,1) && direc(2,1)~=direc2(2,1) && direc(3,1)==direc2(3,1)    )
     
        p=-1;
  end
  if (direc(1,1)==direc2(1,1) && direc(2,1)~=direc2(2,1) && direc(3,1)~=direc2(3,1)    )
     
        p=-1 ;
  end
  if (direc(1,1)~=direc2(1,1) && direc(2,1)==direc2(2,1) && direc(3,1)~=direc2(3,1)    )
     
        p=-1 ;
  end
  
  if (direc(1,1)~=direc2(1,1) && direc(2,1)~=direc2(2,1) && direc(3,1)~=direc2(3,1)    )
     
        p=0; 
  end
  direc
  direc2
  p
 
end