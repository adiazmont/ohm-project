/*
 * Project: OHM - Resistor Classifier
 * Author: Alan A. Diaz Montiel
 * Affiliation: CETYS Universidad
 * Date: May 2016
 * 
 * This class describes the elements of a Color:
 * indexValue: each color in the resistor range has its own index
 * i.e. red = 1, blue = 2, etc...
 * xValue: each line in a resistor is located at a specific location
 * (pixels), and according to its value, it describes how the resistor
 * is formed.
 */
public class Color {
	
	Color next;
	Object indexValue;
	Object xValue;
	
	public Color() {
		
	}
	
	public Color(Object _indexValue, Object _xValue) {
		next = null;
		indexValue = _indexValue;
		xValue = _xValue;
	}
	
	public void setNext(Color _next) {
		next = _next;
	}
	
	public Color getNext() {
		return next;
	}
	
	public void setIndexValue(Object _indexValue) {
		indexValue = _indexValue;
	}
	
	public Object getIndexValue() {
		return indexValue;
	}
	
	public void setXValue(Object _xValue) {
		xValue = _xValue;
	}
	
	public Object getXValue() {
		return xValue;
	}

}
