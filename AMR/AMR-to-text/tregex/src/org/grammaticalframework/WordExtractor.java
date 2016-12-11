package org.grammaticalframework;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class WordExtractor {

    private static void readDictionary(String file) throws Exception {
        Set<String> all = new HashSet<String>();

        Pattern pWord = Pattern.compile("\\b(\\w+?_(V|V2|VV|VS|N|A))\\b");

        BufferedReader dict = new BufferedReader(new FileReader(file));

        String line = null;
        while ((line = dict.readLine()) != null) {
            Matcher mWord = pWord.matcher(line.trim());

            while (mWord.find()) {
                all.add(mWord.group(1).replaceAll("_\\d+_", "_"));
            }
        }

        dict.close();

        Map<String, List<String>> map = new HashMap<String, List<String>>();

        List<String> noun_only = new ArrayList<String>();
        List<String> adj_only = new ArrayList<String>();

        for (String entry : all) {
            String word = entry.substring(0, entry.lastIndexOf("_"));

            if (all.contains(word + "_N") && !all.contains(word + "_A")) {
                if (!word.contains("_")) {
                    noun_only.add(word); // Ignore compounds (for now)
                }
            }

            if (all.contains(word + "_A") && !all.contains(word + "_N")) {
                if (!word.contains("_")) {
                    adj_only.add(word); // Ignore compounds (for now)
                }
            }
        }

        System.out.println(adj_only);
    }

    public static void main(String[] args) throws Exception {
        readDictionary("../lexicons/translator/DictionaryEng.gf");
    }

}
