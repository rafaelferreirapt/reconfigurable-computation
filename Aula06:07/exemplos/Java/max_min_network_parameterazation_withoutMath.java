import java.util.*; import java.io.*;
public class max_min_network_parameterazation_withoutMath
{
static final int N = 32; // N pode ser qualquer valor de 2**R, R = 0,1,2,3,4,5,6,7,8,9,10,... 
static final int p = 5;
static final int s[] = {1,2,4,8,16,32};		// change this array for greater numbers of N
static final int M = 16;					// M is the size of one word. DO NOT FORGET TO CHANGE FORMAT WHEN CHANGE M
static final int D = 8;            			// D is the depth of memory (how many addresses are allocated for the memory) 
static Random rand = new Random();
 public static void main(String[] args)    throws IOException 
 {    
      int result, a[] = new int[N];
		File fout = new File("coe_for_max.coe");
		PrintWriter pw = new PrintWriter(fout);
		pw.println("memory_initialization_radix = 16;");
		pw.println("memory_initialization_vector = ");
	for(int d = 0; d < D; d++) {
      for(int x = 0; x < N; x++)
         a[x] = rand.nextInt((int)Math.pow(2,16)-1);//Integer.MAX_VALUE);
      System.out.println();
      for(int i = 0; i < a.length;  i++)  {  System.out.printf("%10d; ",a[i]);
                                             if (((i+1)%5) == 0) System.out.println();      }
      for(int l=0; l<N-1; l++)	pw.printf("%04x",a[l]);		// CHANGE FORMAT HERE 4 = intlog M
      pw.printf((d == D-1) ? "%04x;\n" : "%04x,\n",a[N-1]);		// CHANGE FORMAT HERE 4 = intlog M
      long time=System.nanoTime();                                  
      result = SN(N,a);
      long time_end=System.nanoTime();
      System.out.printf("\n------------------------\nMaximum value = %5d\n\n",result);
      System.out.printf("measured time (in ns): %d\n",time_end-time);
	  System.out.printf("measured time (in microseconds): %.3f\n",(double)(time_end-time)/1000.);
								}
	  pw.println();
	  pw.close();
 }
      public static int SN(int N, int a[])
      {	 int tmp;
         for(int k = 0; k < p; k++)  
           for(int i = 0; i < a.length/s[k+1];  i++)
                    if (a[s[k+1]*i+s[k]-1] > a[s[k+1]*i+s[k+1]-1]) 
                    { 
                      tmp = a[s[k+1]*i+s[k]-1]; 
                      a[s[k+1]*i+s[k]-1] = a[s[k+1]*i+s[k+1]-1]; 
                      a[s[k+1]*i+s[k+1]-1] = tmp;
                    } 
         return a[N-1];                                       
}
}
