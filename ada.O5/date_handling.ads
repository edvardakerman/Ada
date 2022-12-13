
package Date_Handling is
   
   -- Publik del   
   
   type Date_Type is private; 
   
   function "="(Item1, Item2 : in Date_Type) return Boolean;
      
   function "<"(Item1, Item2 : in Date_Type) return Boolean;
	 
   function ">"(Item1, Item2 : in Date_Type) return Boolean;
	 
   function Next_Date(Item : in Date_Type) return Date_Type;
   
   function Previous_Date(Item : in Date_Type) return Date_Type;
   
   procedure Get(Item : out Date_Type);
	       	       
   procedure Put(Item : in Date_Type);
		  		  
   Format_Error, Year_Error, Month_Error, Day_Error : exception;
		  
private

      type Date_Type is
      record
	 YYYY : Integer;
	 MM   : Integer;
	 DD   : Integer;
      end record;
   
end Date_Handling;
