import requests, logging 

url = 'https://db.ygoprodeck.com/api/v7/cardinfo.php'
param = {'archetype':'Dark Magician'}

def fetchData(url,params):
    try:
        response = requests.get(url,
                                params = params,
                                timeout=10
                                )
        
        response.raise_for_status()
        logging.info('Successful connection')

        try: 
            return response.json()
        
        except ValueError:
            logging.error('Response is not valid JSON')
            return {'error': 'Invalid JSON Format'}
    
    except requests.exceptions.RequestException as e:
        logging.error(f'Connection failed: {e}')
        return {'error' : str(e)}
    
# i think i would want to process the images gathered

def processData():
   # i wnat to get image
    response_list = fetchData(url,param).get('data')
    card_list = []

    for card in response_list:
        card_list.append(card.get('name'))
    return card_list

if __name__ == '__main__':
    logging.basicConfig(level = logging.INFO)
    result = fetchData(url,param)
    print(processData())

      