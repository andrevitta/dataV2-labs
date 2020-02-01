# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
import pandas as pd
import numpy 

shark=pd.read_csv('shark.csv', encoding = 'latin1')

shark_na = shark.isna().sum()
shark_missing = (shark_na[shark_na>0]/shark.shape[0]*100).round(2)
shark_missing

drop_cols = shark_missing[shark_missing>90].index
drop_cols

shark = shark.drop(drop_cols, axis=1)
shark.head()

drop_col = ['Case Number', 'Activity', 'Age', 'Time','Species ','Investigator or Source','pdf','href formula', 'href','Case Number.1','Case Number.2', 'original order']
shark = shark.drop(drop_col, axis=1)
shark.head()


drop_col = ['Case Number', 'Activity', 'Age', 'Time','Species ','Investigator or Source','pdf','href formula', 'href','Case Number.1','Case Number.2', 'original order']
shark = shark.drop(drop_col, axis=1)
shark.head()

shark.Injury = shark.Injury.fillna('Not reported')

injury_words = [
    x for x in ' '.join(
        shark.Injury.str.lower().tolist()
    ).split() if x.isalpha()
]

