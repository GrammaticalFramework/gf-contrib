# -*- coding: utf-8 -*-

import pgf

def node_is_empty(tree):
    # Checks if a tree/subtree/node is empty, i.e.
    # checks whether the root function is None.
    fun,children = tree.unpack()
    if fun == None:
        return True

def _get_empty_node_locations(incomplete_tree,locs):
    # Recursive method for returning empty node locations.
    if node_is_empty(incomplete_tree):
        locs += (None,0)

    fun,children = incomplete_tree.unpack()
    for i in range(len(children)):
        if node_is_empty(children[i]):
                locs += [(fun,i)]
        else:
            _get_empty_node_locations(children[i],locs)

def get_empty_node_locations(incomplete_tree):
    # Returns a list of locations where nodes are empty.
    # A location consists of the parent function and
    # the position of the empty child.
    locs = []
    _get_empty_node_locations(incomplete_tree,locs)
    return locs

def insert_subtree(tree,location,subtree):
    # Returns a new tree with subtree inserted into tree at the given location.
    try:
        fun,children = tree.unpack()
        if not fun:
            return (False,tree)
    except:
        return (False,tree)

    rep_loc = location[0]
    rep_pos = location[1]
    if rep_loc == fun and node_is_empty(children[rep_pos]):
        # insert only if parent has empty child at correct location
        children[rep_pos] = subtree
        expr = pgf.Expr(fun,children)
        return (True,expr)
    else:
        n_children = []
        inserted = False
        for c in children:
            c_inserted,c_expr = insert_subtree(c,location,subtree)
            n_children.append(c_expr)
            inserted = c_inserted
        try:
            expr = pgf.Expr(fun,n_children)
        except TypeError:
            return (False,tree)
        return (inserted,expr)

def parse(input,concr_grammar):
    # Helper method for getting the first parse.
    p_iter = concr_grammar.parse(input)
    return next(p_iter)[1]

def _extract_subtrees(category,tree,grammar,subtrees):
    # Recursive method for returning subtrees of type "category".
    if get_root_cat(tree,grammar) == category:
        subtrees.append(tree)
    cs = get_children(tree)
    for c_expr in cs:
        subtrees += _extract_subtrees(category,c_expr,grammar,subtrees)
    return subtrees

def extract_subtrees(category, tree, grammar):
    # Returns all subtrees of type "category".
    return _extract_subtrees(category, tree, grammar, [])

def get_root_fun(tree):
    # Returns the root function of the tree.
    try:
        return tree.unpack()[0]
    except:
        return None

def get_root_cat(tree,grammar):
    # Returns the category of the tree.
    head_fun = get_root_fun(tree)
    try:
        ftype = grammar.functionType(head_fun)
        return ftype.cat
    except:
        return None

def get_children(tree):
    # Helper method that returns all immediate children.
    return tree.unpack()[1]
