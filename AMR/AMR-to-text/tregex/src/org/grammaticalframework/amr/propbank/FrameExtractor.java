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
 *
 * See https://github.com/propbank/propbank-frames
 */
public class FrameExtractor {

    /**
     *
     * @param pos
     * @return
     */
    private static String convertType(String pos) {
        if (pos.equals("l")) {
            return null;
        } else if (pos.equals("j")) {
            return "A";
        } else {
            return pos.toUpperCase();
        }
    }

    /**
     *
     * @param roleset
     * @return
     */
    private static List<List<String>> processRoleSet(Element roleset) throws Exception {
        List<List<String>> types = new ArrayList<List<String>>();
        types.add(new ArrayList<String>()); // Entries
        types.add(new ArrayList<String>()); // Roles

        XPath xpath = XPathFactory.newInstance().newXPath();

        NodeList entries = (NodeList) xpath.evaluate("aliases/alias", roleset, XPathConstants.NODESET);

        for (int i = 0; i < entries.getLength(); i++) {
            Element e = (Element) entries.item(i);
            String pos = convertType(e.getAttribute("pos"));

            if (pos != null) {
                types.get(0).add(e.getTextContent() + "_" + pos);
            }
        }

        NodeList roles = (NodeList) xpath.evaluate("roles/role", roleset, XPathConstants.NODESET);

        for (int i = 0; i < roles.getLength(); i++) {
            Element r = (Element) roles.item(i);
            types.get(1).add("ARG" + r.getAttribute("n") + "=" + r.getAttribute("f").toUpperCase());
        }

        return types;
    }

    /**
     *
     * @param file
     * @param framesets
     */
    private static void processFrameSet(File file, Map<String, List<List<String>>> framesets) throws Exception {
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
            List<List<String>> types = processRoleSet(rs);

            framesets.put(rs.getAttribute("id").replace('.', '-'), types);
        }
    }

    /**
     *
     * @param path
     * @return
     */
    public static Map<String, List<List<String>>> extract(File path) throws Exception {
        Map<String, List<List<String>>> framesets = new TreeMap<String, List<List<String>>>();

        if (path.isDirectory()) {
            File[] files = path.listFiles();

            for (int i = 0; i < files.length; i++) {
                processFrameSet(files[i], framesets);
            }
        }

        return framesets;
    }

    /**
     *
     * @param args
     */
    public static void main(String[] args) throws Exception {
        Map<String, List<List<String>>> framesets = extract(new File("../lexicons/propbank/frames"));

        PrintWriter frame_entries = new PrintWriter("../lexicons/propbank/frames-entries.txt", "UTF-8");
        PrintWriter frame_roles = new PrintWriter("../lexicons/propbank/frames-roles.txt", "UTF-8");
        PrintWriter frame_verb = new PrintWriter("../lexicons/propbank/frames-verbs.txt", "UTF-8");
        PrintWriter frame_adj = new PrintWriter("../lexicons/propbank/frames-adjectives.txt", "UTF-8");
        PrintWriter frame_adj_maybe = new PrintWriter("../lexicons/propbank/frames-adjectives-maybe.txt", "UTF-8");
        PrintWriter frame_noun = new PrintWriter("../lexicons/propbank/frames-nouns.txt", "UTF-8");
        PrintWriter frame_noun_maybe = new PrintWriter("../lexicons/propbank/frames-nouns-maybe.txt", "UTF-8");

        for (String frame : framesets.keySet()) {
            List<String> entries = framesets.get(frame).get(0);
            List<String> roles = framesets.get(frame).get(1);

            frame_entries.println(frame + "\t" + entries.toString().replaceAll("[\\[ \\]]", ""));
            frame_roles.println(frame + "\t" + roles.toString().replaceAll("[\\[ \\]]", ""));

            boolean adjective = false;
            boolean noun = false;
            boolean verb = false;
            boolean other = false;

            for (String e : entries) {
                if (e.endsWith("_V")) {
                    verb = true;
                } else if (e.endsWith("_A")) {
                    adjective = true;
                } else if (e.endsWith("_N")) {
                    noun = true;
                } else {
                    other = true;
                }
            }

            if (verb && !adjective && !noun && !other) {
                frame_verb.println(frame);
            }

            if (adjective && !verb && !noun && !other) {
                frame_adj.println(frame);
            } else if (adjective) {
                frame_adj_maybe.println(frame);
            }

            if (noun && !verb && !adjective && !other) {
                frame_noun.println(frame);
            } else if (noun && !adjective) {
                frame_noun_maybe.println(frame);
            }
        }

        frame_entries.close();
        frame_roles.close();
        frame_verb.close();
        frame_adj.close();
        frame_adj_maybe.close();
        frame_noun.close();
        frame_noun_maybe.close();
    }

}
