import pandas as pd
import numpy as np
from pandas import ExcelWriter
from pandas import ExcelFile
import matplotlib.pyplot as plt
import numpy as np
from sklearn import datasets, linear_model,metrics
from sklearn.metrics import mean_squared_error, r2_score


df = pd.read_csv('pre_data.csv')

train_data = df.iloc[0:6000]

test_data = df.iloc[7000:]

train_target = train_data['Rain']

test_target = test_data['Rain']

del train_data['id']
del train_data['Rain']
del test_data['id']
del test_data['Rain']

print train_data.head()
print train_target.head()

regr = linear_model.LinearRegression()

regr.fit(train_data, train_target)

print('Coefficients: \n', regr.coef_)

test_pred = regr.predict(test_data)


print("Mean squared error: %.2f"
      % mean_squared_error(test_target, test_pred))

print('Variance score: %.2f' % r2_score(test_target, test_pred))

print('Root Mean Squared Error:', np.sqrt(metrics.mean_squared_error(test_target, test_pred)))


