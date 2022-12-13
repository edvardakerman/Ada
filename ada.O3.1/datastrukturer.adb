-- edvak514: Arbetat enskilt
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
  
procedure Datastrukturer is

  -- DS1   
  type DS1_Record is
  record
     W : Character;
     P : String(1..4);
  end record;

  -- DS2
  type DU_Record is
  record
     S : Float;
     Z : String(1..4);
  end record;

  type DS2_Record is
  record
     D : DU_Record;
     U : DU_Record;
  end record;

  -- DS3
  type YQ_Record is
  record
     Y : Character;
     Q : Character;
  end record;

  type TL_Record is
  record
     T : Boolean := False;
     L : Character;
  end record;

  type DS3_Record is
  record
     J : YQ_Record;
     B : YQ_Record;
     O : TL_Record;
  end record;

  DS1 : DS1_Record;
  DS2 : DS2_Record;
  DS3 : DS3_Record;
      
      
  procedure Get(DS1 : out DS1_Record) is

     Ch : Character;

  begin
     Get(DS1.W);
     Get(Ch);
     Get(DS1.P);
  end Get;
      
      
  procedure Get(DS2 : out DS2_Record) is

     Ch : Character;

  begin
     Get(DS2.D.S);
     Get(Ch);
     Get(DS2.D.Z);
     Get(DS2.U.S);
     Get(Ch);
     Get(DS2.U.Z);
  end Get;
      
      
  procedure Get(DS3 : out DS3_Record) is

  begin
     Get(DS3.J.Y);
     Get(DS3.O.L);
     Get(DS3.J.Q);
     Get(DS3.O.L);
     Get(DS3.B.Y);
     Get(DS3.O.L);
     Get(DS3.B.Q);
     Get(DS3.O.L);
     Get(DS3.O.L);
     if DS3.O.L = 'T' then   
	DS3.O.T := True;	    
     end if;
     Get(DS3.O.L);
     Get(DS3.O.L);
  end Get;

  procedure Put(DS1 : in DS1_Record) is

  begin
     Put(DS1.W);
     Put(" ");
     Put(DS1.P);
  end Put;
      
      
  procedure Put(DS2 : in DS2_Record) is

  begin
     Put(DS2.D.S, Fore => 0, Aft => 3, Exp => 0);
     Put(" ");
     Put(DS2.D.Z);
     Put(" ");
     Put(DS2.U.S, Fore => 0, Aft => 3, Exp => 0);
     Put(" ");
     Put(DS2.U.Z);
  end Put;


  procedure Put(DS3 : in DS3_Record) is

  begin
     Put(DS3.J.Y);
     Put(" ");
     Put(DS3.J.Q);
     Put(" ");
     Put(DS3.B.Y);
     Put(" ");
     Put(DS3.B.Q);
     Put(" ");
     if DS3.O.T then
	Put("True ");
     else
	Put("False ");
     end if;
     Put(DS3.O.L);
  end Put;
      
  
begin
   
   Put("För DS1:");
   New_Line;
   Put("Mata in datamängd: ");
   Get(DS1);
   Put("Inmatad datamängd: ");
   Put(DS1);
      
   Skip_Line;
   New_Line(2);
   
   Put("För DS2:");
   New_Line;
   Put("Mata in datamängd: ");
   Get(DS2);
   Put("Inmatad datamängd: ");
   Put(DS2);
      
   Skip_Line;
   New_Line(2);
   
   Put("För DS3:");
   New_Line;
   Put("Mata in datamängd: ");
   Get(DS3);
   Put("Inmatad datamängd: ");
   Put(DS3);
   
end Datastrukturer;
