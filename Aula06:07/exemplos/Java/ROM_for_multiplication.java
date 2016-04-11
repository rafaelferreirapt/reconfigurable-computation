import java.util.*;   import java.io.*;    	                                   
public class ROM_for_multiplication {
  static final int MaxOp1 = 4;		// max value of the first operand
  static final int MaxOp2 = 4;		// max value of the second operand         						
public static void main (String args[])   throws IOException     {
    File fout = new File("coe_for_multiplication.coe");
	PrintWriter pw = new PrintWriter(fout);
	pw.println("memory_initialization_radix = 16;");
	pw.println("memory_initialization_vector = ");
	for(int i = 0; i < MaxOp1; i++) 
		for(int j = 0; j < MaxOp1;  j++)
			pw.printf((i==(MaxOp1-1)) & (j==(MaxOp2-1)) ? "%04x;" : "%04x,",i*j);
	pw.println();		
	pw.close();
}
}
