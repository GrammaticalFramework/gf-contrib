package org.grammaticalframework;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class WordExtractor {

    private static void readDictionary(String file) throws Exception {
        Map<String, String> ids = new TreeMap<String, String>();
        Set<String> adj = new TreeSet<String>();

        Pattern pWord = Pattern.compile("\\b(\\w+?_(V|V2|VV|VS|N|A|Adv|Prep|Det|Pron))\\b");

        BufferedReader dict = new BufferedReader(new FileReader(file));

        String line = null;
        while ((line = dict.readLine()) != null) {
            Matcher mWord = pWord.matcher(line.trim());

            while (mWord.find()) {
                String word = mWord.group(1);

                if (word.contains("_1_")) {
                    ids.put(word.replace("_1_", "_"), word);
                }

                word = word.replaceAll("_\\d+_", "_");

                if (word.endsWith("_A") && word.indexOf("_") == word.lastIndexOf("_")) {
                    // Ignore compounds (for now)
                    adj.add(word.substring(0, word.indexOf("_")));
                }
            }
        }

        dict.close();

        System.out.println("IDs (" + ids.size() + "): " + ids);
        System.out.println("Adj (" + adj.size() + "): " + adj);
    }

    public static void main(String[] args) throws Exception {
        readDictionary("../lexicons/translator/DictionaryEng.gf");
    }

}
