#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import sys
import codecs
import json
import requests


def load_json_from_file(json_file):
    """
    Loads json into dict from file
    :param json_file:
    :return:
    """
    with open(json_file, "r") as read_file:
        data_dict = json.load(read_file)
    return data_dict


def retrieve_city_id(city_name, json_file):
    """
    Takes a city name and obtain its ID from the json file
    :param city_name:
    :param json_file:
    :return: city_id
    """
    city_id = 0
    data_lst = load_json_from_file(json_file)
    for data_dict in data_lst:
        if data_dict['name'] == city_name:
            city_id = data_dict['id']
    return city_id


def request_weather_update(city_name):
    """
    Send a request to the Weather API and receive a response
    :param request:
    :return: response
    """
    api_key = "f0d3ebb8079a04dc7b9dbd597baa9a1a"
    server_url = "http://api.openweathermap.org/data/2.5/weather?"

    city_id = retrieve_city_id(city_name, "city.list.json")

    response = requests.post("{}id={}&APPID={}".format(server_url, city_id, api_key))
    if response.status_code == 200:
        weather_data = response.json()

    else:
        weather_data = None

    return weather_data


if __name__ == '__main__':
    response_json = request_weather_update(sys.argv[1])
    print(response_json)
