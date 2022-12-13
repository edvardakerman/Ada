-- edvak514: Arbetat enskilt
with Ada.Text_IO; use Ada.Text_IO; 
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Rekurtion is
   
   
   function Fib(N : in Integer) return Integer is 
      
   begin
      
      if N <= 2 then
	 return 1;
      else	 
	 return (Fib(N - 1) + Fib(N - 2));
      end if;
   end Fib;
   
   
   function Staircase(HH : in Integer) return Integer is
      
   begin
      
      If HH < 2 then 
	 return 0;
      end if;     
      
      If HH = 2 then 
	 return 1;
      end if;
      
      return (HH-1) * (2*HH-3) + Staircase(HH-1);
      
   end Staircase;
   

   N, HH : Integer;
   
begin     
   
   Put("Mata in N och HH: ");
   Get(N);
   Get(HH);
   Skip_Line;
   
   Put("Fibonacci-tal nummer ");
   Put(N, Width => 0);
   Put(" är ");
   Put(Fib(N), Width => 0);
   Put(".");
   New_Line;
   
   Put("Det behövs ");
   Put(Staircase(HH), Width => 0);
   Put(" stenar för att bygga trappan.");	   
   
end Rekurtion;
