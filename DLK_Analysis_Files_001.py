#!/usr/bin/env python
# coding: utf-8

# In[42]:


# Installing the Azure Data Lake Store Python SDK
get_ipython().system('pip install azure-mgmt-resource')
get_ipython().system('pip install azure-mgmt-datalake-store')
get_ipython().system('pip install azure-datalake-store')


# In[1]:


# import libs
import pandas as pd
import numpy as np
from azure.datalake.store import core, lib, multithread, logging


# In[2]:


# Create an ADLS File System Client. Connect using credentials and data lake store name.
token = lib.auth(tenant_id = '893644dc-5968-475b-a33a-8f27ba9efee0',
                 client_secret = '_-Ydv=:JDuf7F4NS2gZDmhqE6+jjI1+q',
                 client_id = '35db8ed1-865e-4e1e-8a15-e48695ef787e')
adl = core.AzureDLFileSystem(token, store_name='arthurffd001dlk')


# In[57]:


# logging.basicConfig(level='warning')


# In[1]:


# opening custos csv from datalake, reading chunks with 1000 rows
with adl.open('dimCustos/dlk_custos.csv', 'rb') as f:
    df = pd.read_csv(f, chunksize=1000)


# In[2]:


#get chunk #1
df2 = df.get_chunk(50)


# In[85]:


df2.head(100)


# In[62]:


#get maximum lenght for columns
measurer = np.vectorize(len)
res1 = measurer(df2.values.astype(str)).max(axis=0)
res1


# In[77]:


df2.shape


# In[81]:


# análise descritiva
df2.describe()


# In[ ]:




