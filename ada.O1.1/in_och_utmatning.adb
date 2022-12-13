-- Samarbetat med danwe379 (Daniel Westin)

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO; use Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO;

procedure In_Och_Utmatning is
   
   H1 : Integer;
   F1 : Float;
   C1 : Character;
   S1 : String(1..5);
   
begin   
   
   
   -- Innmatning nummer 1
   Put("Skriv in ett heltal: ");
   Get(H1);
   Put("Du skrev in talet:" & Integer'Image(H1));
   New_Line(2);
   
   Skip_Line;
   
   
   -- Inmatning nummer 2
   Put("Skriv in fem heltal: ");
   Get(H1);
   Put("Du skrev in talen: ");
   Put(H1, Width => 0);
   Put(" ");
   Get(H1);
   Put(H1, Width => 0);
   Put(" ");
   Get(H1);
   Put(H1, Width => 0);
   Put(" ");
   Get(H1);
   Put(H1, Width => 0);
   Put(" ");
   Get(H1);
   Put(H1, Width => 0);
   New_Line(2);
   
   Skip_Line;
   
   
   -- Inmatning nummer 3  
   Put("Skriv in ett flyttal: ");
   Get(F1);
   Put("Du skrev in flyttalet: ");
   Put(F1, Fore => 0, Aft => 3, Exp => 0);
   New_Line(2);
   
   Skip_Line;
     
   -- Inmatning nummer 4 
   Put("Skriv in ett heltal och ett flyttal: ");
   Get(H1);
   Get(F1);
   Put("Du skrev in heltalet: ");
   Put(H1, Width => 9);
   New_Line;
   Put("Du skrev in flyttalet:");
   Put(F1, Fore => 4, Aft => 4, Exp => 0);
   New_Line(2);  
   
   Skip_Line;
   
   -- Inmatning nummer 5
   Put("Skriv in ett tecken: ");
   Get(C1);
   Put("Du skrev in tecknet: ");
   Put(C1);
   New_Line(2); 
     
   Skip_Line;
   
   
   -- Inmatning nummer 6
   Put("Skriv in en sträng med 5 tecken: ");
   Get(S1(1..5));
   Put("Du skrev in strängen: ");
   Put(S1(1..5));
   New_Line(2);
   
   Skip_Line;
   
   
   --Inmatning nummer 7
   Put("Skriv in en sträng med 3 tecken: ");
   Get(S1(1..3));
   Put("Du skrev in strängen: ");
   Put(S1(1..3));
   New_Line(2);
   
   Skip_Line;
   
   
   --Inmatning nummer 8
   Put("Skriv in ett heltal och en sträng med 5 tecken: ");
   Get(H1);
   Get(C1);
   Put("Du skrev in talet |");
   Put(H1, Width => 0);
   Get(S1(1..5));
   Put("|");
   Put(" och strängen |");
   Put(S1(1..5));
   Put("|.");
   New_Line(2);
   
   Skip_Line;
   
   
   
   -- Inmatning nummer 9
   Put("Skriv in en sträng med 3 tecken och ett flyttal: ");
   Get(S1(1..3));
   Get(F1);
   Put("Du skrev in """);
   Put(F1, Fore => 2, Aft => 3, Exp => 0);
   Put(""" och """ & S1(1..3) & """.");
   New_Line(2);
   
   Skip_Line;

   
   -- Inmatning nummer 10
   Put("Skriv in en sträng som är maximalt 5 tecken: ");
   Get_Line(S1, H1);
   Put("Du skrev in strängen: ");
   if H1 < 5 then
      Put(S1(1..H1));
   else
      Put(S1(1..5));
      Skip_Line;
   end if;
   New_Line(2);
  
   
   -- Inmatning nummer 11
   Put("Skriv in en sträng som är maximalt 5 tecken: ");
   Get_Line(S1, H1);
   Put("Du skrev in strängen: ");
   if H1 < 5 then
      Put(S1(1..H1));
   else
      Put(S1(1..5));
   end if;
   New_Line(2);
   
     
     
end In_Och_Utmatning;
