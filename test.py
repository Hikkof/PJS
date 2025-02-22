import json
import os


with open(f"{os.path.dirname(os.path.abspath(__file__))}\configuration\menu.json") as f:
    j = json.load(f)


food = 'Lasagne'

for i in j['items']:
    if food == i['name']:
        pass

if food in j['items']['name']:
    print("y")
else:
    print("n")
'''
for day in j['items']:
    print(f"The restaurant is open from {j['items'][day_entity]['open']} to {j['items'][day_entity]['close']}")
    #if day_entity ==
'''

# can I get a Lasagne