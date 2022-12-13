package Sorted_List is
   
   -- Publik del   
   
   type List_Type is private;
   
   -- Funktionen Empty
   function Empty(List : in List_Type) return Boolean;
   
   -- Proceduren Insert
   procedure Insert(List     : in out List_Type;
		    New_Data : in     Integer);
   
   -- Proceduren Put
   procedure Put(List : in List_Type);
   
   -- Funktionen Member
   function Member(List : in List_Type; Item : in Integer) return Boolean;
   
   -- Proceduren Remove
   procedure Remove(List : in out List_Type;
		    Item : in     Integer);
   
   -- Proceduren Delete
   procedure Delete(List : in out List_Type);
   
   -- Funktionen Length
   function Length(List : in List_Type) return Natural;
   
   No_Such_Element_Error : exception;
   
		  
private
   
   
  type E_Type;
  
  type List_Type is
    access E_Type;
  
  type E_Type is
    record
      Data : Integer;
      Next : List_Type;
    end record;
     
   
end Sorted_List;
