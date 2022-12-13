with Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO; use Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO;

	   Put("Val: ");
	   Get(Item);
	   if Item < 1 or Item > 4 then
	      loop
		 Put_Line("Felaktigt val!");
		 Put("Val: ");
		 Get(Item);
		 if Item >= 1 and Item <= 4 then
		    exit when;
		 end if;
	      end loop;
	   end if;
	   
	   
	   	if Selector = 1 then
	   Hypothenuse_Program;
	elsif Selector = 2 then
	   Angle_Program;
	elsif Selector = 3 then
	   Factorial_Program;
	elsif Selector = 4 then
	   Put("Ha en bra dag!"); exit;
	end if;


procedure Momstabellen is
   
   First_Price, Last_Price, Tax, Calculated_Tax, Step : Float;
   Laps : Integer;
   
begin
   
   -- Hämtar data och kör felhantering
   loop
      begin
	 Put("Första pris: ");
	 Get(First_Price);
	 if (First_Price < 0.00) then
	    Put_Line("Felaktigt värde!");
	 else
	    exit;
	 end if;
      end;
      Skip_Line;
   end loop;
      
      
   loop
      begin
	 Put("Sista pris: ");
	 Get(Last_Price);
	 if (Last_Price < First_Price) then
	    Put_Line("Felaktigt värde!");
	 else
	    exit;
	 end if;
      end;
      Skip_Line;
   end loop;
      
      
   loop
      begin
	 Put("Steg: ");
	 Get(Step);
	 if (Step <= 0.00) then
	    Put_Line("Felaktigt värde!");
	 else
	    exit;
	 end if;
      end;
      Skip_Line;
   end loop;
      
      
   loop
      begin
	 Put("Momsprocent: ");
	 Get(Tax);
         if (Tax < 0.00 or Tax > 100.00) then
	    Put_Line("Felaktigt värde!");
	 else
	    exit;
	 end if;
      end;
      Skip_Line;
   end loop;
      
      
   New_Line;
   
   
   Tax := Tax / 100.00;
   
   -- Tabell
   Put_Line("============ Momstabell ============");
   Put_Line("Pris utan moms  Moms   Pris med moms");
   
   --räkna ut antal varv i for
   Laps := Integer(Float'Floor((Last_Price - First_Price) / Step));
   
   for I in 0..Laps loop
      Calculated_Tax := First_Price * Tax;
      
      Put(First_Price, Fore => 6, Aft => 2, Exp => 0);
      Put(Calculated_Tax, Fore => 8, Aft => 2, Exp => 0);
      Put(First_Price + Calculated_Tax, Fore => 9, Aft => 2, Exp => 0);
      
      New_Line;
      First_Price := First_Price + Step;
   end loop;
     
   
end Momstabellen;
