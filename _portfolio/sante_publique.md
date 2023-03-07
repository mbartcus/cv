---
title: "Prepare data for a public health agency"
excerpt: "The public health agency of France wishes to make public health data more accessible so that they can be used by its agents. To do this, I will  carry out an initial exploration and visualization of the data, so that in consequence agents can then use our results."
header:
  image: /assets/img_portfolio/sante_public/sante_public.png
  teaser: /assets/img_portfolio/sante_public/sante_public.png
sidebar:
  - title: "Role"
    image: /assets/icons/path_oc.png
    image_alt: "logo"
    text: "IA Student, Lyon, France"
  - title: "Responsibilities"
    text:
    - Carry out cleaning operations on structured data
    - Perform univariate and multivariate statistical analysis
    - Communicate results using readable and relevant graphical representations models on images
toc: true
toc_label: BARTCUS Marius
toc_sticky: true
---

This project is focused on data gathered from the public health agency of France. **The data information and description** can be found on the OpenFoodData website: [OpenFood](https://world.openfoodfacts.org/).

The main tasks of the project were to:

1) Process the dataset to identify relevant variables for further processing. Automate these processes to avoid repeating these operations. The program should work if the database is slightly modified (e.g. adding entries).

2) Throughout the analysis, produce visualizations to better understand the data. Perform a univariate/multivariate analysis for each variable of interest to summarise its behavior. 

3) Confirm or refute hypotheses using descriptive and explanatory multivariate analysis. Perform appropriate statistical tests (one descriptive, one explanatory) to check the significance of the results.

In the figure below, I describe what is realized in this work. 

{% include figure image_path="/assets/img_portfolio/sante_public/Demarche_methodologique.png" alt="this is a placeholder image" caption="Figure 1: The tasks for the Future Vision Transport project" %}

Nevertheless, the first thing to do was to select a problem and describe it.

# Problem description:
We all have our own preferences when it comes to food. There are some who are interested in meat or fish, others who are interested in cheese, and still others who are interested in beverages. In addition, we wish to maintain our health by consuming the best foods.

It is, however, difficult to make an informed decision due to the wide variety of these foods accompanied by a myriad of nutrition facts.

Below are some nutrition facts and information to assist you in making the right food choices:

Our bodies store excess calories as body fat when we consume more calories than we burn. We may gain weight if this trend continues.

It is essential for your body to have fats in order to provide energy to your cells and support their function. By keeping your body warm, they also protect your organs. It is important to note that fats help the body absorb some nutrients as well as produce important hormones.

- Carbohydrates are your body's main source of energy: They help fuel your brain, kidneys, heart muscles, and central nervous system. For instance, fiber is a carbohydrate that aids digestion, helps you feel full, and keeps blood cholesterol levels in check.

- Sugars higher blood pressure, inflammation, weight gain, diabetes, and fatty liver disease — are all linked to an increased risk of heart attack and stroke.

- The human body requires a small amount of sodium to conduct nerve impulses, contract and relax muscles, and maintain the proper balance of water and minerals. It is estimated that we need about 500 mg of sodium daily for these vital functions.

We have to take control of the foods we are consuming. An active lifestyle can require more energy. Others need to eat less fatty foods and live a less active life, like having an inactive job. It is possible for others with certain desires to be restricted from eating foods containing some nutrients, such as sugars, salts, or additives. 

 

In my data analysis project, I propose to analyze the nutrition of food facts. I also propose an application to help the user understand the food nutrition facts, and make a decision on the desired food.



# Importing libraries 

First import libraries.

```python

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt 
import seaborn as sns

import scipy.stats as st

from sklearn import decomposition
from sklearn import preprocessing
from functions import *
from utils import *

from IPython.core.interactiveshell import InteractiveShell

InteractiveShell.ast_node_interactivity = "all"
```

# Loading dataset
```python
df = pd.read_csv('data/fr_openfoodfacts_products.csv', sep = '\t', encoding='utf-8', decimal='.', low_memory=False)
#df = data.copy()
df.head(5)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>code</th>
      <th>url</th>
      <th>creator</th>
      <th>created_t</th>
      <th>created_datetime</th>
      <th>last_modified_t</th>
      <th>last_modified_datetime</th>
      <th>product_name</th>
      <th>generic_name</th>
      <th>quantity</th>
      <th>...</th>
      <th>ph_100g</th>
      <th>fruits-vegetables-nuts_100g</th>
      <th>collagen-meat-protein-ratio_100g</th>
      <th>cocoa_100g</th>
      <th>chlorophyl_100g</th>
      <th>carbon-footprint_100g</th>
      <th>nutrition-score-fr_100g</th>
      <th>nutrition-score-uk_100g</th>
      <th>glycemic-index_100g</th>
      <th>water-hardness_100g</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0000000003087</td>
      <td>http://world-fr.openfoodfacts.org/produit/0000...</td>
      <td>openfoodfacts-contributors</td>
      <td>1474103866</td>
      <td>2016-09-17T09:17:46Z</td>
      <td>1474103893</td>
      <td>2016-09-17T09:18:13Z</td>
      <td>Farine de blé noir</td>
      <td>NaN</td>
      <td>1kg</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0000000004530</td>
      <td>http://world-fr.openfoodfacts.org/produit/0000...</td>
      <td>usda-ndb-import</td>
      <td>1489069957</td>
      <td>2017-03-09T14:32:37Z</td>
      <td>1489069957</td>
      <td>2017-03-09T14:32:37Z</td>
      <td>Banana Chips Sweetened (Whole)</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>14.0</td>
      <td>14.0</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0000000004559</td>
      <td>http://world-fr.openfoodfacts.org/produit/0000...</td>
      <td>usda-ndb-import</td>
      <td>1489069957</td>
      <td>2017-03-09T14:32:37Z</td>
      <td>1489069957</td>
      <td>2017-03-09T14:32:37Z</td>
      <td>Peanuts</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>0000000016087</td>
      <td>http://world-fr.openfoodfacts.org/produit/0000...</td>
      <td>usda-ndb-import</td>
      <td>1489055731</td>
      <td>2017-03-09T10:35:31Z</td>
      <td>1489055731</td>
      <td>2017-03-09T10:35:31Z</td>
      <td>Organic Salted Nut Mix</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>12.0</td>
      <td>12.0</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0000000016094</td>
      <td>http://world-fr.openfoodfacts.org/produit/0000...</td>
      <td>usda-ndb-import</td>
      <td>1489055653</td>
      <td>2017-03-09T10:34:13Z</td>
      <td>1489055653</td>
      <td>2017-03-09T10:34:13Z</td>
      <td>Organic Polenta</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 162 columns</p>
</div>

# EDA

```python
# quantité des données
print('Les quantité des données')
df.shape

# regarder les type des variable
print('Les type observé pour chaque variable')
df.dtypes

print('Conté les type des variables')
df.dtypes.value_counts()
```

    Les quantité des données

    (320772, 162)

    Les type observé pour chaque variable
    
    code                        object
    url                         object
    creator                     object
    created_t                   object
    created_datetime            object
                                ...   
    carbon-footprint_100g      float64
    nutrition-score-fr_100g    float64
    nutrition-score-uk_100g    float64
    glycemic-index_100g        float64
    water-hardness_100g        float64
    Length: 162, dtype: object

    Conté les type des variables

    float64    106
    object      56
    dtype: int64

We observe:

- **Observations and variables**: 320772, 162
- **Types des variables**: qualitative: 56 quantitative: 106

## Filtering data. Cleaning data.
```python
# verifié les valeurs manquants en affichant le pourcentage
dd = df.isna().mean().sort_values(ascending=True)*100

fig = plt.figure(figsize=(15, 10));
axes = sns.barplot(x=dd.values, y=dd.index, data=dd);
axes.set_xticks([]);
axes.set_yticks([0, 20, 40, 60, 80, 100]);
plt.title('NaN Values on entire dataset',fontsize=25);
plt.xlabel('Variables',fontsize=15);
plt.ylabel('% of NaN values',fontsize=15);
del dd;
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_9_0.png" alt="this is a placeholder image" caption="Figure 2: Missing values in dataset." %}

We observe:

- 162 variables with lots of NaNs! We should try to find an application and select the necessary variables!

First, for more clarity, we can see the variables that are less than 40% of NaNs.


```python
var_verify = (df.isna().mean() < 0.4)
columns40 = list(df.columns[var_verify])
```

The purpose of my data analysis project is to analyze the nutritional information provided by food facts. Additionally, I propose a software application that helps users understand food nutrition facts and make food choices.

***Despite the fact that there are other important variables in the dataset, these are the most important features for our first data analysis. For the purpose of identifying the product, we utilize the following features:***

1. Product information:

   - `code`
   - `creator`
   - `brands`
   - `product_name`
   - `countries_fr`
   - `ingredients_text`
   - `serving_size`
   - `additives_n`
   - `ingredients_from_palm_oil_n`                
   - `ingredients_that_may_be_from_palm_oil_n`
   - `additives_tags`
   - `pnns_groups_2`

 
2. The nutritions value used to compute the nutri score
   - `energy_100g`                                
   - `fat_100g`                                
   - `saturated-fat_100g`                         
   - `carbohydrates_100g`                         
   - `sugars_100g`                                
   - `fiber_100g`                                 
   - `proteins_100g`                              
   - `salt_100g`                                  
   - `sodium_100g`
   - `fruits-vegetables-nuts_100g`

3. The nutri score
   - `nutrition_grade_fr`
   - `nutrition-score-fr_100g`
   - `nutrition-score-uk_100g`
   



```python
selected_columns = []

if 'fruits-vegetables-nuts_100g' not in columns40:
    columns40.append('fruits-vegetables-nuts_100g') # needed to compute the nutri-score

if 'pnns_groups_2' not in columns40:
    columns40.append('pnns_groups_2') # need to get categories

for c in columns40:
    if not(c.endswith('_datetime')) and not(c.endswith('_t')) and not(c.endswith('_tags')):
        selected_columns.append(c)

if 'additives_tags' not in selected_columns:
    selected_columns.append('additives_tags')
    
if 'additives' in selected_columns:
    selected_columns.remove('additives')

df_selected = df[selected_columns];
```

Now we have our data with the selected columns. The next step is to omit unnecessary columns.

## Getting rid of unnecessary colons


```python
cols_to_delete = ['states', 'states_fr', 'countries', 'url'] # 'nutrition-score-uk_100g'

for c in cols_to_delete:
    if c in df_selected.columns:
        df_selected.drop(c, inplace=True, axis=1)
    
```


```python
# quantité des données
print('Les quantité des données')
df_selected.shape

# regarder les type des variable
print('Les type observé pour chaque variable')
df_selected.dtypes

print('Conté les type des variables')
df_selected.dtypes.value_counts()
```

    Les quantité des données

    (320772, 25)

    Les type observé pour chaque variable

    code                                        object
    creator                                     object
    product_name                                object
    brands                                      object
    countries_fr                                object
    ingredients_text                            object
    serving_size                                object
    additives_n                                float64
    ingredients_from_palm_oil_n                float64
    ingredients_that_may_be_from_palm_oil_n    float64
    nutrition_grade_fr                          object
    energy_100g                                float64
    fat_100g                                   float64
    saturated-fat_100g                         float64
    carbohydrates_100g                         float64
    sugars_100g                                float64
    fiber_100g                                 float64
    proteins_100g                              float64
    salt_100g                                  float64
    sodium_100g                                float64
    nutrition-score-fr_100g                    float64
    nutrition-score-uk_100g                    float64
    fruits-vegetables-nuts_100g                float64
    pnns_groups_2                               object
    additives_tags                              object
    dtype: object

    Conté les type des variables


    float64    15
    object     10
    dtype: int64



Let us now examine our data to see how many NaN values it contains.

```python
plot_data(df_selected)
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_18_0.png" alt="this is a placeholder image" caption="Figure 3: Plotting the data and getting the NaN values." %}

We observe lots of NaNs. However, fewer columns are selected and data analysis can be done. 

First, we start with a data description in order to better understand the data.

## Describing data


```python
df_selected.describe()
```

<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>additives_n</th>
      <th>ingredients_from_palm_oil_n</th>
      <th>ingredients_that_may_be_from_palm_oil_n</th>
      <th>energy_100g</th>
      <th>fat_100g</th>
      <th>saturated-fat_100g</th>
      <th>carbohydrates_100g</th>
      <th>sugars_100g</th>
      <th>fiber_100g</th>
      <th>proteins_100g</th>
      <th>salt_100g</th>
      <th>sodium_100g</th>
      <th>nutrition-score-fr_100g</th>
      <th>nutrition-score-uk_100g</th>
      <th>fruits-vegetables-nuts_100g</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>248939.000000</td>
      <td>248939.000000</td>
      <td>248939.000000</td>
      <td>2.611130e+05</td>
      <td>243891.000000</td>
      <td>229554.000000</td>
      <td>243588.000000</td>
      <td>244971.000000</td>
      <td>200886.000000</td>
      <td>259922.000000</td>
      <td>255510.000000</td>
      <td>255463.000000</td>
      <td>221210.000000</td>
      <td>221210.000000</td>
      <td>3036.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>1.936024</td>
      <td>0.019659</td>
      <td>0.055246</td>
      <td>1.141915e+03</td>
      <td>12.730379</td>
      <td>5.129932</td>
      <td>32.073981</td>
      <td>16.003484</td>
      <td>2.862111</td>
      <td>7.075940</td>
      <td>2.028624</td>
      <td>0.798815</td>
      <td>9.165535</td>
      <td>9.058049</td>
      <td>31.458587</td>
    </tr>
    <tr>
      <th>std</th>
      <td>2.502019</td>
      <td>0.140524</td>
      <td>0.269207</td>
      <td>6.447154e+03</td>
      <td>17.578747</td>
      <td>8.014238</td>
      <td>29.731719</td>
      <td>22.327284</td>
      <td>12.867578</td>
      <td>8.409054</td>
      <td>128.269454</td>
      <td>50.504428</td>
      <td>9.055903</td>
      <td>9.183589</td>
      <td>31.967918</td>
    </tr>
    <tr>
      <th>min</th>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>-17.860000</td>
      <td>-6.700000</td>
      <td>-800.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>-15.000000</td>
      <td>-15.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>3.770000e+02</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>6.000000</td>
      <td>1.300000</td>
      <td>0.000000</td>
      <td>0.700000</td>
      <td>0.063500</td>
      <td>0.025000</td>
      <td>1.000000</td>
      <td>1.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>1.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>1.100000e+03</td>
      <td>5.000000</td>
      <td>1.790000</td>
      <td>20.600000</td>
      <td>5.710000</td>
      <td>1.500000</td>
      <td>4.760000</td>
      <td>0.581660</td>
      <td>0.229000</td>
      <td>10.000000</td>
      <td>9.000000</td>
      <td>23.000000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>3.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>1.674000e+03</td>
      <td>20.000000</td>
      <td>7.140000</td>
      <td>58.330000</td>
      <td>24.000000</td>
      <td>3.600000</td>
      <td>10.000000</td>
      <td>1.374140</td>
      <td>0.541000</td>
      <td>16.000000</td>
      <td>16.000000</td>
      <td>51.000000</td>
    </tr>
    <tr>
      <th>max</th>
      <td>31.000000</td>
      <td>2.000000</td>
      <td>6.000000</td>
      <td>3.251373e+06</td>
      <td>714.290000</td>
      <td>550.000000</td>
      <td>2916.670000</td>
      <td>3520.000000</td>
      <td>5380.000000</td>
      <td>430.000000</td>
      <td>64312.800000</td>
      <td>25320.000000</td>
      <td>40.000000</td>
      <td>40.000000</td>
      <td>100.000000</td>
    </tr>
  </tbody>
</table>
</div>



The mean, standard deviation, minimum and maximum values as well as the quantiles are calculated for the numerical variables. It is easy to identify outliers in the maximum and minimum values. It is hoped that these issues will be addressed in the future.


```python
df_selected.describe(include=[object])
```

<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>code</th>
      <th>creator</th>
      <th>product_name</th>
      <th>brands</th>
      <th>countries_fr</th>
      <th>ingredients_text</th>
      <th>serving_size</th>
      <th>nutrition_grade_fr</th>
      <th>pnns_groups_2</th>
      <th>additives_tags</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>320749</td>
      <td>320770</td>
      <td>303010</td>
      <td>292360</td>
      <td>320492</td>
      <td>248962</td>
      <td>211331</td>
      <td>221210</td>
      <td>94491</td>
      <td>154680</td>
    </tr>
    <tr>
      <th>unique</th>
      <td>320749</td>
      <td>3535</td>
      <td>221347</td>
      <td>58784</td>
      <td>722</td>
      <td>205520</td>
      <td>25423</td>
      <td>5</td>
      <td>42</td>
      <td>41537</td>
    </tr>
    <tr>
      <th>top</th>
      <td>0000000003087</td>
      <td>usda-ndb-import</td>
      <td>Ice Cream</td>
      <td>Carrefour</td>
      <td>États-Unis</td>
      <td>Carbonated water, natural flavor.</td>
      <td>240 ml (8 fl oz)</td>
      <td>d</td>
      <td>unknown</td>
      <td>en:e322</td>
    </tr>
    <tr>
      <th>freq</th>
      <td>1</td>
      <td>169868</td>
      <td>410</td>
      <td>2978</td>
      <td>172998</td>
      <td>222</td>
      <td>5496</td>
      <td>62763</td>
      <td>22624</td>
      <td>8264</td>
    </tr>
  </tbody>
</table>
</div>



In categorical variables, the count, unique values, most commonly used, and frequency can be gathered. In future analyses, the code can be omitted since it is a unique value. Nevertheless, it is used to detect duplicates.


```python
# afficher les valeurs unique pour chaque variable
df_selected.nunique()
```

    code                                       320749
    creator                                      3535
    product_name                               221347
    brands                                      58784
    countries_fr                                  722
    ingredients_text                           205520
    serving_size                                25423
    additives_n                                    31
    ingredients_from_palm_oil_n                     3
    ingredients_that_may_be_from_palm_oil_n         7
    nutrition_grade_fr                              5
    energy_100g                                  3997
    fat_100g                                     3378
    saturated-fat_100g                           2197
    carbohydrates_100g                           5416
    sugars_100g                                  4068
    fiber_100g                                   1016
    proteins_100g                                2503
    salt_100g                                    5586
    sodium_100g                                  5291
    nutrition-score-fr_100g                        55
    nutrition-score-uk_100g                        55
    fruits-vegetables-nuts_100g                   333
    pnns_groups_2                                  42
    additives_tags                              41537
    dtype: int64


```python
df_selected.isna().mean().sort_values(ascending=True)
```

    creator                                    0.000006
    code                                       0.000072
    countries_fr                               0.000873
    product_name                               0.055373
    brands                                     0.088574
    energy_100g                                0.185986
    proteins_100g                              0.189699
    salt_100g                                  0.203453
    sodium_100g                                0.203599
    ingredients_text                           0.223866
    additives_n                                0.223938
    ingredients_from_palm_oil_n                0.223938
    ingredients_that_may_be_from_palm_oil_n    0.223938
    sugars_100g                                0.236308
    fat_100g                                   0.239675
    carbohydrates_100g                         0.240620
    saturated-fat_100g                         0.284370
    nutrition_grade_fr                         0.310382
    nutrition-score-fr_100g                    0.310382
    nutrition-score-uk_100g                    0.310382
    serving_size                               0.341180
    fiber_100g                                 0.373742
    additives_tags                             0.517788
    pnns_groups_2                              0.705426
    fruits-vegetables-nuts_100g                0.990535
    dtype: float64


# Data cleaning

The next step is to clean up the data. Data quality and reliability are improved by identifying, correcting, and removing errors, inconsistencies, and inaccuracies. In this process, problems such as missing or duplicate data, incorrect data formatting, outliers, and inconsistencies in the data relationships are identified and resolved. In data preparation and analysis, data cleaning ensures that the data used in a study is accurate, complete, and reliable. Cleansing data is intended to produce high-quality data that can be analyzed in a reliable and meaningful manner.

## Quantitative variables

Let us look at our quantitative variables. They are also known as numerical variables. This are types of variables in statistics that represent measurable quantities or numerical values. 
Quantitative variables are typically measured using numerical scales or units of measurement.

### Elimination `code` is NaN

First, we delete all the rows where ```code``` variable does not have a value.

```python
df_selected = df_selected[~df_selected.code.isna()]
```

### Verify duplicates by `code`

Next, we verify the duplicates for the ```code```variable.

```python
## verifié les valeurs dupliqué sur le même code
df_selected.duplicated(['code']).sum()
```

    0

We see that there are no duplicates for this variable.

### Dropping the feature `code`

Finally, we drop the variable ```code``` that does not serve us anymore.

```python
df_selected.drop(['code'], inplace=True, axis=1)
```

### Delete observations with empty nutritionists value

The observation with an empty nutritionists value has been deleted.

```python
df_selected = df_selected[~(df_selected.energy_100g.isna() & df_selected.proteins_100g.isna() & df_selected.sugars_100g.isna() & df_selected.fat_100g.isna() &
           df_selected['saturated-fat_100g'].isna() & df_selected.fiber_100g.isna() & df_selected.sodium_100g.isna() & df_selected['fruits-vegetables-nuts_100g'].isna())]
```

### Identifying and correcting outliers

Here, we identify and delete outliers. Nutrition that is negative or larger than 100g are outliers, and we do not consider them.


```python
mask = ~((df_selected.fiber_100g<0) | (df_selected.fiber_100g>100) |
         (df_selected.salt_100g<0) | (df_selected.salt_100g>100) |
         (df_selected['proteins_100g']<0) | (df_selected['proteins_100g']>100) |
         (df_selected['sugars_100g']<0) | (df_selected['sugars_100g']>100)
        );
df_selected = df_selected[mask];
```

Additionally, foods contain protein, fat, and carbohydrates. In total, we should not have more than 100 grams. In such a context, we also identify some outliers and discard them.


```python
cols = [
    'proteins_100g',
    'fat_100g',
    'carbohydrates_100g'    
    ]   
df_selected['sum_on_g'] = df_selected[cols].abs().sum(axis=1)
df_selected['is_outlier'] = df_selected.sum_on_g>100

df_selected = df_selected[df_selected.is_outlier==False];

df_selected.drop(['sum_on_g', 'is_outlier'], inplace=True, axis=1);
```

### Fill NaN
- First we set ```_100g``` numerical variables with 0 if they are not specified
- Next, for```nutrition_grade_fr``` we set from 'a' to 'e' values, using the knowledge from ```nutrition-score-fr_100g```
- energy_100g - Data entry in OpenFood can be difficult and complex, so users may confuse kJ and kcal when introducing the dataset. Calculate the total energy in kcal for all the values (17 proteins, 17 carbohydrates, and 39 fats)
- filling the additive counting variables with 0 if they are not specified


```python
cols = []
for col in df_selected.columns:
    if col.endswith('_100g') & ('nutrition-score' not in col) & ('nutrition-grade' not in col) & (col != 'energy_100g') :
        cols.append(col)
df_selected[cols] = df_selected[cols].fillna(value=0)
```

Next, we calculate the energy value and set it.

```python
# 1 calorie vaut 180/43 soit 4.1860465116 Joules que nous arrondirons à 4,186 Joules.
# 1000 calories = 1 Kilocalorie = 1 kcal
df_selected['energy_100g'] = 17*df_selected.proteins_100g + 17*df_selected.carbohydrates_100g + 39*df_selected.fat_100g
```

Now, we fill the `NaN` values with 0.
```python
df_selected['additives_n'] = df_selected['additives_n'].fillna(value=0)
df_selected['ingredients_from_palm_oil_n'] = df_selected['ingredients_from_palm_oil_n'].fillna(value=0)
df_selected['ingredients_that_may_be_from_palm_oil_n'] = df_selected['ingredients_that_may_be_from_palm_oil_n'].fillna(value=0)
```

### Minimum and maximum of nutriscore


```python
(df_selected['nutrition-score-fr_100g'].min(), df_selected['nutrition-score-fr_100g'].max())
```

    (-15.0, 40.0)


```python
(df_selected['nutrition-score-uk_100g'].min(), df_selected['nutrition-score-uk_100g'].max())
```


    (-15.0, 36.0)



## Qualitative variables

Qualitative variables, also known as categorical variables, are types of variables in statistics that represent qualities or characteristics that cannot be measured numerically. These variables are typically represented by non-numeric data or labels such as colors, names, types, or categories.

### Creation of variables by taking top values

```
def create_top(df, col, nr_top):
    col_name = '{0}_top{1}'.format(col , nr_top)
    ll = list(df[col].value_counts().head(5).index)
    df[col_name] = df[col]
    df.loc[~(df[col_name].isin(ll)),col_5] = 'Autre'
```

For example, we take two variables: `creator` and `countries_fr`. We want to select the top 5 values, and for the rest, we will name `Autre`. In this way, we can see the top values.

```python
take_top_5_col = ['creator', 'countries_fr']

for col in take_top_5_col:
    create_top(df_selected, col, 5)
```

The same thing we do for the `product_name`. Here we want to see the top 10 products.


```python
take_top_10_col = ['product_name']

for col in take_top_10_col:
    create_top(df_selected, col, 10)
```

### Clean `countries_fr` variable

The `:` character can be found in the values of `countries_fr` (ex: 'en:Tunisie' and 'Tunisie.' should be the same). We need to remove this and make countries have the same name.


```python
df_selected.countries_fr = df_selected.countries_fr.str.replace('en:', '')
df_selected.countries_fr = df_selected.countries_fr.str.replace('es:', '')
df_selected.countries_fr = df_selected.countries_fr.str.replace('de:', '')
df_selected.countries_fr = df_selected.countries_fr.str.replace('ar:', '')
df_selected.countries_fr = df_selected.countries_fr.str.replace('nl:', '')
df_selected.countries_fr = df_selected.countries_fr.str.replace('xx:', '')


df_selected.loc[(df_selected.countries_fr.str.lower() == 'royaume-uni') | (df_selected.countries_fr.str.lower() == 'Angleterre'), 'countries_fr'] = 'Royaume-Uni'
df_selected.loc[(df_selected.countries_fr.str.lower() == '77-provins') | (df_selected.countries_fr.str.lower() == 'Aix-en-provence'), 'countries_fr'] = 'France'
```

# Correlation

Correlation between two variables refers to the statistical relationship between them. Specifically, correlation measures the degree to which two variables are related or vary together.

In general, there are two types of correlation: positive and negative. A positive correlation exists when an increase in one variable is associated with an increase in the other variable, while a negative correlation exists when an increase in one variable is associated with a decrease in the other variable.

The strength of the correlation is measured by the correlation coefficient, which ranges from -1 to 1. A correlation coefficient of -1 indicates a perfect negative correlation, 0 indicates no correlation, and 1 indicates a perfect positive correlation.

Correlation is often used in statistical analysis to understand the relationship between two variables and to make predictions about one variable based on the other. However, correlation does not necessarily imply causation, and other factors may be influencing the relationship between the two variables. Therefore, the correlation should be interpreted with caution and further analysis should be conducted to establish causation.

## Between 2 quantitative variables


```python
plot_correlation(df_selected)
```

<style type="text/css">
#T_dc17b_row0_col0, #T_dc17b_row0_col1, #T_dc17b_row0_col2, #T_dc17b_row0_col3, #T_dc17b_row0_col4, #T_dc17b_row0_col5, #T_dc17b_row0_col6, #T_dc17b_row0_col7, #T_dc17b_row0_col8, #T_dc17b_row0_col9, #T_dc17b_row0_col10, #T_dc17b_row0_col11, #T_dc17b_row0_col12, #T_dc17b_row0_col13, #T_dc17b_row0_col14, #T_dc17b_row1_col1, #T_dc17b_row1_col2, #T_dc17b_row1_col3, #T_dc17b_row1_col4, #T_dc17b_row1_col5, #T_dc17b_row1_col6, #T_dc17b_row1_col7, #T_dc17b_row1_col8, #T_dc17b_row1_col9, #T_dc17b_row1_col10, #T_dc17b_row1_col11, #T_dc17b_row1_col12, #T_dc17b_row1_col13, #T_dc17b_row1_col14, #T_dc17b_row2_col2, #T_dc17b_row2_col3, #T_dc17b_row2_col4, #T_dc17b_row2_col5, #T_dc17b_row2_col6, #T_dc17b_row2_col7, #T_dc17b_row2_col8, #T_dc17b_row2_col9, #T_dc17b_row2_col10, #T_dc17b_row2_col11, #T_dc17b_row2_col12, #T_dc17b_row2_col13, #T_dc17b_row2_col14, #T_dc17b_row3_col3, #T_dc17b_row3_col4, #T_dc17b_row3_col5, #T_dc17b_row3_col6, #T_dc17b_row3_col7, #T_dc17b_row3_col8, #T_dc17b_row3_col9, #T_dc17b_row3_col10, #T_dc17b_row3_col11, #T_dc17b_row3_col12, #T_dc17b_row3_col13, #T_dc17b_row3_col14, #T_dc17b_row4_col4, #T_dc17b_row4_col5, #T_dc17b_row4_col6, #T_dc17b_row4_col7, #T_dc17b_row4_col8, #T_dc17b_row4_col9, #T_dc17b_row4_col10, #T_dc17b_row4_col11, #T_dc17b_row4_col12, #T_dc17b_row4_col13, #T_dc17b_row4_col14, #T_dc17b_row5_col5, #T_dc17b_row5_col6, #T_dc17b_row5_col7, #T_dc17b_row5_col8, #T_dc17b_row5_col9, #T_dc17b_row5_col10, #T_dc17b_row5_col11, #T_dc17b_row5_col12, #T_dc17b_row5_col13, #T_dc17b_row5_col14, #T_dc17b_row6_col6, #T_dc17b_row6_col7, #T_dc17b_row6_col8, #T_dc17b_row6_col9, #T_dc17b_row6_col10, #T_dc17b_row6_col11, #T_dc17b_row6_col12, #T_dc17b_row6_col13, #T_dc17b_row6_col14, #T_dc17b_row7_col7, #T_dc17b_row7_col8, #T_dc17b_row7_col9, #T_dc17b_row7_col10, #T_dc17b_row7_col11, #T_dc17b_row7_col12, #T_dc17b_row7_col13, #T_dc17b_row7_col14, #T_dc17b_row8_col8, #T_dc17b_row8_col9, #T_dc17b_row8_col10, #T_dc17b_row8_col11, #T_dc17b_row8_col12, #T_dc17b_row8_col13, #T_dc17b_row8_col14, #T_dc17b_row9_col9, #T_dc17b_row9_col10, #T_dc17b_row9_col11, #T_dc17b_row9_col12, #T_dc17b_row9_col13, #T_dc17b_row9_col14, #T_dc17b_row10_col10, #T_dc17b_row10_col11, #T_dc17b_row10_col12, #T_dc17b_row10_col13, #T_dc17b_row10_col14, #T_dc17b_row11_col11, #T_dc17b_row11_col12, #T_dc17b_row11_col13, #T_dc17b_row11_col14, #T_dc17b_row12_col12, #T_dc17b_row12_col13, #T_dc17b_row12_col14, #T_dc17b_row13_col13, #T_dc17b_row13_col14, #T_dc17b_row14_col14 {
  background-color: #000000;
  color: #f1f1f1;
  background-color: #f1f1f1;
}
#T_dc17b_row1_col0 {
  background-color: #ebd3c6;
  color: #000000;
}
#T_dc17b_row2_col0 {
  background-color: #f6bfa6;
  color: #000000;
}
#T_dc17b_row2_col1 {
  background-color: #f1cdba;
  color: #000000;
}
#T_dc17b_row3_col0 {
  background-color: #e2dad5;
  color: #000000;
}
#T_dc17b_row3_col1, #T_dc17b_row8_col4 {
  background-color: #e9d5cb;
  color: #000000;
}
#T_dc17b_row3_col2 {
  background-color: #e1dad6;
  color: #000000;
}
#T_dc17b_row4_col0 {
  background-color: #d2dbe8;
  color: #000000;
}
#T_dc17b_row4_col1, #T_dc17b_row7_col5 {
  background-color: #e5d8d1;
  color: #000000;
}
#T_dc17b_row4_col2, #T_dc17b_row5_col2, #T_dc17b_row6_col2 {
  background-color: #e0dbd8;
  color: #000000;
}
#T_dc17b_row4_col3 {
  background-color: #d65244;
  color: #f1f1f1;
}
#T_dc17b_row5_col0, #T_dc17b_row14_col13 {
  background-color: #d5dbe5;
  color: #000000;
}
#T_dc17b_row5_col1, #T_dc17b_row6_col1 {
  background-color: #e7d7ce;
  color: #000000;
}
#T_dc17b_row5_col3 {
  background-color: #f39778;
  color: #000000;
}
#T_dc17b_row5_col4 {
  background-color: #ea7b60;
  color: #f1f1f1;
}
#T_dc17b_row6_col0 {
  background-color: #f2cbb7;
  color: #000000;
}
#T_dc17b_row6_col3 {
  background-color: #f29072;
  color: #f1f1f1;
}
#T_dc17b_row6_col4, #T_dc17b_row10_col4, #T_dc17b_row10_col5, #T_dc17b_row11_col4, #T_dc17b_row11_col5, #T_dc17b_row14_col4, #T_dc17b_row14_col12 {
  background-color: #d7dce3;
  color: #000000;
}
#T_dc17b_row6_col5, #T_dc17b_row14_col3, #T_dc17b_row14_col9 {
  background-color: #d6dce4;
  color: #000000;
}
#T_dc17b_row7_col0 {
  background-color: #edd1c2;
  color: #000000;
}
#T_dc17b_row7_col1, #T_dc17b_row12_col2, #T_dc17b_row13_col2 {
  background-color: #e4d9d2;
  color: #000000;
}
#T_dc17b_row7_col2, #T_dc17b_row8_col5 {
  background-color: #dddcdc;
  color: #000000;
}
#T_dc17b_row7_col3, #T_dc17b_row9_col3 {
  background-color: #f5c0a7;
  color: #000000;
}
#T_dc17b_row7_col4, #T_dc17b_row10_col6, #T_dc17b_row11_col6 {
  background-color: #d4dbe6;
  color: #000000;
}
#T_dc17b_row7_col6 {
  background-color: #ec7f63;
  color: #f1f1f1;
}
#T_dc17b_row8_col0 {
  background-color: #cdd9ec;
  color: #000000;
}
#T_dc17b_row8_col1, #T_dc17b_row10_col0, #T_dc17b_row10_col1, #T_dc17b_row10_col9, #T_dc17b_row11_col0, #T_dc17b_row11_col1, #T_dc17b_row11_col9, #T_dc17b_row14_col1, #T_dc17b_row14_col2 {
  background-color: #dcdddd;
  color: #000000;
}
#T_dc17b_row8_col2, #T_dc17b_row9_col2, #T_dc17b_row10_col8, #T_dc17b_row11_col8, #T_dc17b_row14_col5 {
  background-color: #d8dce2;
  color: #000000;
}
#T_dc17b_row8_col3 {
  background-color: #f4c5ad;
  color: #000000;
}
#T_dc17b_row8_col6, #T_dc17b_row9_col8 {
  background-color: #f3c7b1;
  color: #000000;
}
#T_dc17b_row8_col7, #T_dc17b_row10_col2, #T_dc17b_row11_col2, #T_dc17b_row14_col6, #T_dc17b_row14_col8 {
  background-color: #dadce0;
  color: #000000;
}
#T_dc17b_row9_col0 {
  background-color: #cfdaea;
  color: #000000;
}
#T_dc17b_row9_col1, #T_dc17b_row14_col0, #T_dc17b_row14_col10, #T_dc17b_row14_col11 {
  background-color: #dbdcde;
  color: #000000;
}
#T_dc17b_row9_col4 {
  background-color: #f2c9b4;
  color: #000000;
}
#T_dc17b_row9_col5 {
  background-color: #f1ccb8;
  color: #000000;
}
#T_dc17b_row9_col6, #T_dc17b_row10_col7, #T_dc17b_row11_col7 {
  background-color: #d1dae9;
  color: #000000;
}
#T_dc17b_row9_col7 {
  background-color: #bad0f8;
  color: #000000;
}
#T_dc17b_row10_col3, #T_dc17b_row11_col3 {
  background-color: #d3dbe7;
  color: #000000;
}
#T_dc17b_row11_col10 {
  background-color: #b40426;
  color: #f1f1f1;
}
#T_dc17b_row12_col0, #T_dc17b_row13_col0 {
  background-color: #eed0c0;
  color: #000000;
}
#T_dc17b_row12_col1, #T_dc17b_row13_col1 {
  background-color: #ead4c8;
  color: #000000;
}
#T_dc17b_row12_col3 {
  background-color: #f08b6e;
  color: #f1f1f1;
}
#T_dc17b_row12_col4 {
  background-color: #f29274;
  color: #f1f1f1;
}
#T_dc17b_row12_col5 {
  background-color: #eb7d62;
  color: #f1f1f1;
}
#T_dc17b_row12_col6, #T_dc17b_row13_col6 {
  background-color: #f4c6af;
  color: #000000;
}
#T_dc17b_row12_col7 {
  background-color: #f5a081;
  color: #000000;
}
#T_dc17b_row12_col8 {
  background-color: #c6d6f1;
  color: #000000;
}
#T_dc17b_row12_col9 {
  background-color: #ead5c9;
  color: #000000;
}
#T_dc17b_row12_col10, #T_dc17b_row12_col11, #T_dc17b_row13_col9, #T_dc17b_row13_col10, #T_dc17b_row13_col11 {
  background-color: #ecd3c5;
  color: #000000;
}
#T_dc17b_row13_col3 {
  background-color: #ef886b;
  color: #f1f1f1;
}
#T_dc17b_row13_col4 {
  background-color: #f18d6f;
  color: #f1f1f1;
}
#T_dc17b_row13_col5 {
  background-color: #e9785d;
  color: #f1f1f1;
}
#T_dc17b_row13_col7 {
  background-color: #f6a283;
  color: #000000;
}
#T_dc17b_row13_col8 {
  background-color: #c7d7f0;
  color: #000000;
}
#T_dc17b_row13_col12 {
  background-color: #b50927;
  color: #f1f1f1;
}
#T_dc17b_row14_col7 {
  background-color: #dfdbd9;
  color: #000000;
}
</style>
<table id="T_dc17b_">
  <thead>
    <tr>
      <th class="blank level0" >&nbsp;</th>
      <th class="col_heading level0 col0" >additives_n</th>
      <th class="col_heading level0 col1" >ingredients_from_palm_oil_n</th>
      <th class="col_heading level0 col2" >ingredients_that_may_be_from_palm_oil_n</th>
      <th class="col_heading level0 col3" >energy_100g</th>
      <th class="col_heading level0 col4" >fat_100g</th>
      <th class="col_heading level0 col5" >saturated-fat_100g</th>
      <th class="col_heading level0 col6" >carbohydrates_100g</th>
      <th class="col_heading level0 col7" >sugars_100g</th>
      <th class="col_heading level0 col8" >fiber_100g</th>
      <th class="col_heading level0 col9" >proteins_100g</th>
      <th class="col_heading level0 col10" >salt_100g</th>
      <th class="col_heading level0 col11" >sodium_100g</th>
      <th class="col_heading level0 col12" >nutrition-score-fr_100g</th>
      <th class="col_heading level0 col13" >nutrition-score-uk_100g</th>
      <th class="col_heading level0 col14" >fruits-vegetables-nuts_100g</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th id="T_dc17b_level0_row0" class="row_heading level0 row0" >additives_n</th>
      <td id="T_dc17b_row0_col0" class="data row0 col0" >nan</td>
      <td id="T_dc17b_row0_col1" class="data row0 col1" >nan</td>
      <td id="T_dc17b_row0_col2" class="data row0 col2" >nan</td>
      <td id="T_dc17b_row0_col3" class="data row0 col3" >nan</td>
      <td id="T_dc17b_row0_col4" class="data row0 col4" >nan</td>
      <td id="T_dc17b_row0_col5" class="data row0 col5" >nan</td>
      <td id="T_dc17b_row0_col6" class="data row0 col6" >nan</td>
      <td id="T_dc17b_row0_col7" class="data row0 col7" >nan</td>
      <td id="T_dc17b_row0_col8" class="data row0 col8" >nan</td>
      <td id="T_dc17b_row0_col9" class="data row0 col9" >nan</td>
      <td id="T_dc17b_row0_col10" class="data row0 col10" >nan</td>
      <td id="T_dc17b_row0_col11" class="data row0 col11" >nan</td>
      <td id="T_dc17b_row0_col12" class="data row0 col12" >nan</td>
      <td id="T_dc17b_row0_col13" class="data row0 col13" >nan</td>
      <td id="T_dc17b_row0_col14" class="data row0 col14" >nan</td>
    </tr>
    <tr>
      <th id="T_dc17b_level0_row1" class="row_heading level0 row1" >ingredients_from_palm_oil_n</th>
      <td id="T_dc17b_row1_col0" class="data row1 col0" >0.120900</td>
      <td id="T_dc17b_row1_col1" class="data row1 col1" >nan</td>
      <td id="T_dc17b_row1_col2" class="data row1 col2" >nan</td>
      <td id="T_dc17b_row1_col3" class="data row1 col3" >nan</td>
      <td id="T_dc17b_row1_col4" class="data row1 col4" >nan</td>
      <td id="T_dc17b_row1_col5" class="data row1 col5" >nan</td>
      <td id="T_dc17b_row1_col6" class="data row1 col6" >nan</td>
      <td id="T_dc17b_row1_col7" class="data row1 col7" >nan</td>
      <td id="T_dc17b_row1_col8" class="data row1 col8" >nan</td>
      <td id="T_dc17b_row1_col9" class="data row1 col9" >nan</td>
      <td id="T_dc17b_row1_col10" class="data row1 col10" >nan</td>
      <td id="T_dc17b_row1_col11" class="data row1 col11" >nan</td>
      <td id="T_dc17b_row1_col12" class="data row1 col12" >nan</td>
      <td id="T_dc17b_row1_col13" class="data row1 col13" >nan</td>
      <td id="T_dc17b_row1_col14" class="data row1 col14" >nan</td>
    </tr>
    <tr>
      <th id="T_dc17b_level0_row2" class="row_heading level0 row2" >ingredients_that_may_be_from_palm_oil_n</th>
      <td id="T_dc17b_row2_col0" class="data row2 col0" >0.288444</td>
      <td id="T_dc17b_row2_col1" class="data row2 col1" >0.184633</td>
      <td id="T_dc17b_row2_col2" class="data row2 col2" >nan</td>
      <td id="T_dc17b_row2_col3" class="data row2 col3" >nan</td>
      <td id="T_dc17b_row2_col4" class="data row2 col4" >nan</td>
      <td id="T_dc17b_row2_col5" class="data row2 col5" >nan</td>
      <td id="T_dc17b_row2_col6" class="data row2 col6" >nan</td>
      <td id="T_dc17b_row2_col7" class="data row2 col7" >nan</td>
      <td id="T_dc17b_row2_col8" class="data row2 col8" >nan</td>
      <td id="T_dc17b_row2_col9" class="data row2 col9" >nan</td>
      <td id="T_dc17b_row2_col10" class="data row2 col10" >nan</td>
      <td id="T_dc17b_row2_col11" class="data row2 col11" >nan</td>
      <td id="T_dc17b_row2_col12" class="data row2 col12" >nan</td>
      <td id="T_dc17b_row2_col13" class="data row2 col13" >nan</td>
      <td id="T_dc17b_row2_col14" class="data row2 col14" >nan</td>
    </tr>
    <tr>
      <th id="T_dc17b_level0_row3" class="row_heading level0 row3" >energy_100g</th>
      <td id="T_dc17b_row3_col0" class="data row3 col0" >0.039412</td>
      <td id="T_dc17b_row3_col1" class="data row3 col1" >0.098584</td>
      <td id="T_dc17b_row3_col2" class="data row3 col2" >0.031941</td>
      <td id="T_dc17b_row3_col3" class="data row3 col3" >nan</td>
      <td id="T_dc17b_row3_col4" class="data row3 col4" >nan</td>
      <td id="T_dc17b_row3_col5" class="data row3 col5" >nan</td>
      <td id="T_dc17b_row3_col6" class="data row3 col6" >nan</td>
      <td id="T_dc17b_row3_col7" class="data row3 col7" >nan</td>
      <td id="T_dc17b_row3_col8" class="data row3 col8" >nan</td>
      <td id="T_dc17b_row3_col9" class="data row3 col9" >nan</td>
      <td id="T_dc17b_row3_col10" class="data row3 col10" >nan</td>
      <td id="T_dc17b_row3_col11" class="data row3 col11" >nan</td>
      <td id="T_dc17b_row3_col12" class="data row3 col12" >nan</td>
      <td id="T_dc17b_row3_col13" class="data row3 col13" >nan</td>
      <td id="T_dc17b_row3_col14" class="data row3 col14" >nan</td>
    </tr>
    <tr>
      <th id="T_dc17b_level0_row4" class="row_heading level0 row4" >fat_100g</th>
      <td id="T_dc17b_row4_col0" class="data row4 col0" >-0.078317</td>
      <td id="T_dc17b_row4_col1" class="data row4 col1" >0.063591</td>
      <td id="T_dc17b_row4_col2" class="data row4 col2" >0.025512</td>
      <td id="T_dc17b_row4_col3" class="data row4 col3" >0.802379</td>
      <td id="T_dc17b_row4_col4" class="data row4 col4" >nan</td>
      <td id="T_dc17b_row4_col5" class="data row4 col5" >nan</td>
      <td id="T_dc17b_row4_col6" class="data row4 col6" >nan</td>
      <td id="T_dc17b_row4_col7" class="data row4 col7" >nan</td>
      <td id="T_dc17b_row4_col8" class="data row4 col8" >nan</td>
      <td id="T_dc17b_row4_col9" class="data row4 col9" >nan</td>
      <td id="T_dc17b_row4_col10" class="data row4 col10" >nan</td>
      <td id="T_dc17b_row4_col11" class="data row4 col11" >nan</td>
      <td id="T_dc17b_row4_col12" class="data row4 col12" >nan</td>
      <td id="T_dc17b_row4_col13" class="data row4 col13" >nan</td>
      <td id="T_dc17b_row4_col14" class="data row4 col14" >nan</td>
    </tr>
    <tr>
      <th id="T_dc17b_level0_row5" class="row_heading level0 row5" >saturated-fat_100g</th>
      <td id="T_dc17b_row5_col0" class="data row5 col0" >-0.061414</td>
      <td id="T_dc17b_row5_col1" class="data row5 col1" >0.084041</td>
      <td id="T_dc17b_row5_col2" class="data row5 col2" >0.030113</td>
      <td id="T_dc17b_row5_col3" class="data row5 col3" >0.507905</td>
      <td id="T_dc17b_row5_col4" class="data row5 col4" >0.636419</td>
      <td id="T_dc17b_row5_col5" class="data row5 col5" >nan</td>
      <td id="T_dc17b_row5_col6" class="data row5 col6" >nan</td>
      <td id="T_dc17b_row5_col7" class="data row5 col7" >nan</td>
      <td id="T_dc17b_row5_col8" class="data row5 col8" >nan</td>
      <td id="T_dc17b_row5_col9" class="data row5 col9" >nan</td>
      <td id="T_dc17b_row5_col10" class="data row5 col10" >nan</td>
      <td id="T_dc17b_row5_col11" class="data row5 col11" >nan</td>
      <td id="T_dc17b_row5_col12" class="data row5 col12" >nan</td>
      <td id="T_dc17b_row5_col13" class="data row5 col13" >nan</td>
      <td id="T_dc17b_row5_col14" class="data row5 col14" >nan</td>
    </tr>
    <tr>
      <th id="T_dc17b_level0_row6" class="row_heading level0 row6" >carbohydrates_100g</th>
      <td id="T_dc17b_row6_col0" class="data row6 col0" >0.200227</td>
      <td id="T_dc17b_row6_col1" class="data row6 col1" >0.083950</td>
      <td id="T_dc17b_row6_col2" class="data row6 col2" >0.030712</td>
      <td id="T_dc17b_row6_col3" class="data row6 col3" >0.540972</td>
      <td id="T_dc17b_row6_col4" class="data row6 col4" >-0.042021</td>
      <td id="T_dc17b_row6_col5" class="data row6 col5" >-0.047544</td>
      <td id="T_dc17b_row6_col6" class="data row6 col6" >nan</td>
      <td id="T_dc17b_row6_col7" class="data row6 col7" >nan</td>
      <td id="T_dc17b_row6_col8" class="data row6 col8" >nan</td>
      <td id="T_dc17b_row6_col9" class="data row6 col9" >nan</td>
      <td id="T_dc17b_row6_col10" class="data row6 col10" >nan</td>
      <td id="T_dc17b_row6_col11" class="data row6 col11" >nan</td>
      <td id="T_dc17b_row6_col12" class="data row6 col12" >nan</td>
      <td id="T_dc17b_row6_col13" class="data row6 col13" >nan</td>
      <td id="T_dc17b_row6_col14" class="data row6 col14" >nan</td>
    </tr>
    <tr>
      <th id="T_dc17b_level0_row7" class="row_heading level0 row7" >sugars_100g</th>
      <td id="T_dc17b_row7_col0" class="data row7 col0" >0.146411</td>
      <td id="T_dc17b_row7_col1" class="data row7 col1" >0.058287</td>
      <td id="T_dc17b_row7_col2" class="data row7 col2" >0.005414</td>
      <td id="T_dc17b_row7_col3" class="data row7 col3" >0.274477</td>
      <td id="T_dc17b_row7_col4" class="data row7 col4" >-0.063760</td>
      <td id="T_dc17b_row7_col5" class="data row7 col5" >0.063558</td>
      <td id="T_dc17b_row7_col6" class="data row7 col6" >0.617330</td>
      <td id="T_dc17b_row7_col7" class="data row7 col7" >nan</td>
      <td id="T_dc17b_row7_col8" class="data row7 col8" >nan</td>
      <td id="T_dc17b_row7_col9" class="data row7 col9" >nan</td>
      <td id="T_dc17b_row7_col10" class="data row7 col10" >nan</td>
      <td id="T_dc17b_row7_col11" class="data row7 col11" >nan</td>
      <td id="T_dc17b_row7_col12" class="data row7 col12" >nan</td>
      <td id="T_dc17b_row7_col13" class="data row7 col13" >nan</td>
      <td id="T_dc17b_row7_col14" class="data row7 col14" >nan</td>
    </tr>
    <tr>
      <th id="T_dc17b_level0_row8" class="row_heading level0 row8" >fiber_100g</th>
      <td id="T_dc17b_row8_col0" class="data row8 col0" >-0.115047</td>
      <td id="T_dc17b_row8_col1" class="data row8 col1" >-0.001547</td>
      <td id="T_dc17b_row8_col2" class="data row8 col2" >-0.035574</td>
      <td id="T_dc17b_row8_col3" class="data row8 col3" >0.249919</td>
      <td id="T_dc17b_row8_col4" class="data row8 col4" >0.095830</td>
      <td id="T_dc17b_row8_col5" class="data row8 col5" >0.004550</td>
      <td id="T_dc17b_row8_col6" class="data row8 col6" >0.230889</td>
      <td id="T_dc17b_row8_col7" class="data row8 col7" >-0.017901</td>
      <td id="T_dc17b_row8_col8" class="data row8 col8" >nan</td>
      <td id="T_dc17b_row8_col9" class="data row8 col9" >nan</td>
      <td id="T_dc17b_row8_col10" class="data row8 col10" >nan</td>
      <td id="T_dc17b_row8_col11" class="data row8 col11" >nan</td>
      <td id="T_dc17b_row8_col12" class="data row8 col12" >nan</td>
      <td id="T_dc17b_row8_col13" class="data row8 col13" >nan</td>
      <td id="T_dc17b_row8_col14" class="data row8 col14" >nan</td>
    </tr>
    <tr>
      <th id="T_dc17b_level0_row9" class="row_heading level0 row9" >proteins_100g</th>
      <td id="T_dc17b_row9_col0" class="data row9 col0" >-0.101381</td>
      <td id="T_dc17b_row9_col1" class="data row9 col1" >-0.007868</td>
      <td id="T_dc17b_row9_col2" class="data row9 col2" >-0.038991</td>
      <td id="T_dc17b_row9_col3" class="data row9 col3" >0.277584</td>
      <td id="T_dc17b_row9_col4" class="data row9 col4" >0.213393</td>
      <td id="T_dc17b_row9_col5" class="data row9 col5" >0.194014</td>
      <td id="T_dc17b_row9_col6" class="data row9 col6" >-0.093323</td>
      <td id="T_dc17b_row9_col7" class="data row9 col7" >-0.238110</td>
      <td id="T_dc17b_row9_col8" class="data row9 col8" >0.231642</td>
      <td id="T_dc17b_row9_col9" class="data row9 col9" >nan</td>
      <td id="T_dc17b_row9_col10" class="data row9 col10" >nan</td>
      <td id="T_dc17b_row9_col11" class="data row9 col11" >nan</td>
      <td id="T_dc17b_row9_col12" class="data row9 col12" >nan</td>
      <td id="T_dc17b_row9_col13" class="data row9 col13" >nan</td>
      <td id="T_dc17b_row9_col14" class="data row9 col14" >nan</td>
    </tr>
    <tr>
      <th id="T_dc17b_level0_row10" class="row_heading level0 row10" >salt_100g</th>
      <td id="T_dc17b_row10_col0" class="data row10 col0" >-0.003864</td>
      <td id="T_dc17b_row10_col1" class="data row10 col1" >-0.005207</td>
      <td id="T_dc17b_row10_col2" class="data row10 col2" >-0.016555</td>
      <td id="T_dc17b_row10_col3" class="data row10 col3" >-0.077246</td>
      <td id="T_dc17b_row10_col4" class="data row10 col4" >-0.046840</td>
      <td id="T_dc17b_row10_col5" class="data row10 col5" >-0.039982</td>
      <td id="T_dc17b_row10_col6" class="data row10 col6" >-0.067531</td>
      <td id="T_dc17b_row10_col7" class="data row10 col7" >-0.091756</td>
      <td id="T_dc17b_row10_col8" class="data row10 col8" >-0.032159</td>
      <td id="T_dc17b_row10_col9" class="data row10 col9" >-0.001990</td>
      <td id="T_dc17b_row10_col10" class="data row10 col10" >nan</td>
      <td id="T_dc17b_row10_col11" class="data row10 col11" >nan</td>
      <td id="T_dc17b_row10_col12" class="data row10 col12" >nan</td>
      <td id="T_dc17b_row10_col13" class="data row10 col13" >nan</td>
      <td id="T_dc17b_row10_col14" class="data row10 col14" >nan</td>
    </tr>
    <tr>
      <th id="T_dc17b_level0_row11" class="row_heading level0 row11" >sodium_100g</th>
      <td id="T_dc17b_row11_col0" class="data row11 col0" >-0.003864</td>
      <td id="T_dc17b_row11_col1" class="data row11 col1" >-0.005207</td>
      <td id="T_dc17b_row11_col2" class="data row11 col2" >-0.016555</td>
      <td id="T_dc17b_row11_col3" class="data row11 col3" >-0.077246</td>
      <td id="T_dc17b_row11_col4" class="data row11 col4" >-0.046840</td>
      <td id="T_dc17b_row11_col5" class="data row11 col5" >-0.039983</td>
      <td id="T_dc17b_row11_col6" class="data row11 col6" >-0.067532</td>
      <td id="T_dc17b_row11_col7" class="data row11 col7" >-0.091756</td>
      <td id="T_dc17b_row11_col8" class="data row11 col8" >-0.032159</td>
      <td id="T_dc17b_row11_col9" class="data row11 col9" >-0.001990</td>
      <td id="T_dc17b_row11_col10" class="data row11 col10" >1.000000</td>
      <td id="T_dc17b_row11_col11" class="data row11 col11" >nan</td>
      <td id="T_dc17b_row11_col12" class="data row11 col12" >nan</td>
      <td id="T_dc17b_row11_col13" class="data row11 col13" >nan</td>
      <td id="T_dc17b_row11_col14" class="data row11 col14" >nan</td>
    </tr>
    <tr>
      <th id="T_dc17b_level0_row12" class="row_heading level0 row12" >nutrition-score-fr_100g</th>
      <td id="T_dc17b_row12_col0" class="data row12 col0" >0.152258</td>
      <td id="T_dc17b_row12_col1" class="data row12 col1" >0.111722</td>
      <td id="T_dc17b_row12_col2" class="data row12 col2" >0.055395</td>
      <td id="T_dc17b_row12_col3" class="data row12 col3" >0.563106</td>
      <td id="T_dc17b_row12_col4" class="data row12 col4" >0.533356</td>
      <td id="T_dc17b_row12_col5" class="data row12 col5" >0.632214</td>
      <td id="T_dc17b_row12_col6" class="data row12 col6" >0.234830</td>
      <td id="T_dc17b_row12_col7" class="data row12 col7" >0.467773</td>
      <td id="T_dc17b_row12_col8" class="data row12 col8" >-0.161741</td>
      <td id="T_dc17b_row12_col9" class="data row12 col9" >0.108323</td>
      <td id="T_dc17b_row12_col10" class="data row12 col10" >0.126733</td>
      <td id="T_dc17b_row12_col11" class="data row12 col11" >0.126734</td>
      <td id="T_dc17b_row12_col12" class="data row12 col12" >nan</td>
      <td id="T_dc17b_row12_col13" class="data row12 col13" >nan</td>
      <td id="T_dc17b_row12_col14" class="data row12 col14" >nan</td>
    </tr>
    <tr>
      <th id="T_dc17b_level0_row13" class="row_heading level0 row13" >nutrition-score-uk_100g</th>
      <td id="T_dc17b_row13_col0" class="data row13 col0" >0.150110</td>
      <td id="T_dc17b_row13_col1" class="data row13 col1" >0.114145</td>
      <td id="T_dc17b_row13_col2" class="data row13 col2" >0.056638</td>
      <td id="T_dc17b_row13_col3" class="data row13 col3" >0.585692</td>
      <td id="T_dc17b_row13_col4" class="data row13 col4" >0.557287</td>
      <td id="T_dc17b_row13_col5" class="data row13 col5" >0.649291</td>
      <td id="T_dc17b_row13_col6" class="data row13 col6" >0.235674</td>
      <td id="T_dc17b_row13_col7" class="data row13 col7" >0.457226</td>
      <td id="T_dc17b_row13_col8" class="data row13 col8" >-0.155272</td>
      <td id="T_dc17b_row13_col9" class="data row13 col9" >0.131695</td>
      <td id="T_dc17b_row13_col10" class="data row13 col10" >0.130602</td>
      <td id="T_dc17b_row13_col11" class="data row13 col11" >0.130602</td>
      <td id="T_dc17b_row13_col12" class="data row13 col12" >0.986087</td>
      <td id="T_dc17b_row13_col13" class="data row13 col13" >nan</td>
      <td id="T_dc17b_row13_col14" class="data row13 col14" >nan</td>
    </tr>
    <tr>
      <th id="T_dc17b_level0_row14" class="row_heading level0 row14" >fruits-vegetables-nuts_100g</th>
      <td id="T_dc17b_row14_col0" class="data row14 col0" >-0.013594</td>
      <td id="T_dc17b_row14_col1" class="data row14 col1" >-0.006479</td>
      <td id="T_dc17b_row14_col2" class="data row14 col2" >-0.001290</td>
      <td id="T_dc17b_row14_col3" class="data row14 col3" >-0.051571</td>
      <td id="T_dc17b_row14_col4" class="data row14 col4" >-0.039096</td>
      <td id="T_dc17b_row14_col5" class="data row14 col5" >-0.037375</td>
      <td id="T_dc17b_row14_col6" class="data row14 col6" >-0.021815</td>
      <td id="T_dc17b_row14_col7" class="data row14 col7" >0.016174</td>
      <td id="T_dc17b_row14_col8" class="data row14 col8" >-0.015843</td>
      <td id="T_dc17b_row14_col9" class="data row14 col9" >-0.047305</td>
      <td id="T_dc17b_row14_col10" class="data row14 col10" >-0.015122</td>
      <td id="T_dc17b_row14_col11" class="data row14 col11" >-0.015122</td>
      <td id="T_dc17b_row14_col12" class="data row14 col12" >-0.041717</td>
      <td id="T_dc17b_row14_col13" class="data row14 col13" >-0.058165</td>
      <td id="T_dc17b_row14_col14" class="data row14 col14" >nan</td>
    </tr>
  </tbody>
</table>





```python
st.pearsonr(df_selected.fat_100g, df_selected.energy_100g)[0] # coefficient de correlation lineere
np.cov(df_selected.fat_100g, df_selected.energy_100g, ddof=0) # matrice de covariance 
```

    0.8023789000889111

    array([[2.91999772e+02, 1.15335422e+04],
           [1.15335422e+04, 7.07593613e+05]])


## Between 1 quantitative variable and 1 qualitative variable (ANOVA)


```python
data = get_pandas_catVar_numVar(df_selected, catVar = 'product_name_top10', numVar = 'fat_100g')

# Propriétés graphiques (pas très importantes)    
medianprops = {'color':"black"}
meanprops = {'marker':'o', 'markeredgecolor':'black',
            'markerfacecolor':'firebrick'}

plt.figure(figsize=(20,8));
b = sns.boxplot(x="variable", y="value", data=pd.melt(data), showfliers = False,  showmeans=True, medianprops=medianprops, meanprops=meanprops);
plt.title('Top 10: product_name / fat_100g', fontsize=20);
plt.xlabel('Variable values', fontsize=15);
plt.ylabel('Values', fontsize=15);
plt.show();
```


{% include figure image_path="/assets/img_portfolio/sante_public/output_62_0.png" alt="this is a placeholder image" caption="Figure 4: Correlation between 1 quantitative and 1 qualitative variables. (product_name / fat_100g)" %}

    


By analyzing Figure 4 we can say:

- The fat is different from one product to other. 
- For instance, the fat for Potato chips, Cookies, and Popcorn is more considerable and more dispersed than those of salsa, and pinto beans.
- The product that contains the biggest fat is Extra Virgin Olive Oil which is logical.

We shall say here that according to our application, some of these products could be omitted by our users. For example, if we want to eat cookies that have less than 30 fat, that means not all cookies are permitted, and those will not be selected.


```python
data = get_pandas_catVar_numVar(df_selected, catVar = 'product_name_top10', numVar = 'energy_100g')

# Propriétés graphiques (pas très importantes)    
medianprops = {'color':"black"}
meanprops = {'marker':'o', 'markeredgecolor':'black',
            'markerfacecolor':'firebrick'}

plt.figure(figsize=(20,8));
b = sns.boxplot(x="variable", y="value", data=pd.melt(data), showfliers = False);
plt.title('Top 10: product_name / energy_100g', fontsize=20);
plt.xlabel('Variable values', fontsize=15);
plt.ylabel('Values', fontsize=15);
plt.show();
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_64_0.png" alt="this is a placeholder image" caption="Figure 5: Correlation between 1 quantitative and 1 qualitative variables (product_name / energy_100g)." %}

    


By analyzing Figure 5 we can say:

 - Somehow the energy is similar to the fat. The higher fat produces higher energy products. However, they are more dispersed on the energy variable than on the fat variable.
 - Having a standing profession high caloric products should be evited. For example, tacking cookies with preferred less kcal for persons with the sitting profession.


By analyzing the correlation of one quantitative and one qualitative variable we look for the eta squared coefficient. Suppose Y is a categorical variable and X is a numerical variable, we look at the correlation between these variables with eta_squared = Total_variance/Inclass_variance. If eta_squared = 0, it means that the class averages are all equal. There is therefore no a priori relationship between the variables Y and X. On the contrary, if eta_squared = 1, this means that the averages per class are very different, and each class is made up of identical values: there is therefore a priori a relationship between the variables Y and X.


```python
eta_squared(df_selected, 'product_name_top10', 'energy_100g')
```

    0.015498074324149612

```python
eta_squared(df_selected, 'product_name_top10', 'fat_100g')
```

    0.029213633935751267


```python
eta_squared(df_selected[~df_selected.nutrition_grade_fr.isna()], 'nutrition_grade_fr', 'energy_100g')
```

    0.2982499803324311


```python
eta_squared(df_selected[~df_selected.nutrition_grade_fr.isna()], 'nutrition_grade_fr', 'fat_100g')
```

    0.2618975105793661

By computing, some of the eta squared we can say that the nutrition grade has a correlation with the fat and energy variables.

## Between two qualitatives variables

Let us pose a question. Do you have the same products in different states?

```python
X = "product_name_top10"
Y = "countries_fr_top5"

cont = df_selected[[X,Y]].pivot_table(index=X,columns=Y,aggfunc=len,margins=True,margins_name="Total")

plt.figure(figsize=(20,8));
sns.heatmap(cont, cmap="YlGnBu", annot=True, fmt='.1f')
plt.title('Top 10 produits dans top 5 états', fontsize=20);
plt.xlabel('Top 5 états', fontsize=15);
plt.ylabel('Top 10 produits', fontsize=15);
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_75_0.png" alt="this is a placeholder image" caption="Figure 6: Correlation between 2 qualitative variables (top 10 products / top 5 states)." %}
    
By analyzing Figure 6 we can say that:
 - the top ten products are all observed in the US. 
 - France is the second country that has most of the observed products.

# Data Analysis

## Univariate analyse
### Densities of nutritional variables


```python
plot_density(df_selected, dt = DensityTypes.Boxplot) #dt = DensityTypes.Density
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_79_1.png" alt="this is a placeholder image" caption="Figure 7: Densities of nutritional variables. " %}

### Visualizing some of the top variables values 

```python
plt.figure(figsize=(15,8))
sns.barplot(x=df_selected.creator_top5.value_counts(), y=df_selected.creator_top5.value_counts().index, data=df_selected);
plt.title('Top 5 creators', fontsize=20);
plt.xlabel('# of creations', fontsize=15);
plt.ylabel('Creators', fontsize=15);
plt.show();
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_81_0.png" alt="this is a placeholder image" caption="Figure 8: Top 5 creators. " %}    


```python
plt.figure(figsize=(15,8))
sns.barplot(x=df_selected.product_name.value_counts().head(10), y=df_selected.product_name.value_counts().head(10).index, data=df_selected);
plt.title('Top 10 product_name', fontsize=20);
plt.xlabel('# of products', fontsize=15);
plt.ylabel('Product name', fontsize=15);
plt.show();
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_83_0.png" alt="this is a placeholder image" caption="Figure 9: Top 10 products. " %} 
    

```python
plt.figure(figsize=(15,8))
sns.barplot(x=df_selected.brands.value_counts().head(10), y=df_selected.brands.value_counts().head(10).index, data=df_selected);
plt.title('Top 10 brands', fontsize=20);
plt.xlabel('# of brands', fontsize=15);
plt.ylabel('Brands', fontsize=15);
plt.show();
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_85_0.png" alt="this is a placeholder image" caption="Figure 10: Top 10 brands. " %} 


```python
plt.figure(figsize=(15,8))
sns.barplot(x=df_selected.ingredients_text.value_counts().head(10), y=df_selected.ingredients_text.value_counts().head(10).index, data=df_selected);
plt.title('Top 10 ingredients_text', fontsize=20);
plt.xlabel('# of ingredients', fontsize=15);
plt.ylabel('Ingredients', fontsize=15);
plt.show();
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_87_0.png" alt="this is a placeholder image" caption="Figure 11: Top 10 ingredients. " %} 


```python
plt.figure(figsize=(15,8))
sns.barplot(x=df_selected.additives_tags.value_counts().head(10), y=df_selected.additives_tags.value_counts().head(10).index, data=df_selected);
plt.title('Top 10 additives', fontsize=20);
plt.xlabel('# of additives', fontsize=15);
plt.ylabel('Additives', fontsize=15);
plt.show();
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_89_0.png" alt="this is a placeholder image" caption="Figure 12: Top 10 additives. " %} 


```python
df1 =  df_selected.countries_fr.str.split(',', expand=True).melt(var_name='columns', value_name='values');
df2 = pd.crosstab(index=df1['values'], columns=df1['columns'], margins=True).All.drop('All').sort_values(ascending = False).head(10);
df2 = df2.to_frame();
#Using reset_index, inplace=True
df2.reset_index(inplace=True);

plt.figure(figsize=(15,8));
sns.barplot(y='values', x='All', data=df2);
plt.title('Top 10 countries', fontsize=20);
plt.xlabel('count', fontsize=15);
plt.ylabel('Countries', fontsize=15);
plt.show();

del df1, df2;
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_91_0.png" alt="this is a placeholder image" caption="Figure 13: Top 10 countries. " %} 

```python
plot_words(df, 'countries_fr')
```
    
{% include figure image_path="/assets/img_portfolio/sante_public/output_92_0.png" alt="this is a placeholder image" caption=" " %} 


### Distribution of `nutriscore_grade`


```python
plt.figure(figsize=(15,8))
df_selected.nutrition_grade_fr.value_counts().plot.pie(autopct="%.1f%%");
plt.title('Nutriscore grade', fontsize=20);
plt.ylabel('');
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_94_0.png" alt="this is a placeholder image" caption="Figure 14: `nutriscore_grade` distribution. " %} 
    
    


## Multivariate analysis


```python
cols = ['energy_100g', 'fat_100g', 'saturated-fat_100g', 'carbohydrates_100g', 'sugars_100g', 
  'salt_100g', 'nutrition_grade_fr']
d = df_selected[(~df_selected['nutrition_grade_fr'].isna()) & (~df_selected['nutrition-score-fr_100g'].isna())][cols].sample(10000)

sns.pairplot(data=d, hue="nutrition_grade_fr", hue_order=['e','d','c','b','a'], 
             plot_kws = {'s': 10}, corner=True)
del d
```


{% include figure image_path="/assets/img_portfolio/sante_public/output_96_1.png" alt="this is a placeholder image" caption="Figure 15: Pairplot of our dataset. " %} 

    


Analyzing Figure 15 we can say:

The level of fats and that of saturated fats penalizes the nutriscore.  
Other nutrition compositions affect less the nutriscore. However, some effects can be observed. This difference can be due to the food categories.

Some foods are rich in caloric energy having a good nutrition grade:
 - A high nutrition grade of 'a' and 'b' with energy in the range of 1500 can be observed with fat smaller than 20
 - A high nutrition grade of 'a' and 'b' with energy in a range of 3000 can be observed with very less saturated fat that is less than 10. 
 - We observe foods rich in carbohydrates that have a good nutrition score having more than 2000 in energy.
 
These can be also seen in the following 3 figures.


```python
plt.figure(figsize=(15,8));
sns.scatterplot(data=df_selected, x="fat_100g", y="energy_100g", hue="nutrition_grade_fr", hue_order=['e','d','c','b','a'])
plt.title('Interaction of fat on energy', fontsize=20);
plt.xlabel('Fat', fontsize=15);
plt.ylabel('Energy', fontsize=15);
plt.show();
```


{% include figure image_path="/assets/img_portfolio/sante_public/output_98_0.png" alt="this is a placeholder image" caption="Figure 16: Scatterplot between fat_100g and energy_100g. " %}     
    

```python
plt.figure(figsize=(15,8));
sns.scatterplot(data=df_selected, x="saturated-fat_100g", y="energy_100g", hue="nutrition_grade_fr", hue_order=['e','d','c','b','a'])
plt.title('Interaction of saturated fat on energy', fontsize=20);
plt.xlabel('Saturated Fat', fontsize=15);
plt.ylabel('Energy', fontsize=15);
plt.show();
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_99_0.png" alt="this is a placeholder image" caption="Figure 17: Scatterplot between saturated-fat_100g and nutrition_grade_fr. " %}   
    

```python
plt.figure(figsize=(15,8));
sns.scatterplot(data=df_selected, x="carbohydrates_100g", y="energy_100g", hue="nutrition_grade_fr", hue_order=['e','d','c','b','a'])
plt.title('Interaction of carbohydrates on energy', fontsize=20);
plt.xlabel('Carbohydrates', fontsize=15);
plt.ylabel('Energy', fontsize=15);
plt.show();
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_100_0.png" alt="this is a placeholder image" caption="Figure 18: Scatterplot between carbohydrates_100g and energy_100g. " %}   



```python
plt.figure(figsize=(15,8));
sns.boxplot(x="nutrition_grade_fr", y="energy_100g", data=df_selected, showfliers = False, order = ['a', 'b', 'c', 'd', 'e'])
plt.title('Nutrition grade distributions/ Energy', fontsize=20);
plt.xlabel('Nutrition grade', fontsize=15);
plt.ylabel('Energy', fontsize=15);
plt.show();
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_102_0.png" alt="this is a placeholder image" caption="Figure 19: `nutrition_grade_fr` distributions over the `energy_100g` variable " %} 
    
    



```python
plt.figure(figsize=(15,8));
sns.boxplot(x="nutrition_grade_fr", y="fat_100g", data=df_selected, showfliers = False, order = ['a', 'b', 'c', 'd', 'e'])
plt.title('Nutrition grade distributions/ fat_100g', fontsize=20);
plt.xlabel('Nutrition grade', fontsize=15);
plt.ylabel('Fat', fontsize=15);
plt.show();
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_103_0.png" alt="this is a placeholder image" caption="Figure 19: `nutrition_grade_fr` distributions over the `fat_100g` variable " %} 
    


Note that foods with different `nutrition_grade_fr` can have relatively equal high energies. But preferring good foods (with `nutrition_grade_fr` 'a' and 'b') we are likely to eat foods with less energy. The same thing we observe in fat foods, where preferring better foods (with a better nutrition score) we shall choose not fat foods.

### Add `my_category` variable


```python
plot_words(df_selected, 'pnns_groups_2')
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_106_0.png" alt="this is a placeholder image"  %} 

    



```python
compute_words_freq(df_selected, 'pnns_groups_2', sep=',')
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Word</th>
      <th>Frequency</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>unknown</td>
      <td>12835</td>
    </tr>
    <tr>
      <th>1</th>
      <td>one-dish meals</td>
      <td>4927</td>
    </tr>
    <tr>
      <th>2</th>
      <td>biscuits and cakes</td>
      <td>4018</td>
    </tr>
    <tr>
      <th>3</th>
      <td>cereals</td>
      <td>3701</td>
    </tr>
    <tr>
      <th>4</th>
      <td>sweets</td>
      <td>3587</td>
    </tr>
    <tr>
      <th>5</th>
      <td>cheese</td>
      <td>3516</td>
    </tr>
    <tr>
      <th>6</th>
      <td>milk and yogurt</td>
      <td>2914</td>
    </tr>
    <tr>
      <th>7</th>
      <td>dressings and sauces</td>
      <td>2785</td>
    </tr>
    <tr>
      <th>8</th>
      <td>chocolate products</td>
      <td>2648</td>
    </tr>
    <tr>
      <th>9</th>
      <td>vegetables</td>
      <td>2585</td>
    </tr>
    <tr>
      <th>10</th>
      <td>processed meat</td>
      <td>2548</td>
    </tr>
    <tr>
      <th>11</th>
      <td>non-sugared beverages</td>
      <td>2242</td>
    </tr>
    <tr>
      <th>12</th>
      <td>fish and seafood</td>
      <td>2052</td>
    </tr>
    <tr>
      <th>13</th>
      <td>sweetened beverages</td>
      <td>1952</td>
    </tr>
    <tr>
      <th>14</th>
      <td>appetizers</td>
      <td>1880</td>
    </tr>
    <tr>
      <th>15</th>
      <td>fruit juices</td>
      <td>1729</td>
    </tr>
    <tr>
      <th>16</th>
      <td>bread</td>
      <td>1590</td>
    </tr>
    <tr>
      <th>17</th>
      <td>fats</td>
      <td>1342</td>
    </tr>
    <tr>
      <th>18</th>
      <td>breakfast cereals</td>
      <td>1310</td>
    </tr>
    <tr>
      <th>19</th>
      <td>fruits</td>
      <td>1297</td>
    </tr>
    <tr>
      <th>20</th>
      <td>meat</td>
      <td>1150</td>
    </tr>
    <tr>
      <th>21</th>
      <td>legumes</td>
      <td>754</td>
    </tr>
    <tr>
      <th>22</th>
      <td>dairy desserts</td>
      <td>726</td>
    </tr>
    <tr>
      <th>23</th>
      <td>ice cream</td>
      <td>647</td>
    </tr>
    <tr>
      <th>24</th>
      <td>sandwich</td>
      <td>640</td>
    </tr>
    <tr>
      <th>25</th>
      <td>nuts</td>
      <td>565</td>
    </tr>
    <tr>
      <th>26</th>
      <td>pizza pies and quiche</td>
      <td>464</td>
    </tr>
    <tr>
      <th>27</th>
      <td>soups</td>
      <td>463</td>
    </tr>
    <tr>
      <th>28</th>
      <td>dried fruits</td>
      <td>410</td>
    </tr>
    <tr>
      <th>29</th>
      <td>pastries</td>
      <td>403</td>
    </tr>
    <tr>
      <th>30</th>
      <td>fruit nectars</td>
      <td>342</td>
    </tr>
    <tr>
      <th>31</th>
      <td>artificially sweetened beverages</td>
      <td>255</td>
    </tr>
    <tr>
      <th>32</th>
      <td>eggs</td>
      <td>186</td>
    </tr>
    <tr>
      <th>33</th>
      <td>alcoholic beverages</td>
      <td>155</td>
    </tr>
    <tr>
      <th>34</th>
      <td>potatoes</td>
      <td>96</td>
    </tr>
    <tr>
      <th>35</th>
      <td>tripe dishes</td>
      <td>49</td>
    </tr>
    <tr>
      <th>36</th>
      <td>salty and fatty products</td>
      <td>19</td>
    </tr>
  </tbody>
</table>
</div>




```python
categories ={
    'cheese' : ['cheese'],
    'appetizer' : ['appetizers', 'nuts', 'salty and fatty products', 'dressings and sauces'],
    'melange': ['soups', 'sandwich', 'pizza pies and quiche'],
    'juice' : ['fruit juices', 'fruit nectars'],
    'plants' : ['legumes', 'legume', 'fruits', 'Fruit', 'vegetables', 'dried fruits'],
    'sweet' : ['sweets', 'biscuits and cakes', 'chocolate products', 'dairy desserts'],
    'feculent' : ['cereals', 'bread', 'pastries', 'potatoes', 'breakfast cereals' ],
    'beverage' : ['non-sugared beverages', 'artificially sweetened beverages', 'alcoholic beverages', 'sweetened beverages'],
    'meat_fish' : ['tripe dishes', 'meat','fish and seafood', 'processed meat', 'eggs'],
    'fats' : ['fats'],
    'milk' : ['milk and yogurt', 'ice cream'],
}

def replace(df, col, key, val):
    m = [v == key for v in df[col]]
    df.loc[m, col] = val
    return df
    
df_selected2 = df_selected[~df_selected.pnns_groups_2.isna()]
```


```python
plot_data(df_selected2)
```


{% include figure image_path="/assets/img_portfolio/sante_public/output_111_0.png" alt="this is a placeholder image" caption="Figure 21. Plotting selected data." %} 
    
    



```python
df_selected2['my_categoty'] = df_selected2['pnns_groups_2'].str.lower();
for new_value, old_value in categories.items():
    #print(old_value)
    df_selected['my_categoty'] = df_selected['my_categoty'].replace(old_value, new_value);
    #df_selected2['my_categoty'] = df_selected2['my_categoty'].replace(['appetizers', 'nuts', 'salty and fatty products', 'dressings and sauces'], 'appetizer');
    
plot_words(df_selected, 'my_categoty')
```



{% include figure image_path="/assets/img_portfolio/sante_public/output_113_0.png" alt="this is a placeholder image" caption="Figure 22." %}     

   

```python
compute_words_freq(df_selected, 'my_categoty')
```


<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Word</th>
      <th>Frequency</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>unknown</td>
      <td>12835</td>
    </tr>
    <tr>
      <th>1</th>
      <td>sweet</td>
      <td>10979</td>
    </tr>
    <tr>
      <th>2</th>
      <td>feculent</td>
      <td>7100</td>
    </tr>
    <tr>
      <th>3</th>
      <td>meat_fish</td>
      <td>5985</td>
    </tr>
    <tr>
      <th>4</th>
      <td>appetizer</td>
      <td>5249</td>
    </tr>
    <tr>
      <th>5</th>
      <td>plants</td>
      <td>5046</td>
    </tr>
    <tr>
      <th>6</th>
      <td>onedish</td>
      <td>4927</td>
    </tr>
    <tr>
      <th>7</th>
      <td>meals</td>
      <td>4927</td>
    </tr>
    <tr>
      <th>8</th>
      <td>beverage</td>
      <td>4604</td>
    </tr>
    <tr>
      <th>9</th>
      <td>milk</td>
      <td>3561</td>
    </tr>
    <tr>
      <th>10</th>
      <td>cheese</td>
      <td>3516</td>
    </tr>
    <tr>
      <th>11</th>
      <td>juice</td>
      <td>2071</td>
    </tr>
    <tr>
      <th>12</th>
      <td>melange</td>
      <td>1567</td>
    </tr>
    <tr>
      <th>13</th>
      <td>fats</td>
      <td>1342</td>
    </tr>
  </tbody>
</table>
</div>


```python
plt.figure(figsize=(15,8));
sns.boxplot(x="nutrition_grade_fr", y="energy_100g", data=df_selected[(df_selected.my_categoty == 'plants') | (df_selected.my_categoty == 'meat_fish')], showfliers = False, order = ['a', 'b', 'c', 'd', 'e'], hue =  'my_categoty')
plt.title('Nutrition grade distributions/ energy_100g', fontsize=20);
plt.xlabel('Nutrition grade', fontsize=15);
plt.ylabel('Energy', fontsize=15);
plt.show();
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_116_0.png" alt="this is a placeholder image" caption="Figure 23. Nutrition grade distributions over energy categorized by plants and meat_fish foods
" %}  
    


```python
plt.figure(figsize=(15,8));
sns.boxplot(x="nutrition_grade_fr", y="energy_100g", data=df_selected[(df_selected.my_categoty == 'beverage') | (df_selected.my_categoty == 'milk')], showfliers = False, order = ['a', 'b', 'c', 'd', 'e'], hue =  'my_categoty')
plt.title('Nutrition grade distributions/ energy_100g', fontsize=20);
plt.xlabel('Nutrition grade', fontsize=15);
plt.ylabel('Energy', fontsize=15);
plt.show();
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_118_0.png" alt="this is a placeholder image" caption="Figure 24. Nutrition grade distributions over energy categorized by beverage and milk foods
" %}  
    
    


### Difference between nutriscores 

Let us now examine if there are some differences between `nutri-score-fr_100g` and `nutriscore-uk-100g`.

```python
from sklearn.linear_model import LinearRegression
mask = (~df_selected['nutrition-score-fr_100g'].isna()) & (~df_selected['nutrition-score-uk_100g'].isna())
x=df_selected[mask]['nutrition-score-fr_100g']
y=df_selected[mask]['nutrition-score-uk_100g']

plt.figure(figsize=(15,8));
sns.scatterplot(x, 
                y, 
                hue = df_selected['my_categoty'],
                legend='full',
                s=100);

plt.title('Nutri score UK vs FR', fontsize=20);
plt.xlabel('nutri score fr 100g', fontsize=15);
plt.ylabel('nutri score uk 100g', fontsize=15);


#linear regression
x = np.array(x).reshape(-1, 1);
y = np.array(y).reshape(-1, 1);

reg = LinearRegression();
model = reg.fit(x, y);
plt.plot(x, model.predict(x),color='k');
plt.show()

print('y=ax with a={}\n score : {}'.format(model.coef_[0], model.score(x, y)));
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_120_1.png" alt="this is a placeholder image" caption="Figure 25. Difference between `nutrition-score-fr` and `nutrition-score-uk`" %}  
    
     y=ax with a=[1.0000532]
     score : 0.9723672948764118


Nutriscore for the two countries are rather similar, a linear model between them is easily modeled. However, we see some differences in the computation of nutriscore for some categories of products:
 - beverage is considered with a smaller nutrition score
 - fats are considered with a higher nutrition score
 - cheese is considered with a higher nutrition score

### Energy for each category of foods?


```python
plt.figure(figsize=(15,8));
sns.boxplot(x="energy_100g", y="my_categoty", data=df_selected, orient = 'h', showfliers = False,);
plt.title('Calorics food', fontsize=20);
plt.xlabel('energy 100g', fontsize=15);
plt.ylabel('Categories', fontsize=15);
plt.show();
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_123_0.png" alt="this is a placeholder image" caption="Figure 26. how much energy do we have in each category of foods?" %}  


### Fat for each category of foods?


```python
plt.figure(figsize=(15,8));
sns.boxplot(x="fat_100g", y="my_categoty", data=df_selected, orient = 'h', showfliers = False,);
plt.title('Fat food', fontsize=20);
plt.xlabel('fat 100g', fontsize=15);
plt.ylabel('Categories', fontsize=15);
plt.show();
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_125_0.png" alt="this is a placeholder image" caption="Figure 26. how much fat do we have in each category of foods?" %}  

## Exploratory analysis with PCA 

PCA allows us to:
   - Analyse the variability between individuals, i.e. what are the differences and similarities between individuals.
   - Analyse links between variables: what are there groups of variables that are highly correlated with each other that can be grouped into new synthetic variables?


```python
# selection des colonnes à prendre en compte dans l'ACP
columns_acp = []
for c in list(df_selected.columns):
    if c.endswith('_100g'):
        columns_acp.append(c)
df_pca = df_selected[columns_acp]

plot_data(df_pca)
```

{% include figure image_path="/assets/img_portfolio/sante_public/output_129_0.png" alt="this is a placeholder image" caption="Figure 27. Selected data for PCA." %}  
    
    



```python
# Preparation des données
from sklearn.impute import SimpleImputer
imp = SimpleImputer(missing_values=np.nan, strategy='mean');
X = np.array(df_pca['nutrition-score-fr_100g']).reshape(-1, 1);
imp.fit(X);
df_pca['nutrition-score-fr_100g'] = imp.transform(X);

X = np.array(df_pca['nutrition-score-uk_100g']).reshape(-1, 1);
imp.fit(X);
df_pca['nutrition-score-uk_100g'] = imp.transform(X);
#del X
```

 

```python
X = df_pca.values
names = df_pca.index #["product_name"] # ou data.index pour avoir les intitulés
features = df_pca.columns

# Centrage et Réduction
std_scale = preprocessing.StandardScaler().fit(X)
X_scaled = std_scale.transform(X)
```


```python
# choix du nombre de composantes à calculer
n_comp = 6

# Calcul des composantes principales
pca = decomposition.PCA(n_components=n_comp)
pca.fit(X_scaled)

X_projected = pca.fit_transform(X_scaled)


X_projected = pd.DataFrame(X_projected, index = df_pca.index, columns = ['F{0}'.format(i) for i in range(n_comp)])

X_projected
```




    PCA(n_components=6)






<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>F0</th>
      <th>F1</th>
      <th>F2</th>
      <th>F3</th>
      <th>F4</th>
      <th>F5</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1</th>
      <td>2.969878</td>
      <td>-0.398472</td>
      <td>0.512247</td>
      <td>0.170433</td>
      <td>0.168039</td>
      <td>-1.250576</td>
    </tr>
    <tr>
      <th>2</th>
      <td>-0.119704</td>
      <td>-0.925610</td>
      <td>0.434700</td>
      <td>2.543939</td>
      <td>0.046679</td>
      <td>0.171516</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2.309261</td>
      <td>0.007418</td>
      <td>2.223656</td>
      <td>1.584307</td>
      <td>0.250097</td>
      <td>-0.581340</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0.002351</td>
      <td>-0.753928</td>
      <td>-0.451536</td>
      <td>1.405344</td>
      <td>-0.106914</td>
      <td>0.298048</td>
    </tr>
    <tr>
      <th>5</th>
      <td>0.858225</td>
      <td>-0.791237</td>
      <td>0.211521</td>
      <td>1.907893</td>
      <td>0.022654</td>
      <td>0.200782</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>320756</th>
      <td>0.157600</td>
      <td>0.036311</td>
      <td>0.451537</td>
      <td>-0.319817</td>
      <td>0.015153</td>
      <td>-1.009554</td>
    </tr>
    <tr>
      <th>320757</th>
      <td>-1.670609</td>
      <td>-0.420981</td>
      <td>1.782779</td>
      <td>1.898136</td>
      <td>-0.025061</td>
      <td>1.269749</td>
    </tr>
    <tr>
      <th>320763</th>
      <td>-2.339713</td>
      <td>-0.139322</td>
      <td>0.323233</td>
      <td>-0.883152</td>
      <td>-0.164451</td>
      <td>-0.445308</td>
    </tr>
    <tr>
      <th>320768</th>
      <td>-2.492881</td>
      <td>-0.161867</td>
      <td>0.332084</td>
      <td>-0.887011</td>
      <td>-0.164449</td>
      <td>-0.535805</td>
    </tr>
    <tr>
      <th>320771</th>
      <td>-1.512330</td>
      <td>0.099590</td>
      <td>0.084318</td>
      <td>-1.414149</td>
      <td>-0.217476</td>
      <td>-0.020945</td>
    </tr>
  </tbody>
</table>
<p>260767 rows × 6 columns</p>
</div>




```python
# Eboulis des valeurs propres
display_scree_plot(pca)

# Cercle des corrélations
pcs = pca.components_
display_circles(pcs, n_comp, pca, [(0,1),(2,3),(4,5)], labels = np.array(features))
```

Percentages of inertia, also known as the percentage of variance explained or proportion of variance, is a measure of the amount of variation in a dataset that is accounted for by a particular factor or component in a statistical analysis.

In multivariate statistical techniques such as principal component analysis (PCA), correspondence analysis, or factor analysis, percentages of inertia are used to assess the importance of each factor or component. The percentage of inertia is calculated as the proportion of the total variance of the dataset that is explained by a particular factor or component.

For example, in PCA, the first principal component accounts for the largest percentage of variance in the dataset, followed by the second principal component, and so on. The percentage of inertia for each principal component indicates how much of the variance in the dataset is accounted for by that component.

Percentages of inertia are useful in interpreting and visualizing the results of multivariate statistical analyses, as they provide a measure of the relative importance of each factor or component in explaining the variability in the data.


{% include figure image_path="/assets/img_portfolio/sante_public/output_133_0.png" alt="this is a placeholder image" caption="Figure 28. Percentages of inertia. " %} 
   

{% include figure image_path="/assets/img_portfolio/sante_public/output_133_1.png" alt="this is a placeholder image" caption="Figure 29. Correlation circle between F1 and F2. " %} 
    

{% include figure image_path="/assets/img_portfolio/sante_public/output_133_2.png" alt="this is a placeholder image" caption="Figure 30. Correlation circle between F3 and F4. " %} 


{% include figure image_path="/assets/img_portfolio/sante_public/output_133_3.png" alt="this is a placeholder image" caption="Figure 31. Correlation circle between F5 and F6. " %} 

    



```python
# Projection des individus
X_projected = pca.transform(X_scaled)
display_factorial_planes(X_projected, n_comp, pca, [(0,1),(2,3),(4,5)], alpha = 0.2)
```

<figure class="third">
	<img src="/assets/img_portfolio/sante_public/output_134_0.png">
	<img src="/assets/img_portfolio/sante_public/output_134_1.png">
	<img src="/assets/img_portfolio/sante_public/output_134_2.png">
	<figcaption>Figure 32. Projection of individuals.</figcaption>
</figure>
    


Realizing PCA with 6 composants capturing greater than 80% of the information. Studying the correlation between the initial variables with the obtained principal components we observe. To see that we project the flashes on the axes and obtain the correlation between variables. We can have negative and positive correlations.
 - The variable nutri-score-fr_100g, nutri-score-uk_100g, energy_100g is described by F1.
 - The variable sodium_100g is described by F2.
 - The variable sugars_100g is described by F3.
 - The variable fiber_100g is described by F4.
 - The variable fruits-vegetables-nuts_100g is described by F5.
 - The variable proteins_100g is described by F6.
 
We have also made a projection of individuals.

# K-means algorithm avec ACP


```python
cols = ['energy_100g', 'fat_100g', 'saturated-fat_100g',  'proteins_100g',  'nutrition_grade_fr', 
        'carbohydrates_100g']

df_selected_clustering = df_selected[cols]
df_selected_clustering = df_selected_clustering[~df_selected_clustering.nutrition_grade_fr.isna()]

clusters = df_selected_clustering['nutrition_grade_fr']
clusters = np.array(clusters.apply(lambda x: ord(x)-97)) # transformé en numeric
df_selected_clustering.drop('nutrition_grade_fr', inplace=True, axis=1)

features = df_selected_clustering.columns

# Centrage et Réduction
std_scale = preprocessing.StandardScaler().fit(df_selected_clustering)
df_selected_clustering = std_scale.transform(df_selected_clustering)


```


```python
n_comp = 2
# Calcul des composantes principales
pca = decomposition.PCA(n_components=n_comp)
pca.fit(df_selected_clustering)
X_projected = pca.fit_transform(df_selected_clustering)

X_projected# = pd.DataFrame(X_projected, index = df_pca.index, columns = ['F{0}'.format(i) for i in range(n_comp)])
```

    PCA(n_components=2)

    array([[ 3.03514692, -0.50058059],
           [ 1.08440559, -0.77137787],
           [ 3.12397384,  0.78626913],
           ...,
           [-0.88462164,  1.63264941],
           [-1.96665734,  0.54173836],
           [-2.02328748,  0.52906735]])



```python
# Eboulis des valeurs propres
display_scree_plot(pca)

# Cercle des corrélations
pcs = pca.components_
display_circles(pcs, n_comp, pca, [(0,1)], labels = np.array(features))
```

<figure class="half">
    <a href="/assets/img_portfolio/sante_public/output_139_0.png"><img src="/assets/img_portfolio/sante_public/output_139_0.png"></a>
    <a href="/assets/img_portfolio/sante_public/output_139_1.png"><img src="/assets/img_portfolio/sante_public/output_139_1.png"></a>
    <figcaption>Figure 33. Percentage of inertia and circle of correlation.</figcaption>
</figure>
    



```python
from sklearn.cluster import KMeans
from sklearn.metrics import accuracy_score
from sklearn import metrics

K = len(np.unique(clusters))
kmeans = KMeans(n_clusters=K).fit(X_projected)

metrics.rand_score(clusters, kmeans.labels_)
```




    0.6879621875475739



# Preparing and Saving dataset for application

Let us get the data from df_selected maintaining just the values foods category values.


```python
df_application = df_selected[~df_selected.my_categoty.isna()].drop(['ingredients_text', 'serving_size', 'additives_tags', 'pnns_groups_2', 'brands'], axis=1).reset_index()

df_application = df_application.drop('index', axis=1)

```



First, we will do a KNN Imputer to fill the `nutri_score fr/uk` where there are some missing values.


```python
from sklearn.impute import KNNImputer

cols = ['energy_100g', 'fat_100g', 'saturated-fat_100g',  'proteins_100g', 
        'carbohydrates_100g', 'nutrition-score-fr_100g', 'nutrition-score-uk_100g']

df_selected_knn = df_application[cols]

imputer = KNNImputer(n_neighbors=5)  # tell the imputer to consider only '#' as missing data
imputed_data = imputer.fit_transform(df_selected_knn)  # impute all '#'
df_selected_knn = pd.DataFrame(data=imputed_data, columns=cols)


df_application['nutrition-score-fr_100g'] = df_selected_knn['nutrition-score-fr_100g']
df_application['nutrition-score-uk_100g'] = df_selected_knn['nutrition-score-uk_100g']
```

Next we fill NaN for the `product_name` by inserting `unknown` as value.


```python
df_application.loc[df_application.product_name.isna(), 'product_name'] = 'unknown'
```

Let us discover the unique values for the category we have created.`

```python
df_application['my_categoty'].unique()
```

    array(['unknown', 'plants', 'sweet', 'melange', 'meat_fish', 'beverage',
           'appetizer', 'one-dish meals', 'feculent', 'milk', 'fats',
           'cheese', 'juice'], dtype=object)


```python
not_beverages = ((df_application['my_categoty']!='beverage') & (df_application['my_categoty']!='juice') & (df_application['my_categoty']!='milk'))
beverages = ~not_beverages 
                 
df_application['bevarage'] = beverages
```


```python
cond1 = (~df_application.bevarage & df_application['nutrition_grade_fr'].isna() & (df_application['nutrition-score-fr_100g'] <= -1))
cond2 = (~df_application.bevarage & df_application['nutrition_grade_fr'].isna() & ((df_application['nutrition-score-fr_100g'] > -1) & (df_application['nutrition-score-fr_100g'] <= 2)))
cond3 = (~df_application.bevarage & df_application['nutrition_grade_fr'].isna() & ((df_application['nutrition-score-fr_100g'] > 2) & (df_application['nutrition-score-fr_100g'] <= 10)))
cond4 = (~df_application.bevarage & df_application['nutrition_grade_fr'].isna() & ((df_application['nutrition-score-fr_100g'] > 10) & (df_application['nutrition-score-fr_100g'] <= 18)))
cond5 = (~df_application.bevarage & df_application['nutrition_grade_fr'].isna() & ((df_application['nutrition-score-fr_100g'] > 18)))
cond6 = (df_application.bevarage & df_application['nutrition_grade_fr'].isna() & ((df_application['nutrition-score-fr_100g'] <= -1)))
cond7 = (df_application.bevarage & df_application['nutrition_grade_fr'].isna() & ((df_application['nutrition-score-fr_100g'] > -1) & (df_application['nutrition-score-fr_100g'] <= 1)))
cond8 = (df_application.bevarage & df_application['nutrition_grade_fr'].isna() & ((df_application['nutrition-score-fr_100g'] > 1) & (df_application['nutrition-score-fr_100g'] <= 5)))
cond9 = df_application.bevarage & df_application['nutrition_grade_fr'].isna() & (df_application['nutrition-score-fr_100g'] > 5) & (df_application['nutrition-score-fr_100g'] <= 9)
cond10 = df_application.bevarage & df_application['nutrition_grade_fr'].isna() & (df_application['nutrition-score-fr_100g'] > 9)
```


```python

df_application.loc[cond1, 'nutrition_grade_fr'] = 'a'
df_application.loc[cond2, 'nutrition_grade_fr'] = 'b'
df_application.loc[cond3, 'nutrition_grade_fr'] = 'c'
df_application.loc[cond4, 'nutrition_grade_fr'] = 'd'
df_application.loc[cond5, 'nutrition_grade_fr'] = 'e'

df_application.loc[cond6, 'nutrition_grade_fr'] = 'a'
df_application.loc[cond7, 'nutrition_grade_fr'] = 'b'
df_application.loc[cond8, 'nutrition_grade_fr'] = 'c'
df_application.loc[cond9, 'nutrition_grade_fr'] = 'd'
df_application.loc[cond10, 'nutrition_grade_fr'] = 'e'
```

Finally, save the dataset.

```python
df_application.to_csv('data/df_app.csv', index = False, header=True)
```


The next step of this project was to use the selected data and create an application that is helping people to choose their food regardless of the nutrition they need.


