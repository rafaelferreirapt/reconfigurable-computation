import java.util.*;
import java.io.*;
public class SortMeasureTime {	
	static Random rand = new Random();
	static final int L = 64;		// L is the size of data	
public static void main (String args[])   throws IOException     {
   int a[] = new int[L];	
   for(int i = 0; i < L; i++)  a[i] = rand.nextInt(16383); 
   long time=System.nanoTime();						// Measuring initial time in nanoseconds
   Arrays.sort(a);									// java sorting
   long time_end=System.nanoTime();                    // Measuring final time in nanoseconds
   System.out.printf("measured time (in microseconds): %.3f\n",(double)(time_end-time)/1000.);
}
}
