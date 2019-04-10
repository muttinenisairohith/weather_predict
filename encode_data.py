import pandas as pd
import numpy as np
from pandas import ExcelWriter
from pandas import ExcelFile
 
df = pd.read_csv('pre_data.csv')

for i in range(df.shape[0]):
    if df['Rain'][i] > 0 and df['Rain'][i] <= 1:
        df['Rain'][i] = 1
    if df['Rain'][i] > 1 and df['Rain'][i] <= 2:
        df['Rain'][i] = 2
    if df['Rain'][i] > 2 and df['Rain'][i] <=4:
        df['Rain'][i] = 3
    if df['Rain'][i] > 4:
        df['Rain'][i] = 4

df.to_csv('pre_data1.csv', sep=',', encoding='utf-8')

