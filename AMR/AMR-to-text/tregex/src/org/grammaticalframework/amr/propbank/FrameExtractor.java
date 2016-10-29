package org.grammaticalframework.amr.propbank;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

/**
 * Extracts frames and their lexical alternatives from the PropBank dataset.
 */
public class FrameExtractor {
	
	private static String convertType(String pos) {
		if (pos.equals("l")) {
			return null;
		} else if (pos.equals("j")) {
			return "A";
		} else {
			return pos.toUpperCase();
		}
	}
	
	private static List<String> processRoleSet(Element roleset) throws Exception {
		XPath xpath = XPathFactory.newInstance().newXPath();
		NodeList aliases = (NodeList) xpath.evaluate("aliases/alias", roleset, XPathConstants.NODESET);
		
		List<String> entries = new ArrayList<String>();
		
		for (int i = 0; i < aliases.getLength(); i++) {
			Element a = (Element) aliases.item(i);
			String pos = convertType(a.getAttribute("pos"));
			
			if (pos != null) {
				entries.add(a.getTextContent() + "_" + pos);
			}
		}
		
		return entries;
	}
	
	private static void processFrameSet(File file, Map<String, List<String>> framesets) throws Exception {
		if (!file.getName().toLowerCase().endsWith("xml")) {
			return;
		}
		
		// Load and parse the XML document
		Document xml = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(file);
		xml.getDocumentElement().normalize();
		Element root = xml.getDocumentElement();
		
		XPath xpath = XPathFactory.newInstance().newXPath();
		NodeList rolesets = (NodeList) xpath.evaluate("predicate//roleset", root, XPathConstants.NODESET);
		
		for (int i = 0; i < rolesets.getLength(); i++) {
			Element rs = (Element) rolesets.item(i);
			List<String> aliases = processRoleSet(rs);
			
			framesets.put(rs.getAttribute("id").replace('.', '-'), aliases);
		}
	}
	
	public static Map<String, List<String>> extract(String path) throws Exception {
		Map<String, List<String>> framesets = new TreeMap<String, List<String>>();
		
		File dir = new File(path);
		if (dir.isDirectory()) {
			File[] files = dir.listFiles();
			for (int i = 0; i < files.length; i++) {
				processFrameSet(files[i], framesets);
			}
		}
		
		return framesets;
	}
	
	public static void main(String[] args) throws Exception {
		Map<String, List<String>> framesets = extract("../lexicons/propbank/frames");
		
		PrintWriter out = new PrintWriter("../lexicons/propbank/frames-entries.txt", "UTF-8");
		
		for (String frame : framesets.keySet()) {
			List<String> alter = framesets.get(frame);
			out.println(frame + "\t" + alter.toString().replaceAll("[\\[ \\]]", ""));
		}
		
		out.close();
	}
	
}
