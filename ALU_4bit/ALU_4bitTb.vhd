LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ALU_4bitTb IS
END ALU_4bitTb;

ARCHITECTURE behavior OF ALU_4bitTb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT ALU_4bit
        PORT (
            A : IN signed(3 DOWNTO 0);
            B : IN signed(3 DOWNTO 0);
            M : IN STD_LOGIC;
            opcode : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            Y : OUT signed(3 DOWNTO 0);
            carry : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Inputs
    SIGNAL A : signed(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL B : signed(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL M : STD_LOGIC := '0'; -- Signal for arithmetic/logic mode
    SIGNAL opcode : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '0');

    -- Outputs
    SIGNAL Y : signed(3 DOWNTO 0);
    SIGNAL carry : STD_LOGIC;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut : ALU_4bit
    PORT MAP(
        A => A,
        B => B,
        M => M,
        opcode => opcode,
        Y => Y,
        carry => carry
    );

    -- Stimulus process
    stim_proc : PROCESS
    BEGIN
        WAIT FOR 100 ps;

        -- Testing arithmetic operations
        M <= '0';
        A <= "1001"; -- -7 in signed 4-bit binary
        B <= "0011"; -- 3 in signed 4-bit binary

        opcode <= "000"; -- Test: Y = A
        WAIT FOR 100 ps;

        opcode <= "001"; -- Test: Y = A + 1
        WAIT FOR 100 ps;

        opcode <= "010"; -- Test: Y = A + B
        WAIT FOR 100 ps;

        opcode <= "011"; -- Test: Y = A + B + 1
        WAIT FOR 100 ps;

        opcode <= "100"; -- Test: Y = A + NOT B (A + one's complement of B)
        WAIT FOR 100 ps;

        opcode <= "101"; -- Test: Y = A - B
        WAIT FOR 100 ps;

        opcode <= "110"; -- Test: Y = NOT A + B (one's complement of A plus B)
        WAIT FOR 100 ps;

        opcode <= "111"; -- Test: Y = B - A
        WAIT FOR 100 ps;

        -- Testing logic operations
        M <= '1';
        A <= "1010"; -- Test pattern
        B <= "1100"; -- Test pattern

        opcode <= "000"; -- Test: Y = A AND B
        WAIT FOR 100 ps;

        opcode <= "001"; -- Test: Y = A OR B
        WAIT FOR 100 ps;

        opcode <= "010"; -- Test: Y = A XOR B
        WAIT FOR 100 ps;

        opcode <= "011"; -- Test: Y = A XNOR B
        WAIT FOR 100 ps;

        -- End of simulation
        WAIT;
    END PROCESS;

END behavior;