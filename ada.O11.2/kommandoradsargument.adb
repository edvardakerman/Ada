with Ada.Text_IO; use Ada.Text_IO; 
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use  Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
  
procedure Kommandoradsargument is
        
  begin     
     
     case Argument_Count is
	when 0 
	  => 
	   Put("Inga argument angivna.");
	when 1
	  => 
	   Put("Fel antal argument angivna.");
	when 2
	  => 
	   Put("Meddelande: ");
	   for I in 1..Integer'Value(Argument(Number => 1)) loop
	   Put(Argument(Number => 2));	   	  
	   end loop;
	   New_Line;
	   Put("Programmet """);
	   Put(Command_Name);
	   Put(""" avslutas.");	   	   	   
	when others 
	  => Put("Fel antal argument angivna.");
     end case;	   
     
end Kommandoradsargument;
