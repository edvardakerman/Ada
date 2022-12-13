-- edvak514: Arbetat enskilt
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;


package body Date_handling is
   
   Length_Error : exception;
   
   procedure Get(Item : out String) is
      
      Ch : Character;
      
   begin
      
      loop
	 Get(Ch);
	 exit when Ch /= ' ';
      end loop;
      Item(Item'First) := Ch;
      for I in Item'First+1..Item'Last loop
	 if Item'Last >= I and not End_Of_Line then
	    Get(Ch);
	 else
	    Skip_Line;
	    raise Length_Error;
	 end if;
	 Item(I) := Ch;
      end loop;
      
   end Get;
   
   
   procedure Format_Check(Date_Str : in String) is
      
   begin
      
      for I in Date_Str'Range loop
	 if I /= 5 and I /= 8 then
	    if not (Date_Str(I) in '0'..'9') then
	       raise Format_Error;
	    end if;	    
	 end if;
	 if (I = 5 or I = 8) and Date_Str(I) /= '-' then
	    raise Format_Error;
	 end if;
      end loop;
      
   end Format_Check;
   
   
   procedure Date_Check_Exceptions(Item : in Date_Type) is
      
      type Month_Array is array(1 .. 12) of Integer;
      Months : Month_Array;
      
   begin
      
      Months(1..12) := (31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
      
      if Item.YYYY < 1532 or Item.YYYY > 9000 then 
	 raise Year_Error;
      end if; 
      
      if Item.MM < 1 or Item.MM > 12 then 
	 raise Month_Error;
      else
	 if (Months(Item.MM) < Item.DD) or (1 > Item.DD) then
	    raise Day_Error;
	 end if;
      end if;
      
      -- Skottår kontroll
      If Item.MM = 2 and Item.DD = 29 then	    
	 if not ((Item.YYYY mod 4 = 0 and Item.YYYY mod 100 /= 0) or Item.YYYY mod 400 = 0) then
	    raise Day_Error;
	 End if;
      End if;
      
   end Date_Check_Exceptions;
   
   
   Procedure Get(Item : out Date_Type) is
      S_3 : String(1 .. 10);
   begin      
      
      begin
	 Get(S_3);
	 
	 Format_Check(S_3);
	 
	 Item.YYYY := Integer'Value(S_3(1..4));
	 Item.MM := Integer'Value(S_3(6..7));
	 Item.DD := Integer'Value(S_3(9..10));
	 
	 Date_Check_Exceptions(Item);
      exception
         When Length_Error =>
	    raise Format_Error;
      end;
   end Get;
   
   
   procedure Put(Item : in Date_Type) is
      
      type Date_Array is array(1 .. 3) of Integer;
      Date : Date_Array;
      
   begin
      
      Date(1..3) := (Item.YYYY, Item.MM, Item.DD);
      for X in Date'Range loop
	 if X > 1 then
	    Put("-");
	    if Date(X) <= 9 then
	       Put("0");
	    end if;
	 end if;
	 Put(Date(X), Width => 0);
      end loop;
      
   end Put;
   
   
   type Errors_Array is array(1 .. 2) of Boolean;
   
   procedure Date_Check(Item : in Date_Type; Errors : out Errors_Array) is
      
      type Month_Array is array(1 .. 12) of Integer;
      Months : Month_Array;
      
   begin
      
      Months(1..12) := (31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
      Errors(1..2) := (False, False); 

      if Item.MM < 1 or Item.MM > 12 then 
	 Errors(1) := True;
      else
	 if (Months(Item.MM) < Item.DD) or (1 > Item.DD) then
	    Errors(2) := True;
	 end if;
      end if;
      
      -- Skottår kontroll
      If Item.MM = 2 and Item.DD = 29 then	    
	 if not ((Item.YYYY mod 4 = 0 and Item.YYYY mod 100 /= 0) or Item.YYYY mod 400 = 0) then
	    Errors(2) := True;
	 End if;
      End if;
      
   end Date_Check;
   
   function Next_Date(Item : in Date_Type) return Date_Type is
      
      Next_Date : Date_Type := Item;
      Errors : Errors_Array;
      
   begin
      
      Errors(1..2) := (False, False);
      
      Next_Date.DD := Next_Date.DD + 1;  
      Date_Check(Next_Date, Errors);     
       
      if Errors(2) then
	 Next_Date.DD := 1;
	 Next_Date.MM := Next_Date.MM + 1;
	 Date_Check(Next_Date, Errors);
      end if;
      
      if Errors(1) then
	 Next_Date.DD := 1;
	 Next_Date.MM := 1;
	 Next_Date.YYYY := Next_Date.YYYY + 1;
      end if;
      
      return Next_Date;
   end Next_Date;
   
   
   function Previous_Date(Item : in Date_Type) return Date_Type is
      
      Previous_Day : Date_Type := Item;
      Errors : Errors_Array;
      
   begin
      
      Errors(1..2) := (False, False);
      
      Previous_Day.DD := Previous_Day.DD - 1;  
      Date_Check(Previous_Day, Errors);     
      
      if Errors(2) then
	 
	 Previous_Day.MM := Previous_Day.MM - 1;
	 Previous_Day.DD := 31;
	 
	 loop	    
	    Date_Check(Previous_Day, Errors);
	    if Errors(2) then
	       Previous_Day.DD := Previous_Day.DD - 1;
	    end if;
	    exit when not Errors(2);
	 end loop;
      end if;
      
      -- Month Check
      if Errors(1) then
	 Previous_Day.DD := 31;
	 Previous_Day.MM := 12;
	 Previous_Day.YYYY := Previous_Day.YYYY - 1;
      end if;
      
      return Previous_Day;
   end Previous_Date;
   
   
   function Date_To_Integer(Item : in Date_Type) return Integer is
      
      StrInt  : String(1..8);					   
      StrTemp : String(1..3);
      
   begin   
      
      StrInt(1..5) := Integer'Image(Item.YYYY);
      StrInt(1..4) := StrInt(2..5);
      
      -- Month
      if Item.MM < 10 then
	 StrInt(5..6) := (Integer'Image(Item.MM));
	 StrInt(5..6) := "0" & StrInt(6);
      else
	 StrInt(5..7) := Integer'Image(Item.MM);
	 StrInt(5..6) := StrInt(6) & StrInt(7);
      end if;
             
      -- Day
      if Item.DD < 10 then
	 StrTemp(1..3) := Integer'Image(Item.DD);
	 StrInt(7..8) := "0" & StrInt(3);
      else	 
	 StrTemp(1..3) := (Integer'Image(Item.DD));
	 StrInt(7..8) := StrTemp(3) & StrTemp(3);
      end if;
	
      return Integer'Value(StrInt(1..8));

   end Date_To_Integer;
   
   
   
   function ">"(Item1, Item2 : in Date_Type) return Boolean is
      
      Date1, Date2 : Integer;
      B : Boolean := False;
      
   begin
      
      Date1 := Date_To_Integer(Item1);
      Date2 := Date_To_Integer(Item2);
      
      if Date1 > Date2 then
	 B := True;
      end if;
      
      return B;
   end ">";
   
   
   function "<"(Item1, Item2 : in Date_Type) return Boolean is
      
      Date1, Date2 : Integer;
      B : Boolean := False;
      
   begin
      
      Date1 := Date_To_Integer(Item1);
      Date2 := Date_To_Integer(Item2);
      
      if Date1 < Date2 then
	 B := True;
      end if;
      
      return B;
   end "<";
   
   function "="(Item1, Item2 : in Date_Type) return Boolean is
      
      Date1, Date2 : Integer;
      B : Boolean := False;
      
   begin
      
      Date1 := Date_To_Integer(Item1);
      Date2 := Date_To_Integer(Item2);
      
      if Date1 = Date2 then
	 B := True;
      end if;
      
      return B;
   end "=";
   
   
end Date_handling;
