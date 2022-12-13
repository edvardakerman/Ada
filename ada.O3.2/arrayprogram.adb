-- edvak514: Arbetat enskilt
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Arrayprogram is
   
   -- DS1
   type DS1_Array is array(31..35) of Float;  
   
   -- DS2
   type DS2_Array_Inner is 
     array (Character range '5'..'9') of String(1..5);   
   
   type DS2_Array is
     Array (Boolean range False..True) of DS2_Array_Inner;
   
   -- DS3
   type DS3_Array is array(73..74, Character range '4'..'8') of Integer;
   
   
   -- DS1 Get	
   procedure Get(DS1 : out DS1_Array) is

   begin

      for I in reverse DS1'Range loop	      
	 Get(DS1(I));   
      end loop;

   end Get;
   
   -- DS1 Put
   procedure Put(DS1 : in DS1_Array) is	
   begin

      for I in reverse DS1'Range loop
	 Put(" ");
	 Put(DS1(I), 1, 3, 0);
      end loop;
   end Put;
   
   -- DS2_Inner Get
   procedure Get(DS2_Inner : out DS2_Array_Inner; B : in Boolean) is
      
      C : Character;
      
   begin	      
      
      for I in reverse DS2_Inner'Range loop
	 Get(DS2_Inner(I));
	 if DS2_Inner'First /= I or B then
	    Get(C);
	 end if;
	 
      end loop;
      
   end Get;
   
   -- DS2 Get
   procedure Get(DS2 : out DS2_Array) is
      
      DS2_Inner : DS2_Array_Inner;
      B : Boolean := True;
      
   begin	      
      
      Get(DS2_Inner, B);
      DS2(False) := DS2_Inner;
      B := False;
      Get(DS2_Inner, B);
      DS2(True) := DS2_Inner;
      
   end Get;
   
   -- DS2 Put
   procedure Put(DS2 : in DS2_Array) is	
      
   begin
      
      for I in DS2'Range loop   
	 for Y in reverse DS2(I)'Range loop
	    Put(" ");
	    Put(DS2(I)(Y));
	 end loop;
      end loop;
      
   end Put;
   
   
   -- DS3 Get
   procedure Get(DS3 : out DS3_Array) is
      
   begin	      
      
      for I in reverse DS3_Array'Range(1) loop
	 for Y in reverse DS3_Array'Range(2) loop
	    Get(DS3(I, Y));
	 end loop;  
      end loop;
      
   end Get;
   
   -- DS3 Put
   procedure Put(DS3 : in DS3_Array) is	
      
   begin
      
      for I in reverse DS3_Array'Range(1) loop
	 for Y in reverse DS3_Array'Range(2) loop
	    Put(" ");
	    Put(DS3(I, Y), Width => 0);
	 end loop;
      end loop;
      
   end Put;


   DS1 : DS1_Array;
   DS2 : DS2_Array;
   DS3 : DS3_Array;

   
begin
   
   Put_Line("För DS1:");
   Put("Mata in datamängd: ");
   Get(DS1);
   Put("Inmatad datamängd:");
   Put(DS1);
   
   Skip_Line;
   New_Line(2);
   
   Put_Line("För DS2:"); 
   Put("Mata in datamängd: ");
   Get(DS2);
   Put("Inmatad datamängd:");
   Put(DS2);
   
   Skip_Line;
   New_Line(2);
   
   Put_Line("För DS3:"); 
   Put("Mata in datamängd: ");
   Get(DS3);
   Put("Inmatad datamängd:");
   Put(DS3);
   
end Arrayprogram;
