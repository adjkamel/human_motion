function dis = distance (A,B)
global r;
  if (A>0 && B>0)
     r=abs(A-B); 
  end  

  if (A<0 && B<0)
     
        if abs(A) > abs(B)
             r=abs(A)-abs(B);
        else 
             r=abs(B)-abs(A); 
        end
        
  end
 
  if ((A>0 && B<0)||(A<0 && B>0))
      
     r =abs(A)+abs(B);
     
  end
  
  if (A == 0)
      
     r =abs(B);
     
  end
  
   if ( B == 0 )
      
     r =abs(A);
     
  end
  
  
 dis=r;
 
end