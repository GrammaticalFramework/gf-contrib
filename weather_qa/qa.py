# -*- coding: utf-8 -*-

import pgf
import json
import sys

import qa_utils as u
import error_messages as em

def answer_question(topic,language,question):

    # use the relevant topic module
    tm = __import__(topic)

    # load grammars
    try:
        (q_concr,r_concr) = tm.load_concretes(language)
    except KeyError:
        print(em.grammar_load_error_msg[language])
        return None

    # parse input
    try:
        q_tree = u.parse(question,q_concr)
    except pgf.ParseError as e:
        print(em.parse_error_msg[language])
        return None

    # get a response from some service
    response = tm.get_service_response(q_tree)
    if not response:
        print(em.response_error_msg[language])
        return None

    # find the empty node locations and the missing subtrees
    empty_locs = u.get_empty_node_locations(q_tree)
    subtrees = tm.create_missing_subtrees(q_tree,empty_locs,response)

    # construct the response tree by inserting subtrees
    r_tree = q_tree
    for i in range(min(len(empty_locs),len(subtrees))):
        inserted,r_tree = u.insert_subtree(r_tree,empty_locs[i],subtrees[i])

    # return linearization
    return r_concr.linearize(r_tree)

if __name__ == "__main__":

    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument("topic", help="Eg. 'weather'")
    parser.add_argument("language", help="(3-letter ISO-code)")
    parser.add_argument("question", help="Eg. 'what is the weather like in Stellenbosch?'")
    args = parser.parse_args()

    answer = answer_question(args.topic,args.language.lower(),args.question)
    if answer:
        print(answer)
