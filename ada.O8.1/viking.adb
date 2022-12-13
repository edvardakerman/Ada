-- edvak514: Arbetat enskilt
with Ada.Text_IO;         use Ada.Text_IO; 
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line;    use Ada.Command_Line;

procedure Viking is   
   
   type Viking_Numbers_Type is 
     array (Character range 'a'..'g') of Integer;
   
   Viking_Constant : constant Viking_Numbers_Type := (1, 7, 12, 42, 112, 365, 1024);
   
   CORRECTED_VIKING : constant String := "CORRECTED_VIKING_NUMBERS.TXT";
   
   
   -------------------------------Put_Biggest_Viking sköter utskriften till programmet-------------------------------
   procedure Put_Biggest_Viking(Biggest                 : in Integer;
				Str_With_Biggest_Viking : in String) is
      
   begin
      
      Put("Största som heltal: ");
      Put(Biggest, Width => 0);
      
      New_Line;
      
      Put("Största som vikingskt tal: ");
      for I in Str_With_Biggest_Viking'Range loop
	 if Str_With_Biggest_Viking(I) /= ' ' then
	    Put(Str_With_Biggest_Viking(I));
	 end if;
      end loop;
      
   end Put_Biggest_Viking;
   -------------------------------------------------------------------------------------------------------------------
   
   
   -------------------------------Concat_Sum_To_StrLägger till summan i Str_For_Output-------------------------------
   procedure Concat_Sum_To_Str(Str_For_Output : in out String;
			       Sum            : in     Integer) is
      
      Number : Integer := 10000;
      I      : Integer := 1;
      
   begin
      
      loop
	 if Sum >= Number then
	    Str_For_Output(Str_For_Output'First + 57 + I..Str_For_Output'First + 63) := Integer'Image(Sum);
	    exit;
	 end if;
	 I := I + 1;
    	 Number := Number / 10;
      end loop;
      
   end Concat_Sum_To_Str;
   -------------------------------------------------------------------------------------------------------------------
   
   
   -------------------------------Get_Correct_Viking Går igenom summan och tar fram det korrekta vikingska talet-------------------------------
   procedure Get_Correct_Viking(Str_For_Output : in out String;
				Sum            : in     Integer) is
      
      I : Integer := 0;
      Sum_Tmp : Integer := Sum;
      
   begin
      
      for X in reverse Viking_Constant'Range loop
	 while Sum_Tmp > 0 loop
	    
	    if Sum_Tmp - Viking_Constant(X) >= 0 then
	       I := I + 1;
	       Str_For_Output(22 + I) := X;
	       Sum_Tmp := Sum_Tmp - Viking_Constant(X);
	    else
	       exit;
	    end if;
	    
	 end loop;
      end loop;
      
      -- Kontroll om Orginalet och Nya Vikinget talet är samma
      if Str_For_Output(Str_For_Output'First + 22..Str_For_Output'First + 41) = Str_For_Output(Str_For_Output'First + 1..Str_For_Output'First + 20) then
	 Str_For_Output(Str_For_Output'First + 22..Str_For_Output'First + 41) := ("                    ");
      end if;
      
   end Get_Correct_Viking;
   -------------------------------------------------------------------------------------------------------------------
   
   
   
   -- File Types
   Input_File, Output_File : File_Type;
   
   
   ---------------------Build_And_Print_Str sätter samman strängen Str_For_Output's alla delar och mater ut den till Output_File---------------------
   procedure Build_And_Print_Str(Str_For_Output, Str_With_Biggest_Viking  : in out String;
				 Sum, Biggest                             : in out Integer) is
      
      
   begin
      
      if Sum > 0 then
	 Get_Correct_Viking(Str_For_Output, Sum);
	 Concat_Sum_To_Str(Str_For_Output, Sum);
	 Put_Line(Output_File, Str_For_Output);
      end if;
      
      -- Tar även fram det störtsa vikinska talet
      if Sum > Biggest then
	 Biggest := Sum;
	 if Str_For_Output(Str_For_Output'First + 22..Str_For_Output'First + 52) = ("                               ") then
	    Str_With_Biggest_Viking := Str_For_Output(Str_For_Output'First + 1..Str_For_Output'First + 20) & ("           ");
	 else	       
	    Str_With_Biggest_Viking := Str_For_Output(Str_For_Output'First + 22..Str_For_Output'First + 52);
	 end if;
      end if;
      
      -- Återställer Str_For_Output och Sum för nästa rad
      Str_For_Output := ("|                    |                               |          |");
      Sum := 0;
      
   end Build_And_Print_Str;
   -------------------------------------------------------------------------------------------------------------------
   
   
   -------------------------------Real_Viking_Check tar bort rader som inte är äkta vikinska tal-------------------------------
   procedure Real_Viking_Check(Viking_Numb : in     Boolean;
		               Sum         : in out Integer) is

      Ch : Character;
      
   begin     
      
      if not Viking_Numb then
	 Sum := 0;
	 while not End_Of_Line(Input_File) loop
	    Get(Input_File, Ch);
	 end loop;
      end if;
      
   end Real_Viking_Check;
   ----------------------------------------------------------------------------------------------------------------------------

   
   -------------------------------Read_From_File går igenom datat från input_File och behanldar den-------------------------------
   procedure Read_From_File is
      
      Ch                      : Character;
      Sum, Biggest            : Integer := 0;
      I                       : Integer := 2;
      Viking_Numb             : Boolean := False;
      Str_For_Output          : String(1..65) := ("|                    |                               |          |");
      Str_With_Biggest_Viking : String(1..31);
      
   begin
      while not End_Of_File(Input_File) loop
	 
	 while not End_Of_Line(Input_File) loop
	    
	    Get(Input_File, Ch);
	    for X in Viking_Constant'Range loop	       
	       if Ch = X then
		  -- Matar in vikingska tecken i Str_For_Output 
		  Str_For_Output(I) := Ch;
		  -- Räknar ut Summan
		  Sum := Sum + Viking_Constant(X);	  
		  --  Boolean för kontroll av äkta Vikingtal
		  Viking_Numb := True;
		  I := I + 1;
	       end if;	       
	    end loop;
	    
	    Real_Viking_Check(Viking_Numb, Sum);
	    
	    Viking_Numb := False;
	    
	 end loop;
	 
	 Build_And_Print_Str(Str_For_Output, Str_With_Biggest_Viking, Sum, Biggest);
	 I := 2;
	 Skip_Line(Input_File);
	 
      end loop;
      Put_Biggest_Viking(Biggest, Str_With_Biggest_Viking);    
   end Read_From_File;
   --------------------------------------------------------------------------------------------------------------
   
   
   -------------------------------Exists Kollar om Filen Finns-------------------------------
   function Exists(File_Name : in String) return Boolean is
      
      Answer : Boolean := True;
      
   begin 
      begin 
	 Open(Output_File, In_File, File_Name);
	 Close(Output_File); 
      exception 
	 when Name_Error => Answer := False; 
      end; 
      return Answer; 
   end Exists; 
   ------------------------------------------------------------------------------------------

   
   -------------------------------Open_Files och Close_Files öppnar och stänger filer-------------------------------
   procedure Open_Files(File_Name : in String) is   
      
   begin
      
      Open(Input_File, In_File, File_Name);
      
      if not (Exists(CORRECTED_VIKING)) then
	 Create(Output_File, Append_File, CORRECTED_VIKING);
      else
	 Open(Output_File, Out_File, CORRECTED_VIKING);
      end if;
      
      Put_Line(Output_File, "|Inläst sträng       |Korrigerat vikingskt tal       |Värde     |");
      Put_Line(Output_File, "=================================================================");
      
      
   end Open_Files;
   
   
   procedure Close_Files is  
      
   begin
      
      Put_Line(Output_File, "=================================================================");
      Close(Output_File);
      Close(Input_File);
      
   end Close_Files;
   ----------------------------------------------------------------------------------------------------------
   
   
begin
   
   if Argument_Count = 1 then
      Open_Files(Argument(Number => 1));
      Read_From_File;
      Close_Files;
   else
      Put_Line("felaktigt antal argument!");
      Put("Användning: " & Command_Name & " FILNAMN.TXT");
   end if;

end Viking;
