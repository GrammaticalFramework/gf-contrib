package org.grammaticalframework.amr.peg;

import java.util.ArrayList;
import java.util.List;

/**
 * A node of an AMR graph (represented in a tree-like structure).
 */
public class AMRNode {

	private final String label;

	private final List<AMRNode> children = new ArrayList<AMRNode>();

	public AMRNode(String label) {
		this.label = label;
	}

	public boolean addChild(AMRNode child) {
		children.add(child);
		return true;
	}
	
	@Override
	public String toString() {
		if (label.equals("ROOT")) {
			return children.get(0).toString();
		}
		else if (children.size() == 0) {
			return label;
		}
		else {
			String subtree = "";
			for (AMRNode child : children) {
				subtree += child;
			}
			
			return "(" + label + " " + subtree + ")";
		}
	}

}
