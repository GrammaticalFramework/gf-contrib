package org.grammaticalframework;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
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

        List<String> adjectives = new ArrayList<String>();

        for (String entry : all) {
            String word = entry.substring(0, entry.lastIndexOf("_"));

            if (all.contains(word + "_A") && !word.contains("_")) {
                adjectives.add(word); // Ignore compounds (for now)
            }
        }

        System.out.println(adjectives);
    }

    public static void main(String[] args) throws Exception {
        readDictionary("../lexicons/translator/DictionaryEng.gf");
    }

}
