import requests

def fetchData(url,params):
    response = requests.get(url,params = params)
    
    if response.status_code == 200:
        print('Successful connection')
        response_body = response.json()

        return response_body

    else:
        print('Connection failed...')
        print(response.status_code)
        return 'Error'
    
#def search_feature(data):
    

if __name__ == '__main__':
    print(fetchData('https://db.ygoprodeck.com/api/v7/cardinfo.php',{'archetype':'Dark Magician'}))