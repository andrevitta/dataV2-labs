# -*- coding: utf-8 -*-
"""
Created on Wed Jan 15 14:27:22 2020

@author: andre
"""

import pandas as pd
import pymysql 
from sqlalchemy import create_engine
import os

l = {i[:-4]:pd.read_csv(i,sep=';') for i in os.listdir() if i.endswith('asc') }


username='root'
password ='@Pietro2014'
host = 'localhost'
database = 'finance'
engine = create_engine(f"""mysql+pymysql://{username}:{password}@{host}/{database}""")

for i,j in l.items():
    j.to_sql(i,engine,index=False, if_exists='replace')


