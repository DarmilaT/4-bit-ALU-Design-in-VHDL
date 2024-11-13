LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ALU_4bit IS
    PORT (
        A : IN signed(3 DOWNTO 0);
        B : IN signed(3 DOWNTO 0);
        M : IN STD_LOGIC;
        opcode : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        Y : OUT signed(3 DOWNTO 0);
        carry : OUT STD_LOGIC
    );
END ALU_4bit;

ARCHITECTURE Behavioral OF ALU_4bit IS
    SIGNAL temp_result : signed(4 DOWNTO 0); -- 5 bits to handle overflow (carry out)
BEGIN
    PROCESS (A, B, M, opcode)
    BEGIN
        carry <= '0'; -- Initialize carry

        CASE M IS
            WHEN '0' => -- Arithmetic operations
                CASE opcode IS
                    WHEN "000" => -- Transfer A
                        Y <= A;
                    WHEN "001" => -- A + 1
                        Y <= A + 1;
                    WHEN "010" => -- A + B
                        Y <= A + B;
                    WHEN "011" => -- A + B + 1
                        Y <= A + B + 1;
                    WHEN "100" => -- A + B'
                        Y <= A + NOT B;
                    WHEN "101" => -- A - B
                        Y <= A - B;
                    WHEN "110" => -- A' + B
                        Y <= NOT A + B;
                    WHEN "111" => -- B - A
                        Y <= B - A;
                    WHEN OTHERS =>
                        NULL;
                END CASE;
                --Y <= temp_result(3 DOWNTO 0); -- Assign lower 4 bits to Y
                --carry <= temp_result(4); -- Assign 5th bit to carry

            WHEN '1' => -- Logic operations
                CASE opcode(1 DOWNTO 0) IS -- Only 2-bit opcodes for logic
                    WHEN "00" => -- AND
                        Y <= A AND B;
                    WHEN "01" => -- OR
                        Y <= A OR B;
                    WHEN "10" => -- XOR
                        Y <= A XOR B;
                    WHEN "11" => -- XNOR
                        Y <= A XNOR B;
                    WHEN OTHERS =>
                        NULL;
                END CASE;

            WHEN OTHERS =>
                NULL; -- To cover any unexpected values of M
        END CASE;
    END PROCESS;
END Behavioral;