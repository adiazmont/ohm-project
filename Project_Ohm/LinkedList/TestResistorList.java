/*
 * Project: OHM - Resistor Classifier
 * Author: Alan A. Diaz Montiel
 * Affiliation: CETYS Universidad
 * Date: May 2016
 * 
 * This class contains the main method for testing the
 * functionality of the program.
 */
public class TestResistorList {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Color redColor = new Color();
		redColor.setIndexValue(Integer.parseInt("1"));
		redColor.setXValue(Double.parseDouble("33.45"));
		
		Color blueColor = new Color();
		blueColor.setIndexValue(Integer.parseInt("2"));
		blueColor.setXValue(Double.parseDouble("444.03"));
		
		Color greenColor = new Color();
		greenColor.setIndexValue(Integer.parseInt("3"));
		greenColor.setXValue(Double.parseDouble("56"));
		
		Color violetColor = new Color();
		violetColor.setIndexValue(Integer.parseInt("4"));
		violetColor.setXValue(Double.parseDouble("33.456"));
		
		ResistorList testList = new ResistorList();
		testList.insert(redColor);
		testList.insert(blueColor);
		testList.insert(greenColor);
		testList.insert(violetColor);
		
		testList.readList();
		
		System.out.println();
		
		testList.mergeSortLinkList(redColor);
		testList.readList();

	}

}
