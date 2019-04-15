import pandas as pd
import numpy as np
from pandas import ExcelWriter
from pandas import ExcelFile
import matplotlib.pyplot as plt
import numpy as np
from sklearn.ensemble import RandomForestClassifier
from sklearn import metrics
from sklearn.metrics import accuracy_score

df = pd.read_csv('pre_data1.csv')

#del df['Min. Temp.']
del df['RH']
#del df['Max. RH']
#del df['UV Rad.']
#del df['Wind Speed']
train_data = df.iloc[0:7000]

test_data = df.iloc[7000:]

train_target = train_data['Rain']

test_target = test_data['Rain']


del train_data['id']
del train_data['Date & Time']
del test_data['Date & Time']
del train_data['Rain']
del test_data['id']
del test_data['Rain']

print train_data.head()

print train_target.head()

rf = RandomForestClassifier(n_estimators = 500, random_state = 42)

rf.fit(train_data, train_target)

test_pred = rf.predict(test_data)


errors = abs(test_pred - test_target)

print('Mean Absolute Error:', round(np.mean(errors), 2), 'degrees.')
print('Root Mean Squared Error:', np.sqrt(metrics.mean_squared_error(test_target, test_pred)))  

print accuracy_score(test_target, test_pred)
