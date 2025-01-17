import requests, logging, json

url = 'https://db.ygoprodeck.com/api/v7/cardinfo.php'
param = {'archetype':'Prank-Kids'}

# Retriving data from the ygoprodeck api 

def fetchData(url,params) -> dict:
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

    # for loop to retrieve wanted the fields like name, image and attack
    for card in response_list:
        card_name = card.get('name',None)
        card_image = card.get('card_images',[{}])[0].get('image_url','Unavailable')
        card_atk = card.get('atk',None)
        card_def = card.get('def',None)
        card_type = card.get('type',None)
        
        # creating instance of each card
        cardInstance = Cardentity(Card_name= card_name,Card_atk = card_atk, Card_def = card_def,Card_type = card_type,Card_image = card_image)

        # card_dict = {
        #     'name' : card_name,
        #     'atk' : card_atk,
        #     'def': card_def,
        #     'type': card_type,
        #     'image': card_image
        #     }
        
        # card_json = json.dumps(card_dict)
        card_list.append(cardInstance)

    return card_list

# save images into data base 
# so before it pulls from the site it checks if it is in the data 
# and to save on resources we would check the database for the images 

from sqlalchemy import create_engine, Column, Integer, String, URL
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

engine = create_engine('sqlite:///cards.db')
Base = declarative_base()

class Cardentity(Base):
    __tablename__ = 'cards'
    Card_id = Column(Integer,primary_key=True)
    Card_name = Column(String)
    Card_atk = Column(Integer)
    Card_def = Column(Integer)
    Card_type = Column(String)
    Card_image = Column(String)

Base.metadata.create_all(engine)

# Creating a session 

def Sessionhandler(card_list: list):
    Session = sessionmaker(bind = engine)  #binding engine
    
    session = Session()  #session creation
    
    try:
        # I'm pulling the existing card names in the database
        existing_card_names = {card.Card_name for card in session.query(Cardentity.Card_name).all()}

        # Filter out the cards that are already in the database
        new_cards = [card for card in card_list if card.Card_name not in existing_card_names]

        if new_cards:
            session.add_all(new_cards)


        session.commit()
        # images = [card.Card_image for card in session.query(Cardentity.Card_image).all()]
        # print(existing_card_names,images)

    except Exception as e:
        session.rollback()
        print(f'An error occurred {e}')

    finally:
        session.close()
#############################################################


if __name__ == '__main__':
    logging.basicConfig(level = logging.INFO)
    result = fetchData(url,param)
    data = processData()
    print(data)
    Sessionhandler(data)


      