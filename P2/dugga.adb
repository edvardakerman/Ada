with Ada.Text_IO; use Ada.Text_IO; 
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use  Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;


procedure Dugga is 
   
   -- Procedure
   procedure Devide_Program(Strang     : out  String;
			    Tecken     : out  Character;
			    Heltal     : out  Integer) is
      
   begin
      
      Put("Mata in en sträng med exakt 3 tecken: ");
      Get(Strang);
      Put("Mata in ett tecken: ");
      Get(Tecken);
      Skip_Line;
      Heltal := Integer(Float'Rounding( Float'Value(Strang) /  Float(Character'Pos(Tecken) - Character'Pos('0')) ) );
      
   end Devide_Program;
   
   -- Function
   function Area_Program(Sida : in String) return Integer is (Integer(Float'Value(Sida) * (Float'Value(Sida) * Sqrt(3.0) / 2.0 / 2.0)));
   
   -- Operator
   function "-"(Flyttal : in Float; 
		Tecken  : in Character) return Integer is (Integer( Flyttal - Float(Character'Pos(Tecken) - Character'Pos('0'))));
   
   -- Variabler
   Strang  : String(1..3);
   Flyttal : Float;
   Tecken  : Character;
   Heltal  : Integer;

   begin
      
      -- Deluppgift 1
      Devide_Program(Strang, Tecken, Heltal);
      Put("Du matade in strängen: ");
      Put(Strang);
      Put(" och tecknet: ");
      Put(Tecken); 
      Put(" och kvoten blev ");
      Put(Heltal);
      New_Line(2);      
      
      -- Deluppgift 2
      Put("Mata in längden: ");
      Get(Strang);
      Skip_Line;
      Put("Den beräknade arean blev: ");
      Heltal := Area_Program(Strang);
      Put(Heltal, Width => 0);
      New_Line(2);
      
      -- Deluppgift 3
      Put("Mata in ett flyttal: ");
      Get(Flyttal);
      Put("Mata in ett tecken: ");
      Get(Tecken);
      Skip_Line;
      Put("Den beräknade differensen mellan ");
      Put(Flyttal, Fore => 0, Aft => 1, Exp => 0);
      Put(" och ");
      Put(Tecken);
      Put(" blir ");
      Put(Flyttal - Tecken, Width => 0);
      
   end Dugga;
