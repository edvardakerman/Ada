with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions; use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;

procedure Calculator is
     
    Selector : Integer;    
     
    procedure Menu_Selection(Item : out Integer ) is
    begin
	Put_Line("=== HUVUDMENY ===");
	Put_Line("1. Beräkna hypotenusa");
	Put_Line("2. Beräkna triangelvinklar");
	Put_Line("3. Beräkna N-fakultet");
	Put_Line("4. Avsluta programmet");	      
	loop
	    Put("Val: ");
	    Get(Item);
	    exit when (Item >= 1 and Item <= 4);
	    Put_Line("Felaktigt val!");
	    Skip_Line;
	end loop;   
    end Menu_Selection;
	
	
    function Calculate_Hypothenuse(Leg1, Leg2 : in Float) return Float is
	   
        Hypothenuse : Float;
	   	   	   
    begin	      
	      
        Hypothenuse := (Leg1 * Leg1 + Leg2 * Leg2);
	Hypothenuse := Sqrt(Hypothenuse);
	     
	return Hypothenuse;
    end Calculate_Hypothenuse;
	
	
    procedure Hypothenuse_Program is
	
        Leg1, Leg2 : Float; 	
	
    begin
       
	Put("Mata in kateternas längder: ");
	Get(Leg1);
	Get(Leg2);
        Leg1 := Calculate_Hypothenuse(Leg1, Leg2);	   
        Put("Hypotenusan är ");
        Put(Leg1, Fore => 0, Aft => 2, Exp => 0);
	
    end Hypothenuse_Program;
	
	
    procedure Calculate_Angles(Hypothenuse, Leg : in Float; Va, Vb, Vc : out Float) is
	   
	Pi : constant := 3.14159_26535_89793_23846_26433_83279_50288_41971_69399_37511;
	   
    begin
	   
        Va := (Leg / Hypothenuse);
        Vb := Arccos(Va);           
        Va := Arcsin(Va);
        Va := (Va * 180.00) / Pi;
        Vb := (Vb * 180.00) / Pi;
        Vc := 90.00;
	   
    end Calculate_Angles;
	
	
    procedure Angle_Program is
	
        Hypothenuse, Leg, Va, Vb, Vc : Float; 	
	
    begin
        Put("Mata in hypotenusans längd: ");
        Get(Hypothenuse);
        Put("Mata in vertikala katetens längd: ");
        Get(Leg);
        Calculate_Angles(Hypothenuse, Leg, Va, Vb, Vc);
        Put("Va: ");
        Put(Va, Fore => 0, Aft => 1, Exp => 0);
        Put(" grader");
        New_Line;
        Put("Vb: ");
        Put(Vb, Fore => 0, Aft => 1, Exp => 0);
        Put(" grader");
        New_Line;
        Put("Vc: ");
        Put(Vc, Fore => 0, Aft => 1, Exp => 0);
        Put(" grader");
	   
    end Angle_Program;
    
    
    function Calculate_Factorial(N : in Integer) return Integer is
	   
        Factorial : Integer;
	   	   	   
    begin	      
	      
	Factorial := N;
        if N = 0 or N = 1 then
	    return 1;
	end if;	
	
	for I in 1..N-1 loop
	    Factorial := Factorial * I;
	end loop;
	     
	return Factorial;
    end Calculate_Factorial;
    
    
    procedure Factorial_Program is
	
        N : Integer;
	
    begin
	    
        Put("Mata in N: ");
        Get(N);
	Put(N, Width => 0);
        N := Calculate_Factorial(N);	    
        Put("-fakultet = ");
        Put(N, Width => 0);
	   
    end Factorial_Program;
    
        
begin
     
    Put("Välkommen till miniräknaren!");
    New_Line;
    loop     	
        Menu_Selection(Selector);      
        case Selector is
	    when 1 => Hypothenuse_Program;
	    when 2 => Angle_Program;
	    when 3 => Factorial_Program;
	    when 4 => Put("Ha en bra dag!"); exit;
	    when others => null;
        end case;       
        Skip_Line;
        New_Line(2);
    end loop;

end Calculator;
