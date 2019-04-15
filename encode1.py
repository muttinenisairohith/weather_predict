import pandas as pd
import numpy as np
from pandas import ExcelWriter
from pandas import ExcelFile
 
df = pd.read_csv('pre_data1.csv')

b = 1
for i in range(1,df.shape[0]):
    if df['Time'][i] == 0:
        b+=1
    df['id'][i] = b


df.to_csv('pre_data1.csv', sep=',', encoding='utf-8')

