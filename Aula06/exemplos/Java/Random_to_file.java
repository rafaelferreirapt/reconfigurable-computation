import java.util.*;   import java.io.*;    	                                   
public class Random_to_file {
  static Random rand = new Random();
  static final int M = 16;			// M is the size of one word. DO NOT FORGET TO CHANGE FORMAT WHEN CHANGE M
  static final int L = 256;			// L is the number of blocks 
  static final int D = 8;           // D is the depth of memory (how many addresses are allocated for the memory)         						
public static void main (String args[])   throws IOException     {
    int a[] = new int[L];			// the size of input data
    File fout = new File("coe_from_java256.coe");
	PrintWriter pw = new PrintWriter(fout);
	pw.println("memory_initialization_radix = 16;");
	pw.println("memory_initialization_vector = ");
for(int d = 0; d < D; d++) {
	for(int i = 0; i < a.length;  i++)
        //a[i] = rand.nextInt(Byte.MAX_VALUE);
        a[i] = rand.nextInt(16383);
	for(int l=0; l<L-1; l++)
		pw.printf("%04x",a[l]);							// CHANGE FORMAT HERE 4 = intlog M
	pw.printf((d == D-1) ? "%04x;" : "%04x,",a[L-1]);	// CHANGE FORMAT HERE 4 = intlog M
	pw.println();
							}
	pw.close();
}
}
