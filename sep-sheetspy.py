# -*- coding: utf-8 -*-
"""
Created on Fri Oct 18 13:33:48 2019

@author: Manda
"""

import pandas as pd

df1 = pd.read_csv('C:/Users/Manda/Documents/Data-Munging/CollegeScorecard_Raw_Data/sep-sheets/filtered17.csv',  delimiter=',',encoding='latin-1')
df2 = pd.read_csv('C:/Users/Manda/Documents/Data-Munging/CollegeScorecard_Raw_Data/sep-sheets/17-18.csv', delimiter=',',encoding='latin-1')

with open('filtered18.csv', 'w') as output:
    pd.merge(df1, df2, on='UNITID').to_csv(output, sep=',', index=False)