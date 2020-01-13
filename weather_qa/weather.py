# -*- coding: utf-8 -*-

import json
import pgf
import os

import qa_utils
import re
import openweathermap as w

GRAMMAR_BASE_NAME = "WeatherFact"
grammar = pgf.readPGF(GRAMMAR_BASE_NAME+".pgf")

def float_tree(float_value):
    fe = pgf.Expr(str(float_value))
    return pgf.Expr("FNum",[fe])

def lookup_value(api_response,keys):
    value = api_response
    for k in keys:
        value = value[k]
    return value

def _float_subtree(api_response,keys):
    tree = pgf.readExpr("UnknownNum")
    try:
        value = lookup_value(api_response,keys)
        tree = float_tree(value)
    except KeyError:
        pass
    return tree

def _clouds_subtree(api_response):
    return _float_subtree(api_response,["clouds","all"])

def _humidity_subtree(api_response):
    return _float_subtree(api_response,["main","humidity"])

def _pressure_subtree(api_response):
    return _float_subtree(api_response,["main","pressure"])

def _temperature_subtree(api_response):
    tree = pgf.readExpr("UnknownNum")
    try:
        kelvin = api_response["main"]["temp"]
        tree = float_tree(kelvin-273.15)
    except KeyError:
        pass
    return tree

def _windspeed_subtree(api_response):
    return _float_subtree(api_response,["wind","speed"])

def _winddirection_subtree(api_response):
    try:
        degrees = api_response["wind"]["deg"]
    except KeyError:
        return pgf.readExpr("UnknownDir")
    if degrees < 22.5 or degrees > 337.5:
        return pgf.readExpr("North")
    if degrees < 67.5:
        return pgf.readExpr("NorthEast")
    if degrees < 112.5:
        return pgf.readExpr("East")
    if degrees < 157.5:
        return pgf.readExpr("SouthEast")
    if degrees < 202.5:
        return pgf.readExpr("South")
    if degrees < 247.5:
        return pgf.readExpr("SouthWest")
    if degrees < 292.5:
        return pgf.readExpr("West")
    if degrees < 337.5:
        return pgf.readExpr("NorthWest")
    return pgf.readExpr("North")

def _condition_subtree(api_response):
    try:
        condition = api_response["weather"][0]["description"]
        function_name = condition.replace(" ","_")
        return pgf.readExpr(function_name)
    except KeyError:
        return pgf.readExpr("UnknownCondition")

subtree_lookup = {
  "Clouds" : _clouds_subtree,
  "Humidity" : _humidity_subtree,
  "Pressure" : _pressure_subtree,
  "Temperature" : _temperature_subtree,
  "WindSpeed" : _windspeed_subtree,
  "WindDirectionE" : _winddirection_subtree,
  "ConditionFact" : _condition_subtree
}

def _format_city_name(city_fun):
    return re.sub(r"(\w)([A-Z])", r"\1 \2", city_fun)

def _extract_location(q_tree):
    locations = qa_utils.extract_subtrees("Location",q_tree,grammar)
    return locations[0]

def _query_api(location_name):
    data = w.request_weather_update(_format_city_name(location_name))
    return data

def _query_workaround(location_name):
    json_str = open(os.path.join("queries",location_name+".json")).read()
    return json.loads(json_str)

def get_service_response(q_tree):
    location = _extract_location(q_tree)
    loc = str(location)
    api_response = _query_api(loc)
    return api_response

def create_missing_subtrees(q_tree,empty_locs,api_response):
    subtrees = []
    for f,cn in empty_locs:
        subtrees.append(subtree_lookup[f](api_response))
    return subtrees

def load_concretes(language):
    q_lang = GRAMMAR_BASE_NAME+language[0].upper()+language[1:].lower()+"Q"
    r_lang = GRAMMAR_BASE_NAME+language[0].upper()+language[1:].lower()+"R"
    q_concr = grammar.languages[q_lang]
    r_concr = grammar.languages[r_lang]
    return (q_concr,r_concr)
