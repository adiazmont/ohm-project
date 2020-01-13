/*
 * Project: OHM - Resistor Classifier
 * Author: Alan A. Diaz Montiel
 * Affiliation: CETYS Universidad
 * Date: May 2016
 * 
 * This class describes a list to allocate the colors in order
 * of their x Value.
 */
public class ResistorList implements LinkedList {
	
	Color head;
	Color current;
	int listCount;
	
	// Constructor method
	public ResistorList() {
		head = null;
		listCount = 0;
	}
	
	// Insert sequentially
	@Override
	public void insert(Object data) {
		// TODO Auto-generated method stub
		Color _data = (Color) data;
		if(listCount == 0) {
			head = (Color) data;
			head.setNext(null);
			current = head;
			listCount++;
		} else {
			current.setNext(_data);
			_data.setNext(null);
			current = _data;
			listCount++;
		}
		
	}

	@Override
	public void sort(Object data) {
		// TODO Auto-generated method stub
	}

	// prints the list as its current status
	@Override
	public void readList() {
		// TODO Auto-generated method stub
		current = head;
		while(current != null) {
			int indexValue = ((Double) current.getIndexValue()).intValue();
			double xValue = (double) current.getXValue();
			System.out.println("Index value: " + indexValue + " - X value: " + xValue);
			current = current.getNext();
		}
	}
	
	public Color mergeSortLinkList(Color startNode){
		 
		  //Break the list until list is null or only 1 element is present in List.
		  if(startNode==null || startNode.getNext()==null){
			  return startNode;
		  }
		 
		  //Break the linklist into 2 list.
		  //Finding Middle node and then breaking the Linled list in 2 parts.
		  //Now 2 list are, 1st list from start to middle and 2nd list from middle+1 to last.
		 
		  Color middle = getMiddle(startNode);
		  Color nextOfMiddle = middle.getNext();
		  middle.setNext(null);
		 
		  //Again breaking the List until there is only 1 element in each list.
		  Color left = mergeSortLinkList(startNode);
		  Color right = mergeSortLinkList(nextOfMiddle);
		 
		  //Once complete list is divided and contains only single element, 
		  //Start merging left and right half by sorting them and passing Sorted list further. 
		  Color sortedList = mergeTwoListIterative(left, right);
		 
        	  head = sortedList;
		  return sortedList;
	}
	
	//Iterative Approach for Merging Two Sorted List
	 private Color mergeTwoListIterative(Color leftStart, Color rightStart) {
		 Color merged=null;
		 Color temp=null;
	 
		 //To keep track of last element, so that we don't need to iterate for adding the element at last of 
		 //list when either LeftStart or rightStart is NULL.
		 Color lastAddedNode = null;
	 
		 while(leftStart!=null && rightStart!=null){
			 Double leftStartValue = (Double) leftStart.getXValue();
			 Double rightStartValue = (Double) rightStart.getXValue();
			 if(leftStartValue > rightStartValue){
				 temp = rightStart;
				 rightStart=rightStart.getNext();
	 
			 } else {
				 temp = leftStart;
				 leftStart=leftStart.getNext();
			 }
	 
			 if(merged==null){
				 merged=temp;
			 }else{
				 lastAddedNode.setNext(temp);     
			 }
			 lastAddedNode=temp;
		 }
	 
		 if(leftStart!=null){
			 lastAddedNode.setNext(leftStart);
		 } else {
			 lastAddedNode.setNext(rightStart);
		 }
	   
		 return merged;
	 }

	 private Color getMiddle(Color startNode) {

		 if(startNode==null){
			 return startNode;
		 }
		 
		  Color pointer1=startNode;
		  Color pointer2=startNode;
		 
		  while(pointer2!=null && pointer2.getNext()!=null && pointer2.getNext().getNext()!=null){
			  pointer1 = pointer1.getNext();
			  pointer2 = pointer2.getNext().getNext();
		  }
		  return pointer1;
	}

	 public void printListAt(Color startNode) {
		 current = startNode;
		 while(current != null) {
			 int indexValue = (int) current.getIndexValue();
			 double xValue = (double) current.getXValue();
			 System.out.println("Index value: " + indexValue + " - X value: " + xValue);
			 current = current.getNext();
		}
	 }
    
    public Color getHead() {
        return head;
    }
    
    public int getListCount() {
        return listCount;
    }
}
