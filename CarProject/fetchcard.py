import requests, logging 

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
    
if __name__ == '__main__':
    logging.basicConfig(level = logging.INFO)
    result = fetchData('https://db.ygoprodeck.com/api/v7/cardinfo.php',{'archetype':'Dark Magician'})
    print(result)
        
