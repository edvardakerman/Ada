-- edvak514: Arbetat enskilt
with Ada.Text_IO; use Ada.Text_IO; 
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Underprogram is       
   
   -- Operator
   function "-"(Heltal  : in Integer; 
		Flyttal : in Float) return Float is (Float(Heltal) - Flyttal);
   
   -- Procedure
   procedure Plural_Program(Substantiv : in out String; 
			    Sanning    :    out Boolean) is                   
   begin
      
      Sanning := False;
      if Substantiv(Substantiv'Last) = 's' or Substantiv(Substantiv'Last) = 'S' then
	  Sanning := True;
      else	  
	 Substantiv(Substantiv'Last) := 's';
      end if;  
      
   end Plural_Program;
   
   -- Function
   function S_Program(Tecken : in Character) return Boolean is
      
      Sanning : Boolean := False;
      
   begin

      if Tecken = 'S' or Tecken = 's' then
	 Sanning := True;
      end if;
      
   return Sanning;
   end S_Program;             
      
      Flyttal : Float;
      Heltal : Integer;
      Substantiv : String(1..5);
      Sanning : Boolean;
      Tecken : Character; 

begin
      
   Put("Mata in ett heltal och ett flyttal: ");
   Get(Heltal);
   Get(Flyttal);
   Put("Differensen mellan dem är ");
   Put(Heltal - Flyttal, Fore => 0, Aft => 2, Exp => 0);
   New_Line(2);   
   Skip_Line;
     
   Put("Skriv in ett 5 tecken långt engelskt substantiv: ");
   Get(Substantiv);
   Plural_Program(Substantiv, Sanning);
   Put("Ordet ");
   Put(Substantiv);
   Put(" var troligtvis ");
   if Sanning = False then 
      Put("inte "); 
   end if;
   Put("i plural från början");
   New_Line(2);
   Skip_Line;
          
   Put("Mata in ett tecken: ");
   Get(Tecken);
   Sanning := S_Program(Tecken);
   Put("Tecknet var ");
   if Sanning = False then
      Put("inte ");
   end if;
   Put("sant");
   
end Underprogram;
