import requests, logging, json
from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base



url = 'https://db.ygoprodeck.com/api/v7/cardinfo.php'
param = {'archetype':'Dark Magician'}

def fetchData(url,params) -> json:
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
            return json.dumps({'error': 'Invalid JSON Format'})
    
    except requests.exceptions.RequestException as e:
        logging.error(f'Connection failed: {e}')
        return json.dumps({'error' : str(e)})
    
# i think i would want to process the images gathered

def processData() -> list:
   # i wnat to get image
    response_list = fetchData(url,param).get('data')
    card_list = []

    for card in response_list:
        card_name = card.get('name','Unknown')
        card_image = card.get('card_images',[{}])[0].get('image_url','Unavailable')
        card_atk = card.get('atk','N/A')
        card_def = card.get('def','N/A')
        card_type = card.get('type','Unknown')

        card_dict = {
            'name' : card_name,
            'atk' : card_atk,
            'def': card_def,
            'type': card_type,
            'image': card_image
            }
        
        card_json = json.dumps(card_dict)
        card_list.append(card_json)

    return card_list

# save images into data base 
# so before it pulls from the site it checks if it is in the data 
# and to save on resources we would check the database for the images 

engine = create_engine('sqlite:///cards.db')
Base = declarative_base()

class Cardentity(Base):
    __tablename__ = 'cards'
    id = Column(Integer,primary_key=True)
    

if __name__ == '__main__':
    logging.basicConfig(level = logging.INFO)
    result = fetchData(url,param)
    print(processData())

      