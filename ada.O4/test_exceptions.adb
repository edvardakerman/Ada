-- edvak514: Arbetat enskilt
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;


procedure Test_Exceptions is
   
   type Date_Type is
      record
	 YYYY : Integer;
	 MM   : Integer;
	 DD   : Integer;
      end record;

   type Date_Arr_Type is
     array(1 .. 5) of Date_Type;
   
   Format_Error, Year_Error, Month_Error, Day_Error, Length_Error : exception;
   
   
   procedure Get_Value_Safe(Min, Max : in  Integer; 
			    Value    : out Integer) is
      
      
   begin
      loop
	 begin
	    Put("Mata in värde (");
	    Put(Min, Width => 0);
	    Put(" -" & Integer'Image(Max) & "): ");
	    Get(Value);
	    if Value > Max then
	       Put("För stort värde. ");
	    end if;
	    if Value < Min then
	       Put("För litet värde. ");
	    end if;
	 exception
	    when Data_Error =>
	       Put("Fel datatyp. ");
	 end;
	 Skip_Line;
	 exit when Value <= Max and Value >= Min;
      end loop;
   end Get_Value_Safe;
   
   
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
   
   -- Procedure Format check
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
   
   -- Range Check
   procedure Date_Check(Item : in Date_Type) is
      
         type Month_Array is array(1 .. 12) of Integer;
   Months : Month_Array;
      
   begin
      
            Months(1..12) := (31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
      
      if Item.YYYY < 1532 or Item.YYYY > 9000 then 
	 raise Year_Error;
      end if;

      if Item.MM < 1 or Item.MM > 12 then 
	 raise Month_Error;
      end if;

      if Item.DD < 1 or Item.DD > 31 then 
	 raise Day_Error;
      end if;
      
     if (Months(Item.MM) < Item.DD) then
	 raise Day_Error;
     end if;
      
      -- Skottår kontroll
      If Item.MM = 2 and Item.DD = 29 then	    
	 if not ((Item.YYYY mod 4 = 0 and Item.YYYY mod 100 /= 0) or Item.YYYY mod 400 = 0) then
	    Raise Day_Error;
	 End if;
      End if;
      
   end Date_Check;
   
   
   Procedure Get(Item : out Date_Type) is
      S_3 : String(1 .. 10);
   begin      
      
      begin
	 Get(S_3);
	 
	 Format_Check(S_3);
	 
	 Item.YYYY := Integer'Value(S_3(1..4));
	 Item.MM := Integer'Value(S_3(6..7));
	 Item.DD := Integer'Value(S_3(9..10));
	 
	 Date_Check(Item);
	 
      exception
         When Length_Error =>
	    raise Format_Error;
      end;
   end Get;
   
   -- Put Dates
   procedure Put(Item : in Date_Arr_Type) is
      
      type Date_Array is array(1 .. 3) of Integer;
      Date : Date_Array;
      
   begin
      
      for I in 1..5 loop
	 Put("Datum nummer" & Integer'Image(I) & ": ");
	 Date(1..3) := (Item(I).YYYY, Item(I).MM, Item(I).DD);
	 for X in Date'Range loop
	    if X > 1 then
	       Put("-");
	       if Date(X) <= 9 then
		  Put("0");
	       end if;
	    end if;
	    Put(Date(X), Width => 0);
	 end loop;
    	 
	 New_Line;
      end loop;   
   end Put;
   
   
   Procedure Date_Program(Dates : out Date_Arr_Type) is
      
   begin
      
      -- Hämta datum
      for I in 1..5 loop
	 loop
	    begin
	       Put("Mata in datum" & Integer'Image(I) & ": ");
	       Get(Dates(I));
	       exit;
	    exception
	       When Format_Error =>
		  Put("Felaktigt format! ");
	       When Year_Error =>
		  Put("Felaktigt år! ");
	       When Month_Error =>
		  Put("Felaktig månad! ");
	       When Day_Error =>
		  Put("Felaktig dag! ");
	    end;
	 end loop;
      end loop;
      
      -- Skriv ut datum
      Put(Dates);
      
   end Date_Program;
   
   
   procedure Span_Program is 
      
      Value, Min, Max : Integer;
      
   begin
      
      Put("Mata in Min och Max: ");
      Get(Min);
      Get(Max);
      Get_Value_Safe(Min, Max, Value);
      Put("Du matade in heltalet ");
      Put(Value, Width => 0);
      Put('.');
      New_Line(2);
      
   end Span_Program;
   
   
   procedure Mumbo_Jumbo_Program is
      
      S_1 : String(1 .. 5);
      S_2 : String(2 .. 7);
      S_3 : String(1 .. 10);
      
   begin
      
      Put("Mata in en sträng på exakt 5 tecken: ");
      Get(S_1);
      Put_Line("Du matade in " & S_1);
      Put("Mata in en sträng på exakt 6 tecken: ");
      Get(S_2);
      Put_Line("Du matade in " & S_2);
      Put("Mata in en sträng på exakt 10 tecken: ");
      Get(S_3);
      Put("Du matade in " & S_3);
      New_Line(2);
      Skip_Line;
      
   end Mumbo_Jumbo_Program;
   
   Dates : Date_Arr_Type;
   
begin
   
   Put_Line("Del 3:");
   Date_Program(Dates);
   Skip_Line;
   
   Put_Line("Del 1:");
   Span_Program;
   
   Put_Line("Del 2:");
   Mumbo_Jumbo_Program;
   

   
exception
   When Length_Error =>
      Put("För få inmatade tecken!");
end Test_Exceptions;
