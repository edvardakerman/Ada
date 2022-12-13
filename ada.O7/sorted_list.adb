-- edvak514: Arbetat enskilt
with Ada.Text_IO;                use Ada.Text_IO;
with Ada.Integer_Text_IO;        use Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation;


package body Sorted_List is 
   
   -- Funktionen Empty
   function Empty(List : in List_Type) return Boolean is
      
   begin
      return (List = null);
   end Empty;
   
   
   -- Proceduren Insert
   procedure Insert(List      : in out List_Type;
		    New_Data  : in     Integer) is
      
      Tmp : List_Type;
      
   begin
      
      if Empty(List) then
	 List := new E_Type;
	 List.all := (Data => New_Data, Next => null);
	 
      elsif New_Data < List.Data then
	 Tmp := List;
	 List := new E_Type;
	 List.all := (Data => New_Data, Next => Tmp);
	 
      elsif New_Data > List.Data then
	 Insert(List.Next, New_Data);
      end if;  
      
   end Insert;
   
   
   -- Proceduren Put
   procedure Put(List : in List_Type) is
      
   begin
      if not Empty(List) then
	 Put(' ');
	 Put(List.Data, Width => 0);
	 Put(List.Next);
      end if;
   end Put;
   
   
   -- Funktionen Member
   function Member(List : in List_Type; 
		   Item : in Integer) return Boolean is     
      
   begin

    if Empty(List) then
      return False;
    end if;  
      
    if List.Data = Item then
       return True;
    end if;   
    
    return Member(List.Next, Item);
      
   end Member;
     
      
   ------------------------- Free -------------------------
   procedure Free is
      new Ada.Unchecked_Deallocation(E_Type, List_Type);
   --------------------------------------------------------

   -- Procedure Remove
   procedure Remove (List : in out List_Type; 
		     Item : in Integer) is
      
      Tmp : List_Type;
      
   begin
      
      if Empty(List) then
	 raise No_Such_Element_Error;
      elsif List.Data = Item then
	 Tmp := List.Next;
	 Free(List);
	 List := Tmp;
      else
	 Remove(List.Next, Item);
      end if;
      
      
   end Remove;
   
   
   -- Proceduren Delete 
   procedure Delete(List : in out List_Type) is
      
      Tmp : List_Type;
      
   begin
      
      if not Empty(List) then
	 Tmp := List.Next;
	 Free(List);
	 List := Tmp;	 
	 Delete(List);
      end if;
      
   end Delete;
   
   
   -- Funktionen Length
   function Length(List : in List_Type) return Natural is
      
   begin
      if Empty(List) then
	 return 0;
      end if;
      
      return 1 + Length(List.Next);
   end Length;
   
end Sorted_List;
