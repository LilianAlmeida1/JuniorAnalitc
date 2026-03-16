##Importando o pacote e os arquivos

import pandas as pd

# Carregar o arquivo
df_customers = pd.read_csv('olist_customers_dataset.csv', sep=',')
df_geolocation = pd.read_csv('olist_geolocation_dataset.csv', sep=';',
                           on_bad_lines='skip', 
                            engine='python')
df_order_items = pd.read_csv('olist_order_items_dataset.csv',sep=',')
df_paments = pd.read_csv('olist_order_payments_dataset.csv', sep= ',')
df_reviews = pd.read_csv('olist_order_reviews_dataset.csv', sep=',')
df_orders = pd.read_csv('olist_orders_dataset.csv', sep= ',')
df_products = pd.read_csv('olist_products_dataset.csv', sep= ',')
df_category = pd.read_csv('product_category_name_translation.csv', sep=',')
# %% Apaguei os DF importados de forma incorreta
del df_geolocation

##Resolvendo problemas de importação de arquivo csv
import pandas as pd

try:
    df_reviews = pd.read_csv('olist_order_reviews_dataset.csv', sep=',')
    print("Sucesso!")
except pd.errors.EmptyDataError:
    print("O arquivo está realmente vazio. Verifique a origem do arquivo.")
# %%# Verificar se a coluna é única

total_linhas = len(df_order_items)
valores_unicos = df_order_items['product_id'].nunique()

if total_linhas == valores_unicos:
    print("Candidata a PK: Sim (Não há duplicatas)")
else:
    print(f"Candidata a PK: Não (Há {total_linhas - valores_unicos} repetições)")
    
    
    total_linhas = len(df_order_items)
    valores_unicos = df_customers['order_id'].nunique()

    if total_linhas == valores_unicos:
        print("Candidata a PK: Sim (Não há duplicatas)")
    else:
        print(f"Candidata a PK: Não (Há {total_linhas - valores_unicos} repetições)")
# %% Informações gerais das tabelas
        
        df_order_items.info()
        df_category.info()
        df_customers.info()
        df_order_items.info()
        df_orders.info()
        df_paments.info()
        df_products.info()
        df_reviews.info()