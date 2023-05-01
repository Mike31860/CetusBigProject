import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Hashtable;

public class Main {

	public static final int POPULATION_SIZE = 8;

	private static Population population;
	private static boolean bestoptions;
	private static ArrayList<String> combinations;

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub

		// String current=System.getProperty("user.dir");
		// Process p = Runtime.getRuntime().exec
		// ("/mnt/c/Users/Migue/Desktop/TestNewScript/bashFiles/genetic_copy.sh");

		System.out.print("Please choose what you want to do: \n (1) Genetic Algorithm \n (2) Exhaustive Search ");
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String optionNumber = br.readLine();		
		System.out.print("Please write the application you want to apply the algorithm to: ");
		String nameApplication = br.readLine();
		if(optionNumber.equals("1"))
		{
	
		bestoptions = false;

		geneticAlgorithm(nameApplication);}
		else {
		
		combinations = new ArrayList<String>();
		callCetusSearchIntensive(combinations,  nameApplication);
		
		
		
		}

	}

	public static String geneticAlgorithm(String nameApplication) {
		// String defaultOption= options.dumpOptions();
		population = new Population(POPULATION_SIZE).initializePopulation();
		String path = "/mnt/c/Users/Migue/Desktop/TestNewScript/bashFiles/cetuscall.sh";
		// String
		// path="/home/2342/MiguelTestEnvironment/TestNewScript/bashFiles/cetuscall.sh";
		double defaultFitnessValue = callCetus(" -alias=2", path, nameApplication);

		String populat = population.ToString();
		System.out.print(population.getChromosomes().size());

		crossoverPopulation(population, nameApplication);

		while (!bestoptions) {

			ArrayList<Chromosome> chromosommm = mutateChromosome(population.getChromosomes(), defaultFitnessValue,
					nameApplication);
			population.setChromosomes(chromosommm);
			crossoverPopulation(population, nameApplication);

			System.out.println(population.ToString());

		}
		for (int i = 0; i < population.getChromosomes().size(); i++) {
			System.out.print("Chromosome: " + i + "\n");
			for (int j = 0; j < population.getChromosomes().get(i).getGenes().length; j++) {

				System.out.print("Transformation: " + population.getChromosomes().get(i).getGenes()[j].getName() + " "
						+ "Enable: " + population.getChromosomes().get(i).getGenes()[j].isEnable() + "\n");
			}

		}
		return population.ToString();
	}

	public ArrayList<Chromosome> intensiveSerchSpace() {

		int n = 6;

		int[] arr = new int[n];

		// Print all binary strings
		combinations = new ArrayList<String>();
		generateAllBinaryStrings(n, arr, 0);

		for (int i = 0; i < combinations.size(); i++) {

			String result = combinations.get(i) + "\n";
			System.out.println(result);
		}
		return null;
	}
	
	public static void callCetusSearchIntensive(ArrayList<String> arreglo, String nameAplication)
	{
		  double executionTime=0.0;
		  Hashtable comb = new Hashtable();
		for (int i = 0; i < arreglo.size(); i++) {
			String techniques="-alias=2 ";
			for (int j = 0; j < arreglo.get(i).length(); j++) {
				
				 String opt=arreglo.get(i).replace(" ", "");
				 if(j==0&&opt.charAt(j)=='0')
				 {
					 techniques+="-induction=0 ";
				 }
				 else if(j==0&&opt.charAt(j)=='1')
				 {
					 techniques+="-induction=1 ";
				 }
				 else if(j==1&&opt.charAt(j)=='0')
				 {
					 techniques += "-privatize=0 ";
				 }
				 else if(j==1&&opt.charAt(j)=='1')
				 {
					 techniques += "-privatize=1 ";
				 }
				 else if(j==2&&opt.charAt(j)=='0')
				 {
					 techniques += "-parallelize-loops=0 ";
				 }
				 else if(j==2&&opt.charAt(j)=='1')
				 {
					 techniques += "-parallelize-loops=1 ";
				 }
				 else if(j==3&&opt.charAt(j)=='0')
				 {
					 techniques += "-reduction=0 ";
				 }
				 else if(j==3&&opt.charAt(j)=='1')
				 {
					 techniques += "-reduction=1 ";
				 }				
				 else if(j==4&&opt.charAt(j)=='1')
				 {
					 techniques += "-loop_interchange ";
				 }
				 else if(j==5&&opt.charAt(j)=='1')
				 {
					 techniques +="-range=0 ";
				 }
				 else if(j==5&&opt.charAt(j)=='1')
				 {
					 techniques +="-range=1 ";
				 }
				 
				 String path = "/mnt/c/Users/Migue/Desktop/TestNewScript/bashFiles/cetuscall.sh";
					// String path="/home/2342/TestNewScript/bashFiles/cetuscall.sh";
					executionTime =callCetus(techniques, path, nameAplication);
					comb.put(opt, executionTime);
			}
			
			
			
		  }
		
		
				
	}
	
	static void saveValuesArray(int arr[], int n) {
		String combination = "";
		for (int i = 0; i < n; i++) {
			combination += arr[i] + " ";

		}
		combinations.add(combination);
	}

	// Function to generate all binary strings
	public static int[] generateAllBinaryStrings(int n, int arr[], int i) {
		if (i == n) {
			// printTheArray(arr, n);
			return arr;
		}

		// First assign "0" at ith position
		// and try for all other permutations
		// for remaining positions
		arr[i] = 0;
		generateAllBinaryStrings(n, arr, i + 1);

		// And then assign "1" at ith position
		// and try for all other permutations
		// for remaining positions
		arr[i] = 1;
		return generateAllBinaryStrings(n, arr, i + 1);
	}

	public static double valueSpeedUp(String nameApplication) throws IOException {
		String currentDir = System.getProperty("user.dir");
		File file = new File(currentDir + "/SNU_NPB-1.0.3/NPB3.3-SER-C/" + nameApplication + "/logFiles/log_"
				+ nameApplication.toLowerCase() + "_.txt");
		BufferedReader br = new BufferedReader(new FileReader(file));
		String st = "";
		String result = "";
		while ((st = br.readLine()) != null) {
			// System.out.println(st);
			if (st.contains("Time in seconds =")) {
				String[] speedup = st.replace(" ", "").split("=");
				for (int index = 0; index < speedup.length && speedup[index] != ""; index++) {
					System.out.println(speedup[index]);
					System.out.println("-----");
				}
				result = speedup[1];
			}
		}
		return Double.parseDouble(result);

	}

	public static void crossoverPopulation(Population population, String nameApplication) {
		for (int index = 0; index < population.getChromosomes().size(); index++) {
			ArrayList<Chromosome> chrom = population.getChromosomes();
			System.out.println("--HOLA--" + population.getChromosomes().size());
			System.out.println(chrom.get(index).genesS());
			double fitnessValue = 0.0;
			String techniques = "-alias=2 ";
			for (int j = 0; j < chrom.get(index).getGenes().length; j++) {

				if (chrom.get(index).getGenes()[j].getTransformation() == 'I'
						&& chrom.get(index).getGenes()[j].isEnable()) {
					techniques += "-induction=1 ";
				} else if (chrom.get(index).getGenes()[j].getTransformation() == 'I'
						&& !chrom.get(index).getGenes()[j].isEnable()) {

					techniques += "-induction=0 ";
				} else if (chrom.get(index).getGenes()[j].getTransformation() == 'P'
						&& chrom.get(index).getGenes()[j].isEnable()) {

					techniques += "-privatize=1 ";
				} else if (chrom.get(index).getGenes()[j].getTransformation() == 'P'
						&& !chrom.get(index).getGenes()[j].isEnable()) {

					techniques += "-privatize=0 ";
				} else if (chrom.get(index).getGenes()[j].getTransformation() == 'A'
						&& chrom.get(index).getGenes()[j].isEnable()) {

					techniques += "-parallelize-loops=1 ";
				} else if (chrom.get(index).getGenes()[j].getTransformation() == 'A'
						&& !chrom.get(index).getGenes()[j].isEnable()) {

					techniques += "-parallelize-loops=0 ";
				} else if (chrom.get(index).getGenes()[j].getTransformation() == 'R'
						&& chrom.get(index).getGenes()[j].isEnable()) {

					techniques += "-reduction=1 ";
				} else if (chrom.get(index).getGenes()[j].getTransformation() == 'R'
						&& !chrom.get(index).getGenes()[j].isEnable()) {

					techniques += "-reduction=0 ";
				} else if (chrom.get(index).getGenes()[j].getTransformation() == 'L'
						&& chrom.get(index).getGenes()[j].isEnable()) {

					techniques += "-loop_interchange ";
				} else if (chrom.get(index).getGenes()[j].getTransformation() == 'G'
						&& chrom.get(index).getGenes()[j].isEnable()) {

					techniques += "-range=1 ";
				} else if (chrom.get(index).getGenes()[j].getTransformation() == 'G'
						&& !chrom.get(index).getGenes()[j].isEnable()) {

					techniques += "-range=0 ";
				}

			}

			String path = "/mnt/c/Users/Migue/Desktop/TestNewScript/bashFiles/cetuscall.sh";
			// String path="/home/2342/TestNewScript/bashFiles/cetuscall.sh";
			fitnessValue = callCetus(techniques, path, nameApplication);

			chrom.get(index).setFitValues(fitnessValue);

		}
	}

	public static double callCetus(String techniques, String Path, String nameApplication) {

		double defaultFitnessValue = 0.0;
		ProcessBuilder processBuilder = new ProcessBuilder(Path, nameApplication.toUpperCase(),
				nameApplication.toLowerCase(), techniques);

		// processBuilder.directory(new File(path));
		try {
			Process process = processBuilder.start();
			process.waitFor();
			process.destroy();
			defaultFitnessValue = valueSpeedUp(nameApplication);

			System.out.println(defaultFitnessValue);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// try {
		// defaultFitnessValue= valueSpeedUp(nameApplication);
		// } catch (IOException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		return defaultFitnessValue;
	}

	public static ArrayList<Chromosome> mutateChromosome(ArrayList<Chromosome> chromosomes, double defaultFitnessValue,
			String nameApplication) {
		ArrayList<Chromosome> goodChromosomes = new ArrayList<Chromosome>();
		ArrayList<Chromosome> badChromosomes = new ArrayList<Chromosome>();
		// Chromosome[] chromosomesnew = new
		// Chromosome[goodChromosomes.size()+badChromosomes.size()];
		for (int i = 0; i < chromosomes.size(); i++) {
			if (chromosomes.get(i).getFitValues() > defaultFitnessValue) {
				// chromosomes.get(i).setFit(false);
				badChromosomes.add(chromosomes.get(i));
			} else {
				goodChromosomes.add(chromosomes.get(i));

			}
		}
		if (badChromosomes.size() >= 8) {
			population = new Population(POPULATION_SIZE).initializePopulation();
			String path = "/mnt/c/Users/Migue/Desktop/TestNewScript/bashFiles/cetuscall.sh";
			double defaultFitnessValue1 = callCetus(" -alias=2", path, nameApplication);

			String populat = population.ToString();
			System.out.print(population.getChromosomes().size());

			return population.getChromosomes();

		}
		if (badChromosomes.size() == 0) {
			bestoptions = true;

			for (int i = 0; i < chromosomes.size(); i++) {

				for (int j = 0; j < chromosomes.size() - i - 1; j++) {
					if (chromosomes.get(j).getFitValues() > chromosomes.get(j).getFitValues()) {
						Chromosome temp = chromosomes.get(j);
						chromosomes.set(j, chromosomes.get(j + 1));
						chromosomes.set(j + 1, temp);

					}
				}
			}
			return chromosomes;
		} else {
			bestoptions = false;
		}
		System.out.println(bestoptions);
		for (int j = 0; j < badChromosomes.size() && !bestoptions; j++) {
			int aleatorio = (int) (Math.random() * (goodChromosomes.size() - 0)) + 0;
			int aleatorio2 = (int) (Math.random() * (goodChromosomes.size() - 0)) + 0;
			Chromosome good = goodChromosomes.get(aleatorio);
			Chromosome good2 = goodChromosomes.get(aleatorio2);
			for (int l = 0; l < badChromosomes.get(j).getGenes().length; l++) {

				Chromosome bad = badChromosomes.get(j);
				if (l < badChromosomes.get(j).getGenes().length / 2) {
					bad.getGenes()[l] = good.getGenes()[l];
				} else {

					bad.getGenes()[l] = good2.getGenes()[l];
				}

				chromosomes.remove(badChromosomes.get(j));
				chromosomes.add(bad);
			}
		}
		// badChromosomes.get(j).setFit(true);

		//
		// System.out.println(badChromosomes.get(j));
		// System.out.println("GOOD: "+goodChromosomes.size()+" BAD:
		// "+badChromosomes.size());
		// chromosomesnew[j]=badChromosomes.get(j);
		// }
		// for (int m = 0; m < goodChromosomes.size(); m++) {
		// chromosomesnew[chromosomesnew.length+m]=goodChromosomes.get(m);
		// }

		return chromosomes;
	}

}
